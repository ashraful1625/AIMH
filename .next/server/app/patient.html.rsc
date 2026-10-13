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
7:[["children",{"s":{"n":"slug","t":"d","k":"patient.html","s":["css","js"]},"h":512,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}],"p":false,"v":"$8"},"c":"$Q9"}]]
0:{"P":null,"c":["","patient.html"],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Lf",null,{"children":"$L10"}],["$","$L12",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$c",null,{"name":"Next.Metadata","children":"$L13"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$14",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
8:C
10:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
d:null
13:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
15:"/_next/static/chunks/1wsrh4atp3cd0.js"
16:I[15365,["$2","$15"],"default"]
17:Ta8a,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Patients · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">👤 Patient Records <span class="bn" style="font-size:12px;font-weight:400;color:var(--t3)">রোগীর তথ্য</span></h1>
    <div class="card">
      <div class="fbar">
        <input type="text" id="ptsearch" placeholder="Name / phone / ID..." oninput="renderPts()">
        <input type="date" id="ptdate" onchange="renderPts()" style="width:auto">
        <button class="btn bs bsm" onclick="document.getElementById('ptdate').value='';renderPts()">✕</button>
      </div>
      <div id="ptlist"></div>
    </div>
  </div>
</div>
<div id="pa"></div>

<script type="module">
import { loadAll, requireRole, renderHeader, PTS } from './js/core.js';

const session = await requireRole(['staff','admin']);
if(session){
  await loadAll();
  renderHeader();
  document.getElementById('app').classList.add('on');
  renderPts();
}

window.renderPts=function(){
  const q=(document.getElementById('ptsearch').value||'').toLowerCase();
  const df=document.getElementById('ptdate').value||'';
  let f=PTS;
  if(q) f=f.filter(p=>(p.name||'').toLowerCase().includes(q)||(p.phone||'').includes(q)||(p.id||'').toLowerCase().includes(q));
  if(df) f=f.filter(p=>p.lastVisit===df);
  const el=document.getElementById('ptlist');
  if(!f.length){ el.innerHTML='<div class="al ali">ℹ️ No patients found.</div>'; return; }
  el.innerHTML=f.map(p=>{
    const lastRxId=p.lastRxId||'';
    return '<div class="pi" '+(lastRxId?'onclick="goToBilling(\''+lastRxId+'\')" style="cursor:pointer"':'')+'>'+
      '<div class="pav">'+(p.name||'?').charAt(0).toUpperCase()+'</div>'+
      '<div class="pinfo"><div class="pname">'+(p.name||'—')+'</div>'+
      '<div class="pmeta">'+(p.gender||'—')+' · Age '+(p.age||'—')+' · '+(p.phone||'—')+'</div>'+
      '<div class="pmeta">Visits:'+(p.visits||1)+' · Last:'+(p.lastVisit||'—')+'</div></div>'+
      (lastRxId?'<div class="pbadge">'+lastRxId+'</div>':'')+
    '</div>';
  }).join('');
};

window.goToBilling=function(rxId){
  if(rxId) location.href='billing.html?rx='+rxId;
};
</script>
</body>
</html>
a:["$","$L16",null,{"html":"$17"}]
