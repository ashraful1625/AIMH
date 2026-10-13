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
7:[["children",{"s":{"n":"slug","t":"d","k":"stock","s":["css","js"]},"h":512,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}],"p":false,"v":"$8"},"c":"$Q9"}]]
0:{"P":null,"c":["","stock"],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Lf",null,{"children":"$L10"}],["$","$L12",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$c",null,{"name":"Next.Metadata","children":"$L13"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$14",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
8:C
10:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
d:null
13:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
15:"/_next/static/chunks/1wsrh4atp3cd0.js"
16:I[15365,["$2","$15"],"default"]
17:T1811,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Stock · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">💊 Medicine Stock <span class="bn" style="font-size:12px;font-weight:400;color:var(--t3)">ওষুধের স্টক</span></h1>
    <div class="card">
      <div class="fbar">
        <input type="text" id="invsearch" placeholder="Search medicine..." oninput="renderInv(this.value)">
        <button class="btn bp bsm" id="addinvbtn" onclick="openModal('mmed')" style="display:none">➕ Add</button>
      </div>
      <div id="invlist"><div class="al ali">⏳ Loading...</div></div>
    </div>
  </div>
</div>

<!-- ADD MEDICINE MODAL -->
<div class="mbg" id="mmed">
  <div class="modal">
    <div class="mhandle"></div>
    <div class="mtitle">➕ Add Medicine to Inventory</div>
    <div class="row r2">
      <div class="fg full"><label>Medicine Name</label><input type="text" id="nmname" placeholder="e.g. Syrup Napa 60ml"></div>
      <div class="fg"><label>Type</label>
        <select id="nmtype"><option value="Tablet">💊 Tablet</option><option value="Syrup">🍯 Syrup</option><option value="Capsule">💊 Capsule</option><option value="Cream">🧴 Cream</option><option value="Drop">💧 Drop</option><option value="Injection">💉 Injection</option><option value="Inhaler">🌬️ Inhaler</option><option value="Saline">🧪 Saline</option><option value="Other">📦 Other</option></select>
      </div>
      <div class="fg"><label>Company</label><input type="text" id="nmco" placeholder="Square, ACME..."></div>
      <div class="fg"><label>Reorder Level</label><input type="number" id="nmreorder" value="10"></div>
      <div class="fg"><label>Stock Qty</label><input type="number" id="nmstock" value="0"></div>
      <div class="fg"><label>Buy Price ৳</label><input type="number" id="nmbuy" placeholder="0" step="0.01"></div>
      <div class="fg"><label>Sell Price ৳</label><input type="number" id="nmsell" placeholder="0" step="0.01"></div>
    </div>
    <div class="brow">
      <button class="btn bp" id="savemedbtn" onclick="saveMed()">✓ Save Medicine</button>
      <button class="btn bs" onclick="closeModal('mmed')">Cancel</button>
    </div>
  </div>
</div>
<div id="pa"></div>

<script type="module">
import { loadAll, requireRole, renderHeader, getSession, openModal, closeModal, sync, fadd, fupd, INV } from './js/core.js';

const session = await requireRole(['doctor','staff','admin']);
let isAdmin=false;
if(session){
  await loadAll();
  renderHeader();
  document.getElementById('app').classList.add('on');
  isAdmin = session.role==='admin';
  const aib=document.getElementById('addinvbtn');
  if(aib) aib.style.display=isAdmin?'inline-flex':'none';
  renderInv('');
}

const IICO={Tablet:'💊',Syrup:'🍯',Capsule:'💊',Cream:'🧴',Drop:'💧',Injection:'💉',Inhaler:'🌬️',Saline:'🧪',Other:'📦'};

window.renderInv=function(q){
  const s=(q||'').toLowerCase();
  const meds=INV.filter(m=>!s||m.name.toLowerCase().includes(s)||(m.type||'').toLowerCase().includes(s)||(m.company||'').toLowerCase().includes(s));
  const el=document.getElementById('invlist');
  if(!meds.length){ el.innerHTML='<div class="al ali">No medicines found.</div>'; return; }
  el.innerHTML=meds.map(m=>{
    const st=m.stock===0?'<span class="badge bout">Out</span>':m.stock<=m.reorder?'<span class="badge blow">Low ⚠️</span>':'<span class="badge bok">OK ✓</span>';
    const prof=m.buy&&m.sell?'P:৳'+(m.sell-m.buy):'';
    return '<div class="ii">'+
      '<div class="iico">'+(IICO[m.type]||'📦')+'</div>'+
      '<div style="flex:1;min-width:0"><div class="iname">'+m.name+'</div>'+
      '<div class="imeta">'+m.type+' · '+(m.company||'—')+' · Buy:৳'+(m.buy||0)+' · Sell:৳'+(m.sell||0)+(prof?' '+prof:'')+'</div>'+
      '<div style="margin-top:3px">'+st+'</div></div>'+
      '<div class="isa">'+
        (isAdmin?'<button class="sb" onclick="adjStock(\''+m.id+'\',-1)">−</button>':'')+
        '<div class="inum">'+m.stock+'</div>'+
        (isAdmin?'<button class="sb" onclick="adjStock(\''+m.id+'\',1)">+</button>':'')+
      '</div>'+
    '</div>';
  }).join('');
};

window.adjStock=async function(id,delta){
  if(!isAdmin){ alert('Admin only!'); return; }
  const m=INV.find(x=>x.id===id);
  if(!m) return;
  try{ await fupd('inventory',id,{stock:Math.max(0,m.stock+delta)}); }
  catch(e){ console.error('stock update:',e); alert('Failed: '+e.message); }
};

window.saveMed=async function(){
  const name=document.getElementById('nmname').value.trim();
  if(!name){ alert('Enter medicine name!'); return; }
  const btn=document.getElementById('savemedbtn');
  btn.innerHTML='<span class="sp"></span>Saving...'; btn.disabled=true;
  try{
    await fadd('inventory',{
      name,
      type:document.getElementById('nmtype').value,
      company:document.getElementById('nmco').value||'—',
      reorder:parseInt(document.getElementById('nmreorder').value)||10,
      stock:parseInt(document.getElementById('nmstock').value)||0,
      buy:parseFloat(document.getElementById('nmbuy').value)||0,
      sell:parseFloat(document.getElementById('nmsell').value)||0,
      ca:new Date().toISOString()
    });
    closeModal('mmed');
    ['nmname','nmco','nmstock','nmbuy','nmsell'].forEach(id=>{ document.getElementById(id).value=''; });
    document.getElementById('nmreorder').value='10';
    sync('✅ Medicine added!');
  }catch(e){ console.error('saveMed:',e); alert('❌ Failed: '+e.message); }
  finally{ btn.innerHTML='✓ Save Medicine'; btn.disabled=false; }
};
</script>
</body>
</html>
a:["$","$L16",null,{"html":"$17"}]
