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
7:[["children",{"s":{"n":"slug","t":"d","k":"dashboard","s":["css","js"]},"h":512,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}],"p":false,"v":"$8"},"c":"$Q9"}]]
0:{"P":null,"c":["","dashboard"],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Lf",null,{"children":"$L10"}],["$","$L12",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$c",null,{"name":"Next.Metadata","children":"$L13"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$14",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
8:C
10:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
d:null
13:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
15:"/_next/static/chunks/1wsrh4atp3cd0.js"
16:I[15365,["$2","$15"],"default"]
17:Ta1c,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Dashboard · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="page-error" class="card" role="alert" style="display:none;max-width:520px;margin:24px auto;padding:20px">
  <div class="ct">Dashboard could not load</div>
  <p id="page-error-message" style="margin:8px 0 14px"></p>
  <button class="btn bp bsm" onclick="location.reload()">Retry</button>
</div>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">Clinic Modules</h1>
    <div class="qgrid" id="modules"></div>
  </div>
</div>

<script type="module">
import { requireRole, renderHeader, NAV } from './js/core.js';

const moduleDetails={
  'prescription.html':'Create and manage prescriptions',
  'billing.html':'Process prescription payments',
  'patient.html':'Find and review patient records',
  'stock.html':'View medicine inventory',
  'members.html':'Manage clinic team members',
  'passwords.html':'Manage account access',
  'overall_reports.html':'Review clinic reports',
  'company_bill.html':'Track supplier invoices'
};

try{
  const s = await requireRole(['doctor','staff','admin']);
  if(s){
    renderHeader();

    document.getElementById('modules').innerHTML = NAV[s.role]
      .filter(p => p.href !== 'dashboard.html')
      .map(p => '<a class="qlink" href="'+p.href+'">'+
        '<span class="qi">'+p.icon+'</span>'+
        '<span class="qt">'+p.label+'</span>'+
        '<span class="qd">'+moduleDetails[p.href]+'</span>'+
        '<span class="qopen">Open module <span aria-hidden="true">→</span></span>'+
      '</a>')
      .join('');
    document.getElementById('app').classList.add('on');
  }
}catch(error){
  console.error('Dashboard startup failed:',error);
  document.getElementById('page-error-message').textContent=
    error.code==='permission-denied'
      ? 'Firestore denied access. Verify your Firebase Authentication account and matching user_roles document.'
      : 'Could not finish authentication or load clinic data: '+(error.message||'Unknown error');
  document.getElementById('page-error').style.display='block';
}
</script>
</body>
</html>
a:["$","$L16",null,{"html":"$17"}]
