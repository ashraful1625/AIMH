// core.js — shared data layer, auth, session & navigation for AIMH Clinic System
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
import {
  getFirestore, collection, doc, getDocs, addDoc, setDoc,
  updateDoc, deleteDoc, query, orderBy, limit, getDoc
} from "https://www.gstatic.com/firebasejs/10.12.0/firebase-firestore.js";
import {
  getAuth, onAuthStateChanged, signInWithEmailAndPassword, signOut
} from "https://www.gstatic.com/firebasejs/10.12.0/firebase-auth.js";

// ── Firebase init ──────────────────────────────────────────────
const fbApp = initializeApp({
  apiKey:"AIzaSyDCemH-vgrftahNerSdqlfVJG9-yaCFqwc",
  authDomain:"aimh-clinic-ashraful.firebaseapp.com",
  projectId:"aimh-clinic-ashraful",
  storageBucket:"aimh-clinic-ashraful.firebasestorage.app",
  messagingSenderId:"745755057160",
  appId:"1:745755057160:web:c45fb16e7c23fc685c85bd"
});
const db = getFirestore(fbApp, "aimh-main");
const auth = getAuth(fbApp);
const authReady = new Promise(resolve => onAuthStateChanged(auth, resolve, error => {
  console.error('Firebase Auth state error:', error);
  resolve(null);
}));

export const col  = n      => collection(db, n);
export const dref = (n,id) => doc(db, n, id);
export const fadd = (n,d)  => addDoc(col(n), d);
export const fset = (n,id,d) => setDoc(dref(n,id), d);
export const fupd = (n,id,d) => updateDoc(dref(n,id), d);
export const fdel = (n,id)   => deleteDoc(dref(n,id));
export const fget = (n,id)   => getDoc(dref(n,id));

// ── Caches (live bindings — populated by loadAll) ─────────────
export let INV=[], PTS=[], RXS=[], BILLS=[], DOCS=[], STAFF=[], COMPS=[];

// ── Constants ─────────────────────────────────────────────────
export const ROLE_ICONS = { doctor:'👨‍⚕️', staff:'🧑‍💼', admin:'🔐' };
export const ROLE_NAMES = { doctor:'Doctor', staff:'Staff', admin:'Admin' };

// ── Load all data (call once per page) ────────────────────────
export async function loadAll(){
  const privileged=!!session && ['staff','admin'].includes(session.role);
  const [inv,docs,staff,comps,pts,rxs,bills] = await Promise.all([
    getDocs(col('inventory')),
    getDocs(col('doctors')),
    session?.role==='admin' ? getDocs(col('staff')) : Promise.resolve({docs:[]}),
    privileged ? getDocs(col('company_bills')) : Promise.resolve({docs:[]}),
    getDocs(query(col('patients'),orderBy('lastVisit','desc'))),
    getDocs(query(col('prescriptions'),orderBy('date','desc'),limit(100))),
    privileged ? getDocs(query(col('bills'),orderBy('date','desc'),limit(100))) : Promise.resolve({docs:[]}),
  ]);
  INV   = inv.docs.map(d=>({id:d.id,...d.data()}));
  DOCS  = docs.docs.map(d=>({id:d.id,...d.data()}));
  STAFF = staff.docs.map(d=>({id:d.id,...d.data()}));
  COMPS = comps.docs.map(d=>({id:d.id,...d.data()}));
  PTS   = pts.docs.map(d=>({id:d.id,...d.data()}));
  RXS   = rxs.docs.map(d=>({id:d.id,...d.data()}));
  BILLS = bills.docs.map(d=>({id:d.id,...d.data()}));
}

// ── Authentication and role profile ───────────────────────────
let session=null;

export function getSession(){ return session; }

async function loadUserSession(user){
  const profile=await fget('user_roles',user.uid);
  if(!profile.exists()){
    throw new Error('This account has no clinic role. Ask an administrator to provision access.');
  }
  const data=profile.data();
  if(!['doctor','staff','admin'].includes(data.role) || typeof data.name!=='string' || !data.name.trim()){
    throw new Error('This account has an invalid clinic role profile. Ask an administrator for help.');
  }
  session={uid:user.uid,role:data.role,myDocId:data.profileId||'',name:data.name,email:user.email};
  return session;
}

export async function restoreSession(){
  const user=await authReady;
  if(!user) return null;
  try{
    return await loadUserSession(user);
  }catch(error){
    console.error('Could not load the clinic access profile:',error);
    await signOut(auth);
    return null;
  }
}

export async function signIn(email,password){
  const credential=await signInWithEmailAndPassword(auth,email,password);
  try{
    return await loadUserSession(credential.user);
  }catch(error){
    await signOut(auth);
    throw error;
  }
}

