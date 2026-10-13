1:"$Sreact.fragment"
2:"/_next/static/chunks/3jiel8xif5lpm.js"
3:I[39756,["$2"],"default"]
4:I[37457,["$2"],"default"]
5:I[43880,["$2"],"Analytics"]
6:I[57215,["$2"],"SpeedInsights"]
b:I[97367,["$2"],"OutletBoundary"]
c:"$Sreact.suspense"
e:"ViewportBoundary"
f:I[97367,["$2"],"$e"]
11:"MetadataBoundary"
12:I[97367,["$2"],"$11"]
14:I[68027,["$2"],"default",1]
8:X
9:[["children",{"s":"__PAGE__","h":512,"d":{"r":["$","$1","c",{"children":["$La",[["$","script","script-0",{"src":"/_next/static/chunks/1wsrh4atp3cd0.js","async":true,"nonce":"$undefined"}]],["$","$Lb",null,{"children":["$","$c",null,{"name":"Next.MetadataOutlet","children":"$@d"}]}]]}],"p":false,"v":null}}]]
7:[["children",{"s":{"n":"slug","t":"d","k":"members","s":["css","js"]},"h":512,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}],"p":false,"v":"$8"},"c":"$Q9"}]]
0:{"P":null,"c":["","members"],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Lf",null,{"children":"$L10"}],["$","$L12",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$c",null,{"name":"Next.Metadata","children":"$L13"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$14",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
8:C
10:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
d:null
13:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
15:"/_next/static/chunks/1wsrh4atp3cd0.js"
16:I[15365,["$2","$15"],"default"]
17:T38ae,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Members · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">👥 Members <span class="bn" style="font-size:12px;font-weight:400;color:var(--t3)">সদস্য ব্যবস্থাপনা</span></h1>
    <p class="cs">Add doctor and staff profiles with individual sign-in accounts. Doctors can use Prescriptions and Stock; staff can use their assigned staff modules.</p>
    <div class="card">
      <div class="member-toolbar">
        <div class="rtabs" role="tablist" aria-label="Member type">
          <button class="rtab on" id="doctors-tab" role="tab" aria-selected="true" aria-controls="mem-doc-sec" onclick="selMemberTab('doctor',this)">Doctors <span id="doctor-count">(0)</span></button>
          <button class="rtab" id="staff-tab" role="tab" aria-selected="false" aria-controls="mem-staff-sec" onclick="selMemberTab('staff',this)">Staff <span id="staff-count">(0)</span></button>
        </div>
        <label class="member-search">
          <span class="sr-only">Search members</span>
          <input type="search" id="member-search" placeholder="Search by name, phone, specialty..." autocomplete="off">
        </label>
      </div>
      <div id="mem-doc-sec" role="tabpanel" aria-labelledby="doctors-tab">
        <div class="member-section-head">
          <div><div class="ct">Doctors</div><div class="cs">Doctor profiles and chamber details</div></div>
          <button class="btn bp bsm" id="add-doctor-btn" type="button">➕ Add Doctor</button>
        </div>
        <div id="doclist"><div class="al ali">⏳ Loading...</div></div>
      </div>
      <div id="mem-staff-sec" role="tabpanel" aria-labelledby="staff-tab" style="display:none">
        <div class="member-section-head">
          <div><div class="ct">Staff</div><div class="cs">Staff roles and contact details</div></div>
          <button class="btn bp bsm" id="add-staff-btn" type="button">➕ Add Staff</button>
        </div>
        <div id="stafflist"><div class="al ali">⏳ Loading...</div></div>
      </div>
    </div>
  </div>
</div>
<!-- ADD DOCTOR MODAL -->
<div class="mbg" id="mdoc">
  <div class="modal">
    <div class="mhandle"></div>
    <div class="mtitle">👨‍⚕️ Add Doctor</div>
    <div class="row r2">
      <div class="fg full"><label for="ndname">Full Name</label><input type="text" id="ndname" placeholder="Dr. ..." maxlength="100" autocomplete="name" required></div>
      <div class="fg full"><label for="ndemail">Doctor's Email</label><input type="email" id="ndemail" placeholder="doctor@example.com" maxlength="254" autocomplete="off" required></div>
      <div class="fg full"><label for="ndpassword">Temporary Password</label><input type="password" id="ndpassword" placeholder="At least 6 characters" minlength="6" autocomplete="new-password" required></div>
      <div class="fg full"><label for="nddeg">Qualifications</label><input type="text" id="nddeg" placeholder="MBBS, BDS..." maxlength="160"></div>
      <div class="fg"><label for="ndspec">Speciality</label><input type="text" id="ndspec" placeholder="Skin, General..." maxlength="160"></div>
      <div class="fg"><label for="ndphone">Phone</label><input type="tel" id="ndphone" placeholder="01XXXXXXXXX" maxlength="30"></div>
      <div class="fg full"><label for="nddays">Chamber Days/Time</label><input type="text" id="nddays" placeholder="e.g. Sat-Thu 5pm-9pm" maxlength="100"></div>
    </div>
    <div class="brow">
      <button class="btn bp" id="savedocbtn" onclick="saveDoc()">✓ Save Doctor</button>
      <button class="btn bs" id="cancel-doctor-btn" type="button">Cancel</button>
    </div>
  </div>
</div>

<!-- ADD STAFF MODAL -->
<div class="mbg" id="mstaff">
  <div class="modal">
    <div class="mhandle"></div>
    <div class="mtitle">🧑‍💼 Add Staff</div>
    <div class="row r2">
      <div class="fg full"><label for="nsname">Full Name</label><input type="text" id="nsname" placeholder="Name..." maxlength="100" autocomplete="name" required></div>
      <div class="fg full"><label for="nsemail">Staff Email</label><input type="email" id="nsemail" placeholder="staff@example.com" maxlength="254" autocomplete="off" required></div>
      <div class="fg full"><label for="nspassword">Temporary Password</label><input type="password" id="nspassword" placeholder="At least 6 characters" minlength="6" autocomplete="new-password" required></div>
      <div class="fg"><label for="nsrole">Role/Designation</label><input type="text" id="nsrole" placeholder="Manager, Nurse..." maxlength="100"></div>
      <div class="fg"><label for="nsphone">Phone</label><input type="tel" id="nsphone" placeholder="01XXXXXXXXX" maxlength="30"></div>
    </div>
    <div class="brow">
      <button class="btn bp" id="savestaffbtn" onclick="saveStaff()">✓ Save Staff</button>
      <button class="btn bs" id="cancel-staff-btn" type="button">Cancel</button>
    </div>
  </div>
</div>
<div id="pa"></div>

<script type="module">
import { loadMembers, requireRole, renderHeader, openModal, closeModal, sync, fdel, createDoctorAccount, createStaffAccount, revokeMemberAccess, DOCS, STAFF } from './js/core.js';

const session = await requireRole(['admin']);
if(session){
  renderHeader();
  document.getElementById('app').classList.add('on');
  document.getElementById('add-doctor-btn').addEventListener('click',()=>openModal('mdoc'));
  document.getElementById('add-staff-btn').addEventListener('click',()=>openModal('mstaff'));
  document.getElementById('cancel-doctor-btn').addEventListener('click',()=>closeModal('mdoc'));
  document.getElementById('cancel-staff-btn').addEventListener('click',()=>closeModal('mstaff'));
  document.getElementById('member-search').addEventListener('input',()=>{
    renderDocList();
    renderStaffList();
  });
  try{
    await refreshMembers();
  }catch(error){
    console.error('Members startup failed:',error);
    const message=
      error.code==='permission-denied'
        ? 'Firestore denied access. Confirm you are signed in as an admin and the user_roles document is correct.'
        : 'Could not load member profiles: '+(error.message||'Unknown error');
    document.getElementById('doclist').innerHTML='<div class="al ale">'+escapeHTML(message)+'</div>';
    document.getElementById('stafflist').innerHTML='<div class="al ale">'+escapeHTML(message)+'</div>';
  }
}

window.selMemberTab=function(t,btn){
  document.querySelectorAll('[role="tab"]').forEach(b=>{
    b.classList.remove('on');
    b.setAttribute('aria-selected','false');
  });
  btn.classList.add('on');
  btn.setAttribute('aria-selected','true');
  document.getElementById('mem-doc-sec').style.display   = t==='doctor'?'block':'none';
  document.getElementById('mem-staff-sec').style.display = t==='staff'?'block':'none';
};

function escapeHTML(value){
  return String(value||'').replace(/[&<>"']/g,char=>({
    '&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'
  })[char]);
}

function matchesSearch(values){
  const search=document.getElementById('member-search').value.trim().toLowerCase();
  return !search||values.some(value=>String(value||'').toLowerCase().includes(search));
}

async function refreshMembers(){
  await loadMembers();
  renderDocList();
  renderStaffList();
}

function renderDocList(){
  const el=document.getElementById('doclist');
  document.getElementById('doctor-count').textContent='('+DOCS.length+')';
  const doctors=DOCS.filter(d=>matchesSearch([d.name,d.deg,d.spec,d.phone,d.days]));
  if(!doctors.length){
    el.innerHTML='<div class="al ali">'+(DOCS.length?'No doctors match your search.':'No doctor profiles yet. Use “Add Doctor” to create one.')+'</div>';
    return;
  }
  el.innerHTML=doctors.map(d=>'<div class="dc2">'+
    '<div class="dav">'+escapeHTML((d.name||'?').replace('Dr. ','').trim().charAt(0))+'</div>'+
    '<div class="dinfo">'+
      '<div class="dname">'+escapeHTML(d.name)+'</div>'+
      '<div class="ddeg">'+escapeHTML(d.deg)+(d.spec?' · '+escapeHTML(d.spec):'')+'</div>'+
      '<div class="dph">📞 '+escapeHTML(d.phone||'—')+(d.days?' · '+escapeHTML(d.days):'')+'</div>'+
      (d.isFounder?'<span class="badge bok" style="margin-top:3px">Founder</span>':'')+
      (d.isCoFounder?'<span class="badge" style="background:var(--gold-l);color:var(--gold);margin-top:3px">Co-Founder</span>':'')+
    '</div>'+
    (!d.isFounder&&!d.isCoFounder?'<button class="btn bd bsm" type="button" data-delete-doctor="'+escapeHTML(d.id)+'" aria-label="Delete '+escapeHTML(d.name)+'">🗑️</button>':'')+
  '</div>').join('');
  el.querySelectorAll('[data-delete-doctor]').forEach(button=>{
    button.addEventListener('click',()=>window.delDoc(button.dataset.deleteDoctor));
  });
}

window.saveDoc=async function(){
  const name=document.getElementById('ndname').value.trim();
  if(!name){ alert('Enter doctor name!'); document.getElementById('ndname').focus(); return; }
  const email=document.getElementById('ndemail').value.trim();
  const password=document.getElementById('ndpassword').value;
  if(!email||!document.getElementById('ndemail').validity.valid){ alert('Enter a valid doctor email address.'); document.getElementById('ndemail').focus(); return; }
  if(password.length<6){ alert('Temporary password must be at least 6 characters.'); document.getElementById('ndpassword').focus(); return; }
  const btn=document.getElementById('savedocbtn');
  btn.innerHTML='<span class="sp"></span>Saving...'; btn.disabled=true;
  try{
    await createDoctorAccount({
      email,password,name,
      deg:document.getElementById('nddeg').value.trim(),
      spec:document.getElementById('ndspec').value.trim(),
      phone:document.getElementById('ndphone').value.trim(),
      days:document.getElementById('nddays').value.trim()
    });
    await refreshMembers();
    closeModal('mdoc');
    ['ndname','ndemail','ndpassword','nddeg','ndspec','ndphone','nddays'].forEach(id=>{ document.getElementById(id).value=''; });
    sync('✅ Doctor account and profile added!');
    alert('Doctor account created. Share the email and temporary password with the doctor securely.');
  }catch(e){ console.error('saveDoc error:',e); alert('❌ Failed to create doctor account: '+(e.message||'Unknown error')); }
  finally{ btn.innerHTML='✓ Save Doctor'; btn.disabled=false; }
};

window.delDoc=async function(id){
  if(!confirm('Delete this doctor profile and revoke its app access? The Firebase Authentication account will remain but cannot access clinic data.')) return;
  try{
    await revokeMemberAccess(id);
    await fdel('doctors',id);
    await refreshMembers();
    sync('✅ Doctor profile removed and access revoked.');
  }catch(e){ console.error('Delete doctor failed:',e); alert('Failed: '+e.message); }
};

function renderStaffList(){
  const el=document.getElementById('stafflist');
  document.getElementById('staff-count').textContent='('+STAFF.length+')';
  const staff=STAFF.filter(s=>matchesSearch([s.name,s.role,s.phone]));
  if(!staff.length){
    el.innerHTML='<div class="al ali">'+(STAFF.length?'No staff match your search.':'No staff profiles yet. Use “Add Staff” to create one.')+'</div>';
    return;
  }
  el.innerHTML=staff.map(s=>'<div class="dc2">'+
    '<div class="dav">'+escapeHTML((s.name||'?').charAt(0).toUpperCase())+'</div>'+
    '<div class="dinfo">'+
      '<div class="dname">'+escapeHTML(s.name)+'</div>'+
      '<div class="ddeg">'+escapeHTML(s.role||'Staff')+'</div>'+
      '<div class="dph">📞 '+escapeHTML(s.phone||'—')+'</div>'+
    '</div>'+
    '<button class="btn bd bsm" type="button" data-delete-staff="'+escapeHTML(s.id)+'" aria-label="Delete '+escapeHTML(s.name)+'">🗑️</button>'+
  '</div>').join('');
  el.querySelectorAll('[data-delete-staff]').forEach(button=>{
    button.addEventListener('click',()=>window.delStaff(button.dataset.deleteStaff));
  });
}

window.saveStaff=async function(){
  const name=document.getElementById('nsname').value.trim();
  if(!name){ alert('Enter staff name!'); document.getElementById('nsname').focus(); return; }
  const email=document.getElementById('nsemail').value.trim();
  const password=document.getElementById('nspassword').value;
  if(!email||!document.getElementById('nsemail').validity.valid){ alert('Enter a valid staff email address.'); document.getElementById('nsemail').focus(); return; }
  if(password.length<6){ alert('Temporary password must be at least 6 characters.'); document.getElementById('nspassword').focus(); return; }
  const btn=document.getElementById('savestaffbtn');
  btn.innerHTML='<span class="sp"></span>Saving...'; btn.disabled=true;
  try{
    await createStaffAccount({
      email,password,name,
      role:document.getElementById('nsrole').value.trim(),
      phone:document.getElementById('nsphone').value.trim()
    });
    await refreshMembers();
    closeModal('mstaff');
    ['nsname','nsemail','nspassword','nsrole','nsphone'].forEach(id=>{ document.getElementById(id).value=''; });
    sync('✅ Staff account and profile added!');
    alert('Staff account created. Share the email and temporary password with the staff member securely.');
  }catch(e){ console.error('saveStaff error:',e); alert('❌ Failed to create staff account: '+(e.message||'Unknown error')); }
  finally{ btn.innerHTML='✓ Save Staff'; btn.disabled=false; }
};

window.delStaff=async function(id){
  if(!confirm('Delete this staff profile and revoke its app access? The Firebase Authentication account will remain but cannot access clinic data.')) return;
  try{
    await revokeMemberAccess(id);
    await fdel('staff',id);
    await refreshMembers();
    sync('✅ Staff profile removed and access revoked.');
  }catch(e){ console.error('Delete staff failed:',e); alert('Failed: '+e.message); }
};

</script>
</body>
</html>
a:["$","$L16",null,{"html":"$17"}]
