// core.js — shared data layer, auth, session & navigation for AIMH Clinic System
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
import {
  getFirestore, collection, doc, getDocs, addDoc, setDoc,
  updateDoc, deleteDoc, query, orderBy, limit, getDoc
} from "https://www.gstatic.com/firebasejs/10.12.0/firebase-firestore.js";

// ── Firebase init ──────────────────────────────────────────────
const fbApp = initializeApp({
  apiKey:"AIzaSyAurv_cYagJZZ4v8tRGsznSz4fZdTvSofI",
  authDomain:"aimh-clinic.firebaseapp.com",
  projectId:"aimh-clinic",
  storageBucket:"aimh-clinic.firebasestorage.app",
  messagingSenderId:"1096968366081",
  appId:"1:1096968366081:web:2da7e0540cca7ad7687800"
});
const db = getFirestore(fbApp);

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
export const SYS_PASS = { staff:'5678', admin:'admin123' };
export const ROLE_ICONS = { doctor:'👨‍⚕️', staff:'🧑‍💼', admin:'🔐' };
export const ROLE_NAMES = { doctor:'Doctor', staff:'Staff', admin:'Admin' };

// ── Default seeds ─────────────────────────────────────────────
const SEED_INV=[
  {name:'Tablet Artica 25',type:'Tablet',company:'ACI Pharma',stock:20,buy:0,sell:0,reorder:15},
  {name:'Syrup Ace 60ml',type:'Syrup',company:'Square Pharma',stock:12,buy:22,sell:35,reorder:10},
  {name:'Tablet Montilab 10mg',type:'Tablet',company:'ACME',stock:30,buy:8,sell:12,reorder:20},
  {name:'Cream Dermasoft',type:'Cream',company:'Team Pharma',stock:5,buy:80,sell:137,reorder:5},
  {name:'Syrup Prosma',type:'Syrup',company:'Incepta',stock:8,buy:35,sell:55,reorder:8},
  {name:'Syrup Azikil',type:'Syrup',company:'One Pharma',stock:15,buy:0,sell:0,reorder:5},
  {name:'Inhaler Sultolin',type:'Inhaler',company:'Square Pharma',stock:6,buy:0,sell:0,reorder:5},
  {name:'Saline Orsaline N',type:'Saline',company:'SMC',stock:50,buy:4,sell:6,reorder:20},
  {name:'Tablet Cetirizine 10mg',type:'Tablet',company:'Beximco',stock:40,buy:3,sell:5,reorder:20},
  {name:'Tablet Omeprazole 20mg',type:'Tablet',company:'Incepta',stock:25,buy:4,sell:7,reorder:15},
  {name:'Syrup Napa 60ml',type:'Syrup',company:'Beximco',stock:18,buy:18,sell:28,reorder:10},
  {name:'Cream Hypomer Gel',type:'Cream',company:'Aristo Pharma',stock:7,buy:180,sell:250,reorder:5},
  {name:'Tablet Amoxicillin 500mg',type:'Tablet',company:'Square Pharma',stock:60,buy:5,sell:8,reorder:30},
  {name:'Syrup Amoxicillin 125mg',type:'Syrup',company:'Square Pharma',stock:12,buy:40,sell:65,reorder:8},
  {name:'Tablet Metronidazole 400mg',type:'Tablet',company:'ACI Pharma',stock:35,buy:3,sell:5,reorder:20},
  {name:'Tablet Paracetamol 500mg',type:'Tablet',company:'Beximco',stock:100,buy:1,sell:2,reorder:40},
  {name:'Syrup Zimax 200mg',type:'Syrup',company:'Square Pharma',stock:10,buy:45,sell:70,reorder:8},
  {name:'Drop Opticrom',type:'Drop',company:'Sanofi',stock:10,buy:60,sell:90,reorder:5},
  {name:'Injection AV',type:'Injection',company:'Incepta',stock:15,buy:120,sell:180,reorder:5},
  {name:'Tablet Vitamin C 250mg',type:'Tablet',company:'ACME',stock:80,buy:1,sell:2,reorder:30},
];
const SEED_DOCS=[
  {name:'Dr. Md. Omar Farook',deg:'B.D.RMP-DMS, MCHC (Dhaka)',spec:'Skin, Sex & General Medicine',phone:'01830079952',days:'Daily 5pm–9pm',pass:'1234',isFounder:true},
  {name:'Ashraful Islam',deg:'Co-Founder & Manager',spec:'Clinic Administration',phone:'01884794060',days:'Available on request',pass:'',isCoFounder:true},
];

async function seedIfEmpty(){
  try{
    const is=await getDocs(col('inventory'));
    if(is.empty) for(const i of SEED_INV) await fadd('inventory',{...i,ca:new Date().toISOString()});
    const ds=await getDocs(col('doctors'));
    if(ds.empty) for(const d of SEED_DOCS) await fadd('doctors',{...d,ca:new Date().toISOString()});
    const ss=await getDocs(col('staff'));
    if(ss.empty) await fadd('staff',{name:'Default Staff',pass:'5678',ca:new Date().toISOString()});
  }catch(e){console.warn('Seed skip:',e.code);}
}

// ── Load all data (call once per page) ────────────────────────
export async function loadAll(){
  await seedIfEmpty();
  const [inv,docs,staff,comps,pts,rxs,bills] = await Promise.all([
    getDocs(col('inventory')),
    getDocs(col('doctors')),
    getDocs(col('staff')),
    getDocs(col('company_bills')),
    getDocs(query(col('patients'),orderBy('lastVisit','desc'))),
    getDocs(query(col('prescriptions'),orderBy('date','desc'),limit(100))),
    getDocs(query(col('bills'),orderBy('date','desc'),limit(100))),
  ]);
  INV   = inv.docs.map(d=>({id:d.id,...d.data()}));
  DOCS  = docs.docs.map(d=>({id:d.id,...d.data()}));
  STAFF = staff.docs.map(d=>({id:d.id,...d.data()}));
  COMPS = comps.docs.map(d=>({id:d.id,...d.data()}));
  PTS   = pts.docs.map(d=>({id:d.id,...d.data()}));
  RXS   = rxs.docs.map(d=>({id:d.id,...d.data()}));
  BILLS = bills.docs.map(d=>({id:d.id,...d.data()}));
}

// ── Session ────────────────────────────────────────────────────
const SKEY='aimh_session';
export function getSession(){ try{ return JSON.parse(localStorage.getItem(SKEY)); }catch(e){ return null; } }
export function setSession(s){ localStorage.setItem(SKEY, JSON.stringify(s)); }
export function clearSession(){ localStorage.removeItem(SKEY); }
export function logout(){ if(!confirm('Logout?')) return; clearSession(); location.href='index.html'; }

// ── Page guard: redirect to login if not allowed ──────────────
export function requireRole(allowed){
  const s=getSession();
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
    {href:'passwords.html',icon:'🔑',label:'Passwords'},
    {href:'overall_reports.html',icon:'📊',label:'Reports'},
    {href:'company_bill.html',icon:'🏢',label:'Co Bills'},
  ]
};

// ── Header + nav renderer ─────────────────────────────────────
export function renderHeader(){
  const s=getSession(); if(!s) return;
  const me=DOCS.find(d=>d.id===s.myDocId);
  const uname=(ROLE_ICONS[s.role]||'')+(me?me.name.replace('Dr. Md.','Dr.'):ROLE_NAMES[s.role]);
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
