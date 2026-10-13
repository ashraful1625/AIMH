1:"$Sreact.fragment"
2:"/_next/static/chunks/3jiel8xif5lpm.js"
3:I[39756,["$2"],"default"]
4:I[37457,["$2"],"default"]
5:I[43880,["$2"],"Analytics"]
6:I[57215,["$2"],"SpeedInsights"]
a:"/_next/static/chunks/1wsrh4atp3cd0.js"
b:I[15365,["$2","$a"],"default"]
10:"ViewportBoundary"
11:I[97367,["$2"],"$10"]
12:"MetadataBoundary"
13:I[97367,["$2"],"$12"]
14:"$Sreact.suspense"
8:X
c:Tcab,<!DOCTYPE html>
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
9:[["children",{"s":"__PAGE__","h":160,"d":{"r":["$","$1","c",{"children":[["$","$Lb",null,{"html":"$c"}],["$Ld"],"$Le"]}],"p":"$@f","v":null,"s":"$8"}}]]
0:{"t":{"t":{"s":"","h":80,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","template":["$","$L4",null,{}],"notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]]}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":"$@7","v":null,"s":"$8"},"c":"$Q9"},"h":{"r":["$","$1","h",{"children":[null,["$","$L11",null,{"children":[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]}],["$","$L13",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$14",null,{"name":"Next.Metadata","children":[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]}]}],null]}],null]}],"p":"$@15","v":null,"s":"$8"}},"a":"$@16","u":"$@17","b":"Cq6reOdvmmVxITcEl95tc"}
18:I[97367,["$2"],"OutletBoundary"]
d:["$","script","script-0",{"src":"/_next/static/chunks/1wsrh4atp3cd0.js","async":true}]
e:["$","$L18",null,{"children":["$","$14",null,{"name":"Next.MetadataOutlet","children":"$@19"}]}]
8:300
19:null
17:true
8:C
16:0
7:"$undefined"
15:"$undefined"
f:"$undefined"
