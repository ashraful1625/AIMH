1:"$Sreact.fragment"
2:"/_next/static/chunks/3jiel8xif5lpm.js"
3:I[39756,["$2"],"default"]
4:I[37457,["$2"],"default"]
5:I[43880,["$2"],"Analytics"]
6:I[57215,["$2"],"SpeedInsights"]
9:I[97367,["$2"],"OutletBoundary"]
a:"$Sreact.suspense"
c:"ViewportBoundary"
d:I[97367,["$2"],"$c"]
f:"MetadataBoundary"
10:I[97367,["$2"],"$f"]
12:I[68027,["$2"],"default",1]
7:[["children",{"s":"__PAGE__","h":512,"d":{"r":["$","$1","c",{"children":["$L8",[["$","script","script-0",{"src":"/_next/static/chunks/1wsrh4atp3cd0.js","async":true,"nonce":"$undefined"}]],["$","$L9",null,{"children":["$","$a",null,{"name":"Next.MetadataOutlet","children":"$@b"}]}]]}],"p":false,"v":null}}]]
0:{"P":null,"c":["",""],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Ld",null,{"children":"$Le"}],["$","$L10",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$a",null,{"name":"Next.Metadata","children":"$L11"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$12",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
e:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
b:null
11:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
13:"/_next/static/chunks/1wsrh4atp3cd0.js"
14:I[15365,["$2","$13"],"default"]
15:Tcab,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Login · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div id="ov">
  <div class="ll">AIMH</div>
  <div class="ls bn">সিস্টেম লোড হচ্ছে...</div>
  <div class="lc"></div>
  <div class="le" id="oerr">
    <p id="oerr-msg">Connection failed. Check internet and try again.</p>
    <button class="btn bp bsm" onclick="location.reload()">🔄 Retry</button>
  </div>
</div>

<div id="login">
  <div class="lcard">
    <div class="chead">
      <div class="cem">AI</div>
      <div class="cn">A Islam Medical Hall</div>
      <div class="ca bn">কাসবা পুরাতন বাজার, কাসবা, ব্রাহ্মণবাড়িয়া</div>
    </div>
    <div class="lf">
      <label for="lemail">Email / ইমেইল</label>
      <input type="email" id="lemail" placeholder="name@example.com" autocomplete="username" required>
    </div>
    <div class="lf">
      <label for="lpass">Password / পাসওয়ার্ড</label>
      <input type="password" id="lpass" placeholder="Enter password..." autocomplete="current-password" required>
    </div>
    <button class="lbtn" id="loginbtn" onclick="doLogin()">Login / প্রবেশ করুন</button>
    <div class="lerr" id="lerr" role="alert"></div>
  </div>
</div>

<script type="module">
import { restoreSession, signIn } from './js/core.js';

window.doLogin=async function(){
  const email=document.getElementById('lemail').value.trim();
  const pass=document.getElementById('lpass').value;
  const err=document.getElementById('lerr');
  const btn=document.getElementById('loginbtn');
  err.style.display='none';
  btn.disabled=true;
  try{
    await signIn(email,pass);
    location.replace('dashboard.html');
  }catch(e){
    console.error('Login failed:',e);
    const messages={
      'auth/invalid-credential':'Email or password is incorrect.',
      'auth/invalid-email':'Enter a valid email address.',
      'auth/operation-not-allowed':'Email/password sign-in is not enabled for this Firebase project.',
      'auth/network-request-failed':'Could not reach Firebase Authentication. Check your connection.',
      'permission-denied':'Could not read your clinic role. Ask an administrator to verify your account access.'
    };
    err.textContent='❌ '+(messages[e.code]||e.message||'Login failed.');
    err.style.display='flex';
  }finally{
    btn.disabled=false;
  }
};

document.getElementById('lpass').addEventListener('keydown',e=>{ if(e.key==='Enter') doLogin(); });
document.getElementById('ov').classList.add('hide');
document.getElementById('login').classList.add('on');
restoreSession().then(session=>{
  if(session) location.replace('dashboard.html');
});
</script>
</body>
</html>
8:["$","$L14",null,{"html":"$15"}]
