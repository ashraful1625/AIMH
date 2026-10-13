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
f:T1fc0,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Reports · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">📊 Reports <span class="bn" style="font-size:12px;font-weight:400;color:var(--t3)">রিপোর্ট</span></h1>
    <div class="card">
      <div class="ct" style="display:flex;justify-content:space-between;align-items:center">
        <span>📈 Overview</span>
        <button class="btn bp bsm" onclick="printReport()">🖨️ Print Report</button>
      </div>
      <div class="sgrid">
        <div class="sbox" style="background:var(--gl)"><div class="snum" style="color:var(--g1)" id="rrx">—</div><div class="slbl" style="color:var(--t2)">Prescriptions</div></div>
        <div class="sbox" style="background:var(--gold-l)"><div class="snum" style="color:var(--gold)" id="rrev">—</div><div class="slbl" style="color:var(--t2)">Revenue (30d) ৳</div></div>
        <div class="sbox" style="background:var(--blue-l)"><div class="snum" style="color:var(--blue)" id="rpts">—</div><div class="slbl" style="color:var(--t2)">Patients</div></div>
        <div class="sbox" style="background:var(--red-l)"><div class="snum" style="color:var(--red)" id="rinv">—</div><div class="slbl" style="color:var(--t2)">Medicines</div></div>
      </div>
      <div id="rrev2"></div>
      <div style="font-weight:700;font-family:'Lora',serif;color:var(--g1);margin:14px 0 8px;font-size:14px">Recent Prescriptions</div>
      <div id="rlist"><div class="al ali">⏳ Loading...</div></div>
    </div>
  </div>
</div>
<div id="pa"></div>

<script type="module">
import { loadAll, requireRole, renderHeader, printHTML, RXS, PTS, BILLS, INV } from './js/core.js';

const session = await requireRole(['admin']);
if(session){
  await loadAll();
  renderHeader();
  document.getElementById('app').classList.add('on');
  renderReports();
}

function renderReports(){
  const today=new Date().toISOString().split('T')[0];
  const last7=new Date(); last7.setDate(last7.getDate()-7);
  const last30=new Date(); last30.setDate(last30.getDate()-30);
  const inRange=(d,lim)=>new Date(d)>=lim;

  const dailyBills  = BILLS.filter(b=>b.date===today);
  const weeklyBills = BILLS.filter(b=>inRange(b.date,last7));
  const monthlyBills= BILLS.filter(b=>inRange(b.date,last30));

  const revDaily  = dailyBills.reduce((s,b)=>s+(b.total||0),0);
  const revWeekly = weeklyBills.reduce((s,b)=>s+(b.total||0),0);
  const revMonthly= monthlyBills.reduce((s,b)=>s+(b.total||0),0);

  document.getElementById('rrx').textContent  = RXS.length;
  document.getElementById('rrev').textContent = revMonthly.toFixed(0);
  document.getElementById('rpts').textContent = PTS.length;
  document.getElementById('rinv').textContent = INV.length;

  document.getElementById('rrev2').innerHTML =
    '<div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px;text-align:center">'+
    '<div class="sbox" style="background:var(--gl);padding:10px"><div style="font-size:14px;font-weight:700">৳'+revDaily.toFixed(0)+'</div><div style="font-size:9px">Today</div></div>'+
    '<div class="sbox" style="background:var(--blue-l);padding:10px"><div style="font-size:14px;font-weight:700">৳'+revWeekly.toFixed(0)+'</div><div style="font-size:9px">Weekly</div></div>'+
    '<div class="sbox" style="background:var(--gold-l);padding:10px"><div style="font-size:14px;font-weight:700">৳'+revMonthly.toFixed(0)+'</div><div style="font-size:9px">Monthly</div></div>'+
    '</div>';

  const list=document.getElementById('rlist');
  if(!RXS.length){ list.innerHTML='<div class="al ali">No prescriptions yet.</div>'; return; }
  list.innerHTML=RXS.slice(0,15).map(rx=>
    '<div style="display:flex;justify-content:space-between;padding:8px 0;border-bottom:1px solid var(--border);font-size:13px;align-items:center">'+
      '<div><div style="font-weight:600">'+rx.patient+'</div>'+
      '<div style="font-size:11px;color:var(--t3)">'+(rx.rxId||rx.id)+' · '+(rx.dateStr||rx.date)+' · '+(rx.doctorName||'')+'</div></div>'+
      '<div style="font-weight:600;color:var(--g1)">৳'+(rx.fee||0)+'</div>'+
    '</div>'
  ).join('');
}

