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
7:[["children",{"s":{"n":"slug","t":"d","k":"company_bill","s":["css","js"]},"h":512,"d":{"r":["$","$1","c",{"children":[null,["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}],"p":false,"v":"$8"},"c":"$Q9"}]]
0:{"P":null,"c":["","company_bill"],"q":"","i":false,"t":{"t":{"s":"","h":528,"d":{"r":["$","$1","c",{"children":[[["$","script","script-0",{"src":"/_next/static/chunks/3jiel8xif5lpm.js","async":true,"nonce":"$undefined"}]],["$","html",null,{"lang":"en","children":["$","body",null,{"children":[["$","$L3",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$L4",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}],["$","$L5",null,{}],["$","$L6",null,{}]]}]}]]}],"p":false,"v":null},"c":"$Q7"},"h":{"r":["$","$1","h",{"children":[null,["$","$Lf",null,{"children":"$L10"}],["$","$L12",null,{"children":[["$","div",null,{"hidden":true,"children":["$","$c",null,{"name":"Next.Metadata","children":"$L13"}]}],null]}],null]}],"p":false,"v":null}},"m":"$undefined","G":["$14",[]],"S":true,"r":"$undefined","s":"$undefined","a":"$undefined","l":"$undefined","p":"$undefined","d":"$undefined","b":"Cq6reOdvmmVxITcEl95tc"}
8:C
10:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
d:null
13:[["$","title","0",{"children":"A Islam Medical Hall"}],["$","meta","1",{"name":"description","content":"Clinic management system"}]]
15:"/_next/static/chunks/1wsrh4atp3cd0.js"
16:I[15365,["$2","$15"],"default"]
17:T137c,<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Company Bills · A Islam Medical Hall</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600;700&family=Lora:ital,wght@0,400;0,600;0,700;1,400&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="app">
  <div class="hdr" id="hdr"></div>
  <div class="cnt">
    <h1 class="ptitle">🏢 Company Bills <span class="bn" style="font-size:12px;font-weight:400;color:var(--t3)">কোম্পানি বিল</span></h1>
    <div class="card">
      <div class="cs">Track invoices and payments to companies</div>
      <button class="btn bp bsm" onclick="openModal('mcomp')" style="margin-bottom:12px">➕ Add Invoice</button>
      <div id="complist"><div class="al ali">⏳ Loading...</div></div>
    </div>
  </div>
</div>

<!-- ADD COMPANY INVOICE MODAL -->
<div class="mbg" id="mcomp">
  <div class="modal">
    <div class="mhandle"></div>
    <div class="mtitle">🏢 Company Invoice</div>
    <div class="row r2">
      <div class="fg full"><label>Company Name</label><input type="text" id="ncname" placeholder="Square, Incepta..."></div>
      <div class="fg"><label>Invoice Date</label><input type="date" id="ncdate"></div>
      <div class="fg"><label>Type</label><select id="nctype"><option value="Cash">Cash</option><option value="Credit">Credit</option></select></div>
      <div class="fg"><label>Invoice Bill ৳</label><input type="number" id="ncbill" value="0"></div>
      <div class="fg"><label>Adjust Bill ৳</label><input type="number" id="ncadj" value="0"></div>
      <div class="fg"><label>Pay Now ৳</label><input type="number" id="ncpay" value="0"></div>
      <div class="fg"><label>Sample Count</label><input type="number" id="ncsample" value="0"></div>
    </div>
    <div class="brow">
      <button class="btn bp" id="savecompbtn" onclick="saveCompBill()">✓ Save Invoice</button>
      <button class="btn bs" onclick="closeModal('mcomp')">Cancel</button>
    </div>
  </div>
</div>
<div id="pa"></div>

<script type="module">
import { loadAll, requireRole, renderHeader, openModal, closeModal, sync, fadd, fdel, COMPS } from './js/core.js';

const session = await requireRole(['staff','admin']);
if(session){
  await loadAll();
  renderHeader();
  document.getElementById('app').classList.add('on');
  renderCompList();
}

window.renderCompList=function(){
  const el=document.getElementById('complist');
  if(!COMPS.length){ el.innerHTML='<div class="al ali">No invoices yet.</div>'; return; }
  el.innerHTML='<div class="mtw"><table class="mt">'+
    '<thead><tr><th>Company</th><th>Date</th><th>Type</th><th>Bill</th><th>Pay</th><th>Due</th><th></th></tr></thead><tbody>'+
    COMPS.map(c=>{
      const overall=(c.bill||0)-(c.adj||0);
      const due=overall-(c.pay||0);
      return '<tr>'+
        '<td style="text-align:left;font-weight:600">'+c.name+'</td>'+
        '<td>'+(c.date||'—')+'</td>'+
        '<td><span class="badge '+(c.type==='Cash'?'bok':'blow')+'">'+(c.type||'—')+'</span></td>'+
        '<td>৳'+(c.bill||0)+'</td>'+
        '<td>৳'+(c.pay||0)+'</td>'+
        '<td style="color:'+(due>0?'var(--red)':'var(--g2)')+';font-weight:700">৳'+due+'</td>'+
        '<td><button class="rmb" onclick="delCompBill(\''+c.id+'\')">✕</button></td>'+
      '</tr>';
    }).join('')+'</tbody></table></div>';
};

window.saveCompBill=async function(){
  const name=document.getElementById('ncname').value.trim();
  if(!name){ alert('Enter company name!'); return; }
  const btn=document.getElementById('savecompbtn');
  btn.innerHTML='<span class="sp"></span>Saving...'; btn.disabled=true;
  try{
    await fadd('company_bills',{
      name,
      date:document.getElementById('ncdate').value,
      type:document.getElementById('nctype').value,
      bill:parseFloat(document.getElementById('ncbill').value)||0,
      adj:parseFloat(document.getElementById('ncadj').value)||0,
      pay:parseFloat(document.getElementById('ncpay').value)||0,
      sample:parseInt(document.getElementById('ncsample').value)||0,
      ca:new Date().toISOString()
    });
    closeModal('mcomp');
    ['ncname','ncdate','ncbill','ncadj','ncpay','ncsample'].forEach(id=>{ document.getElementById(id).value=''; });
    sync('✅ Invoice saved!');
    setTimeout(()=>location.reload(), 1200);
  }catch(e){ alert('❌ Failed: '+e.message); }
  finally{ btn.innerHTML='✓ Save Invoice'; btn.disabled=false; }
};

window.delCompBill=async function(id){
  if(!confirm('Delete this invoice?')) return;
  try{ await fdel('company_bills',id); setTimeout(()=>location.reload(),800); }catch(e){ alert('Failed: '+e.message); }
};
</script>
</body>
</html>
a:["$","$L16",null,{"html":"$17"}]
