1:"$Sreact.fragment"
2:"/_next/static/chunks/3jiel8xif5lpm.js"
3:I[39756,["$2"],"default"]
4:I[37457,["$2"],"default"]
5:I[43880,["$2"],"Analytics"]
6:I[57215,["$2"],"SpeedInsights"]
d:"/_next/static/chunks/1wsrh4atp3cd0.js"
e:I[15365,["$2","$d"],"default"]
13:"ViewportBoundary"
14:I[97367,["$2"],"$13"]
15:"MetadataBoundary"
16:I[97367,["$2"],"$15"]
17:"$Sreact.suspense"
8:X
b:X
b:C
f:T8e4,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account Access · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">🔐 Account Access</h1>
    <div class="card">
      <div class="ct">Provision a clinic account</div>
      <p class="cs">Passwords are managed by Firebase Authentication and are never stored in the clinic database.</p>
      <ol style="padding-left:22px;line-height:1.8">
        <li>In Firebase Console, open <a href="https://console.firebase.google.com/project/aimh-clinic-ashraful/authentication" target="_blank" rel="noopener">Authentication</a> and enable the Email/Password provider. Add <code>ashraful1625.github.io</code> under Authentication settings → Authorized domains.</li>
        <li>Create the staff member's account there and securely give them their temporary password.</li>
        <li>Copy the new account's UID. In Firestore, create <code>user_roles/{uid}</code> using that exact UID as the document ID.</li>
        <li>Add fields: <code>uid</code> (string, same UID), <code>name</code> (string), <code>role</code> (doctor, staff, or admin), and optionally <code>profileId</code> (the corresponding doctor/staff document ID).</li>
        <li>For the first administrator, create the role document in the Firebase Console. Repeat the role-document step there for each account.</li>
      </ol>
      <p class="cs" style="margin-top:12px">To remove access, disable the account in Firebase Authentication and delete its user_roles document. Do not share passwords or grant admin unless required.</p>
    </div>
  </div>
</div>
<script type="module">
import { requireRole, renderHeader } from './js/core.js';

const session=await requireRole(['admin']);
if(session){
  renderHeader();
  document.getElementById('app').classList.add('on');
}
</script>
</body>
</html>
c:[["children",{"s":"__PAGE__","h":160,"d":{"r":["$","$1","c",{"children":[["$","$Le",null,{"html":"$f"}],["$L10"],"$L11"]}],"p":"$@12","v":null,"s":"$8"}}]]
9:[["children",{"s":{"n":"slug","t":"d","k":"passwords.html","s":["css","js"]},"h":96,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","template":["$","$L4",null,{}]}]]}],"p":"$@a","v":"$b","s":"$8"},"c":"$Qc"}]]
0:{"t":{"t":{"s":"","h":80,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","template":["$","$L4",null,{}],"notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]]}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":"$@7","v":null,"s":"$8"},"c":"$Q9"},"h":{"r":["$","$1","h",{"children":[null,["$","$L14",null,{"children":[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]}],["$","$L16",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$17",null,{"name":"Next.Metadata","children":[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]}]}],null]}],null]}],"p":"$@18","v":null,"s":"$8"}},"a":"$@19","u":"$@1a","b":"Cq6reOdvmmVxITcEl95tc"}
1b:I[97367,["$2"],"OutletBoundary"]
10:["$","script","script-0",{"src":"/_next/static/chunks/1wsrh4atp3cd0.js","async":true}]
11:["$","$L1b",null,{"children":["$","$17",null,{"name":"Next.MetadataOutlet","children":"$@1c"}]}]
8:300
1c:null
1a:true
8:C
19:0
a:"$undefined"
7:"$undefined"
18:"$undefined"
12:"$undefined"