window.printReport=function(){
  const today=new Date().toISOString().split('T')[0];
  const todayBills=BILLS.filter(b=>b.date===today);
  const todayRx=RXS.filter(r=>r.date===today);
  const totalRev=todayBills.reduce((s,b)=>s+(b.total||0),0);

  const html='<div class="rxp" style="max-width:700px;margin:auto;border:1px solid #eee;padding:40px">'+
    '<div style="text-align:center;margin-bottom:30px">'+
      '<div style="font-family:\'Noto Serif Bengali\',serif;font-size:24px;font-weight:700;color:#1a5c3a">এ ইসলাম মেডিকেল হল</div>'+
      '<div style="font-size:14px;color:#666;margin-top:5px;text-transform:uppercase;letter-spacing:1px">Daily Performance Report</div>'+
      '<div style="font-size:12px;color:#999;margin-top:3px">Date: '+new Date().toLocaleDateString('en-GB',{day:'2-digit',month:'short',year:'numeric'})+'</div>'+
      '<div style="margin:20px auto;width:100px;height:2px;background:#1a5c3a"></div>'+
    '</div>'+
    '<div style="display:grid;grid-template-columns:repeat(3,1fr);gap:20px;margin-bottom:30px">'+
      '<div style="padding:15px;background:#f2faf6;border-radius:10px;text-align:center"><div style="font-size:10px;color:#7a9b8a;text-transform:uppercase;letter-spacing:1px">Total Revenue</div><div style="font-size:20px;font-weight:700;color:#1a5c3a">৳'+totalRev+'</div></div>'+
      '<div style="padding:15px;background:#f0f4f8;border-radius:10px;text-align:center"><div style="font-size:10px;color:#2b5a8a;text-transform:uppercase;letter-spacing:1px">Prescriptions</div><div style="font-size:20px;font-weight:700;color:#2b5a8a">'+todayRx.length+'</div></div>'+
      '<div style="padding:15px;background:#fff9f0;border-radius:10px;text-align:center"><div style="font-size:10px;color:#a67c00;text-transform:uppercase;letter-spacing:1px">Patients Served</div><div style="font-size:20px;font-weight:700;color:#a67c00">'+todayBills.length+'</div></div>'+
    '</div>'+
    '<div style="margin-bottom:20px">'+
      '<div style="font-weight:700;color:#1a5c3a;border-bottom:2px solid #f2faf6;padding-bottom:5px;margin-bottom:10px;font-size:14px">TODAY\'S TRANSACTIONS</div>'+
      '<table style="width:100%;border-collapse:collapse;font-size:12px">'+
        '<thead><tr style="background:#f8f8f8;text-align:left"><th style="padding:8px">Time</th><th style="padding:8px">Patient</th><th style="padding:8px">Rx ID</th><th style="padding:8px;text-align:right">Amount</th></tr></thead>'+
        '<tbody>'+
          (todayBills.map(b=>
            '<tr style="border-bottom:1px solid #f0f0f0">'+
            '<td style="padding:8px;color:#999">'+(b.savedAt?new Date(b.savedAt).toLocaleTimeString('en-GB',{hour:'2-digit',minute:'2-digit'}):'—')+'</td>'+
            '<td style="padding:8px;font-weight:600">'+b.patient+'</td>'+
            '<td style="padding:8px;color:#666">'+b.rxId+'</td>'+
            '<td style="padding:8px;text-align:right;font-weight:700">৳'+b.total+'</td></tr>'
          ).join('') || '<tr><td colspan="4" style="text-align:center;padding:20px;color:#ccc">No transactions recorded today</td></tr>')+
        '</tbody>'+
      '</table>'+
    '</div>'+
    '<div style="margin-top:50px;text-align:center;font-size:10px;color:#999;border-top:1px solid #f0f0f0;padding-top:20px">Report generated on '+new Date().toLocaleString()+' by A Islam Medical Hall CMS</div>'+
  '</div>';

  printHTML(html, true);
};
</script>
</body>
</html>
c:[["children",{"s":"__PAGE__","h":160,"d":{"r":["$","$1","c",{"children":[["$","$Le",null,{"html":"$f"}],["$L10"],"$L11"]}],"p":"$@12","v":null,"s":"$8"}}]]
9:[["children",{"s":{"n":"slug","t":"d","k":"overall_reports","s":["css","js"]},"h":96,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","template":["$","$L4",null,{}]}]]}],"p":"$@a","v":"$b","s":"$8"},"c":"$Qc"}]]
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