export async function logout(){
  if(!confirm('Logout?')) return;
  session=null;
  await signOut(auth);
  location.href='index.html';
}

// ── Page guard: redirect to login if not allowed ──────────────
export async function requireRole(allowed){
  const s=await restoreSession();
  if(!s){ location.replace('index.html'); return null; }
  if(allowed && !allowed.includes(s.role)){ location.replace('dashboard.html'); return null; }
  return s;
}

// ── Navigation config ─────────────────────────────────────────
export const NAV = {
  doctor:[
    {href:'dashboard.html',icon:'🏠',label:'Home'},
    {href:'prescription.html',icon:'📋',label:'Rx'},
    {href:'stock.html',icon:'💊',label:'Stock'},
  ],
  staff:[
    {href:'dashboard.html',icon:'🏠',label:'Home'},
    {href:'billing.html',icon:'💰',label:'Billing'},
    {href:'patient.html',icon:'👤',label:'Patients'},
    {href:'stock.html',icon:'💊',label:'Stock'},
    {href:'company_bill.html',icon:'🏢',label:'Co Bills'},
  ],
  admin:[
    {href:'dashboard.html',icon:'🏠',label:'Home'},
    {href:'prescription.html',icon:'📋',label:'Rx'},
    {href:'billing.html',icon:'💰',label:'Billing'},
    {href:'patient.html',icon:'👤',label:'Patients'},
    {href:'stock.html',icon:'💊',label:'Stock'},
    {href:'members.html',icon:'👥',label:'Members'},
    {href:'passwords.html',icon:'🔐',label:'Access'},
    {href:'overall_reports.html',icon:'📊',label:'Reports'},
    {href:'company_bill.html',icon:'🏢',label:'Co Bills'},
  ]
};

// ── Header + nav renderer ─────────────────────────────────────
export function renderHeader(){
  const s=getSession(); if(!s) return;
  const uname=(ROLE_ICONS[s.role]||'')+s.name;
  const cur=(location.pathname.split('/').pop()||'dashboard.html');
  const hdr=document.getElementById('hdr');
  if(hdr) hdr.innerHTML=
    '<div class="hl">'+
      '<div class="hlogo">AI</div>'+
      '<div><div class="htitle">A Islam Medical Hall</div><div class="hsub">Kasba Puratan Bazar, Kasba, Brahmanbaria</div></div>'+
    '</div>'+
    '<div class="hr">'+
      '<div class="huser">'+uname+'</div>'+
      '<div class="hsync" id="hsync">🟢</div>'+
      '<button class="hout" onclick="AIMH.logout()" title="Logout">⏻</button>'+
    '</div>';
  const nav=document.getElementById('nav');
  if(nav) nav.innerHTML=NAV[s.role].map(p=>
    '<a class="nb'+(p.href===cur?' on':'')+'" href="'+p.href+'"><span class="ni">'+p.icon+'</span><span class="nl">'+p.label+'</span></a>'
  ).join('');
}

// ── Toast / sync indicator ────────────────────────────────────
export function sync(m){
  const e=document.getElementById('hsync');
  if(e){ e.textContent=m; setTimeout(()=>{ e.textContent='🟢'; },2500); }
}

// ── Modals ─────────────────────────────────────────────────────
export function openModal(id){ document.getElementById(id)?.classList.add('on'); }
export function closeModal(id){ document.getElementById(id)?.classList.remove('on'); }
document.addEventListener('click',e=>{ if(e.target.classList.contains('mbg')) e.target.classList.remove('on'); });

// ── Print helper ──────────────────────────────────────────────
export function printHTML(html, preview){
  const pa=document.getElementById('pa');
  pa.style.cssText='';
  pa.innerHTML=html; pa.style.display='block';
  if(!preview){ window.print(); pa.style.display='none'; pa.innerHTML=''; }
  else{
    pa.style.cssText='display:block;position:fixed;top:0;left:0;width:100%;height:100%;z-index:9999;background:#fff;overflow-y:auto;padding:16px;-webkit-overflow-scrolling:touch';
    const ctrl=document.createElement('div');
    ctrl.id='pc';
    ctrl.style.cssText='display:flex;gap:8px;margin-bottom:12px;position:sticky;top:0;background:#fff;padding:8px 0;z-index:100;border-bottom:1px solid #eee';
    ctrl.innerHTML='<button class="btn bd bsm" onclick="AIMH.closePrint()">✕ Close</button><button class="btn bp bsm" onclick="window.print()">🖨️ Print</button>';
    pa.prepend(ctrl);
  }
}

window.AIMH = { logout, closePrint() {
  const pa=document.getElementById('pa');
  pa.style.display='none'; pa.innerHTML='';
} };
