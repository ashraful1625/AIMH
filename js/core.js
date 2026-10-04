// core.js — shared data layer, auth, session & navigation for AIMH Clinic System
import { deleteApp, initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
import {
  getFirestore, collection, doc, getDocs, addDoc, setDoc,
  updateDoc, deleteDoc, query, orderBy, limit, getDoc, where
} from "https://www.gstatic.com/firebasejs/10.12.0/firebase-firestore.js";
import {
  getAuth, onAuthStateChanged, signInWithEmailAndPassword, createUserWithEmailAndPassword,
  deleteUser, signOut
} from "https://www.gstatic.com/firebasejs/10.12.0/firebase-auth.js";

// ── Firebase init ──────────────────────────────────────────────
const firebaseConfig = {
  apiKey:"AIzaSyDCemH-vgrftahNerSdqlfVJG9-yaCFqwc",
  authDomain:"aimh-clinic-ashraful.firebaseapp.com",
  projectId:"aimh-clinic-ashraful",
  storageBucket:"aimh-clinic-ashraful.firebasestorage.app",
  messagingSenderId:"745755057160",
  appId:"1:745755057160:web:c45fb16e7c23fc685c85bd"
};
const fbApp = initializeApp(firebaseConfig);
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

export async function loadMembers(){
  if(session?.role!=='admin') throw new Error('Only administrators can load member profiles.');
  const [doctors,staff]=await Promise.all([
    getDocs(col('doctors')),
    getDocs(col('staff'))
  ]);
  DOCS=doctors.docs.map(d=>({id:d.id,...d.data()}));
  STAFF=staff.docs.map(d=>({id:d.id,...d.data()}));
}

export async function createDoctorAccount({email,password,name,deg,spec,phone,days}){
  if(session?.role!=='admin') throw new Error('Only an administrator can add doctor accounts.');
  const provisioner=initializeApp(firebaseConfig,'aimh-doctor-provisioner');
  const provisionerAuth=getAuth(provisioner);
  let user=null;
  let doctorId=null;
  let roleCreated=false;
  try{
    const credential=await createUserWithEmailAndPassword(provisionerAuth,email,password);
    user=credential.user;
    const doctor=await fadd('doctors',{
      name,deg,spec,phone,days,ca:new Date().toISOString()
    });
    doctorId=doctor.id;
    await fset('user_roles',user.uid,{
      uid:user.uid,name,role:'doctor',profileId:doctorId
    });
    roleCreated=true;
    return doctorId;
  }catch(error){
    if(roleCreated && user){
      try{ await fdel('user_roles',user.uid); }
      catch(cleanupError){ console.error('Could not roll back the doctor role:',cleanupError); }
    }
    if(doctorId){
      try{ await fdel('doctors',doctorId); }
      catch(cleanupError){ console.error('Could not roll back the doctor profile:',cleanupError); }
    }
    if(user){
      try{ await deleteUser(user); }
      catch(cleanupError){ console.error('Could not roll back the new Firebase account:',cleanupError); }
    }
    throw error;
  }finally{
    try{ await signOut(provisionerAuth); }
    finally{ await deleteApp(provisioner); }
  }
}

export async function createStaffAccount({email,password,name,role,phone}){
  if(session?.role!=='admin') throw new Error('Only an administrator can add staff accounts.');
  const provisioner=initializeApp(firebaseConfig,'aimh-staff-provisioner');
  const provisionerAuth=getAuth(provisioner);
  let user=null;
  let staffId=null;
  try{
    const credential=await createUserWithEmailAndPassword(provisionerAuth,email,password);
    user=credential.user;
    const staff=await fadd('staff',{
      name,role,phone,ca:new Date().toISOString()
    });
    staffId=staff.id;
    await fset('user_roles',user.uid,{
      uid:user.uid,name,role:'staff',profileId:staffId
    });
    return staffId;
  }catch(error){
    if(staffId){
      try{ await fdel('staff',staffId); }
      catch(cleanupError){ console.error('Could not roll back the staff profile:',cleanupError); }
    }
    if(user){
      try{ await deleteUser(user); }
      catch(cleanupError){ console.error('Could not roll back the new Firebase account:',cleanupError); }
    }
    throw error;
  }finally{
    try{ await signOut(provisionerAuth); }
    finally{ await deleteApp(provisioner); }
  }
}

export async function revokeMemberAccess(profileId){
  if(session?.role!=='admin') throw new Error('Only an administrator can remove member access.');
  const roles=await getDocs(query(col('user_roles'),where('profileId','==',profileId)));
  await Promise.all(roles.docs.map(role=>fdel('user_roles',role.id)));
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
  const hdr=document.getElementById('hdr');
  if(!hdr) return;
  hdr.innerHTML=
    '<div class="hl">'+
      '<div class="hlogo">AI</div>'+
      '<div><div class="htitle">A Islam Medical Hall</div><div class="hsub">Kasba Puratan Bazar, Kasba, Brahmanbaria</div></div>'+
    '</div>'+
    '<div class="hr">'+
      '<button class="menu-toggle" id="account-menu-toggle" type="button" aria-haspopup="true" aria-expanded="false" aria-controls="account-menu">'+
        '<span aria-hidden="true">☰</span><span>Menu</span>'+
      '</button>'+
      '<div class="account-menu" id="account-menu" role="menu" hidden>'+
        '<div class="menu-profile">'+
          '<span class="menu-profile-icon" aria-hidden="true">'+(ROLE_ICONS[s.role]||'👤')+'</span>'+
          '<span><strong id="menu-profile-name"></strong><small id="menu-profile-role"></small><small id="menu-profile-email"></small></span>'+
        '</div>'+
        '<div class="menu-sync"><span>Sync status</span><span class="hsync" id="hsync">🟢</span></div>'+
        '<a class="menu-item" role="menuitem" href="dashboard.html">🏠 <span>Modules</span></a>'+
        '<button class="menu-item" id="menu-faq" type="button" role="menuitem">❔ <span>FAQ</span></button>'+
        '<div class="menu-section-label">Customer service</div>'+
        '<a class="menu-item" role="menuitem" href="tel:01884794060">📞 <span>Ashraful Islam · 01884794060</span></a>'+
        '<a class="menu-item" role="menuitem" href="tel:01830079952">📞 <span>Clinic · 01830079952</span></a>'+
        '<button class="menu-item menu-logout" id="menu-logout" type="button" role="menuitem">⏻ <span>Log out</span></button>'+
      '</div>'+
    '</div>'+
    '<div class="faq-backdrop" id="faq-backdrop" hidden>'+
      '<section class="faq-dialog" role="dialog" aria-modal="true" aria-labelledby="faq-title">'+
        '<button class="faq-close" id="faq-close" type="button" aria-label="Close FAQ">×</button>'+
        '<h2 id="faq-title">Frequently asked questions</h2>'+
        '<h3>How do I access a module?</h3><p>Open the Menu and choose Modules, then select a module card available for your role.</p>'+
        '<h3>Why can’t I sign in?</h3><p>Use the email and password created for you in Firebase Authentication. Contact an administrator if your account has not been assigned a clinic role.</p>'+
        '<h3>Who can help me?</h3><p>Use one of the Customer service phone links in the Menu.</p>'+
      '</section>'+
    '</div>';
  document.getElementById('menu-profile-name').textContent=s.name;
  document.getElementById('menu-profile-role').textContent=ROLE_NAMES[s.role]||s.role;
  document.getElementById('menu-profile-email').textContent=s.email||'';

  const toggle=document.getElementById('account-menu-toggle');
  const menu=document.getElementById('account-menu');
  const closeMenu=()=>{
    menu.hidden=true;
    toggle.setAttribute('aria-expanded','false');
  };
  toggle.addEventListener('click',()=>{
    menu.hidden=!menu.hidden;
    toggle.setAttribute('aria-expanded',String(!menu.hidden));
  });
  document.getElementById('menu-faq').addEventListener('click',()=>{
    closeMenu();
    document.getElementById('faq-backdrop').hidden=false;
    document.getElementById('faq-close').focus();
  });
  document.getElementById('faq-close').addEventListener('click',()=>{
    document.getElementById('faq-backdrop').hidden=true;
    toggle.focus();
  });
  document.getElementById('faq-backdrop').addEventListener('click',event=>{
    if(event.target.id==='faq-backdrop') document.getElementById('faq-backdrop').hidden=true;
  });
  document.getElementById('menu-logout').addEventListener('click',async()=>{
    try{ await logout(); }
    catch(error){ console.error('Logout failed:',error); alert('Logout failed: '+error.message); }
  });
  document.addEventListener('click',event=>{
    if(!menu.hidden && !hdr.contains(event.target)) closeMenu();
  });
  document.addEventListener('keydown',event=>{
    if(event.key==='Escape'){
      closeMenu();
      document.getElementById('faq-backdrop').hidden=true;
    }
  });
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
