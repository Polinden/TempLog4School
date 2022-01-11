(()=>{var e,t={843:(e,t,a)=>{var r={"./es-us":146,"./es-us.js":146,"./ru":793,"./ru.js":793};function o(e){var t=n(e);return a(t)}function n(e){if(!a.o(r,e)){var t=new Error("Cannot find module '"+e+"'");throw t.code="MODULE_NOT_FOUND",t}return r[e]}o.keys=function(){return Object.keys(r)},o.resolve=n,e.exports=o,o.id=843},971:(e,t,a)=>{"use strict";var r=a(877),o=a(381),n=(a(961),a(341));r.Z.register(n.Z);let i=1.1,d=document.body.clientWidth;d>1e3?i=2.2:d>1200&&(i=2.8);let s=document.getElementById("myChart");document.myChart=new r.Z(s,{type:"line",data:{labels:[],datasets:[{data:[],lineTension:0,backgroundColor:"transparent",borderColor:"#007bff",borderWidth:4,pointBackgroundColor:"#007bff"}]},options:{aspectRatio:i,scales:{y:{beginAtZero:!1},x:{type:"time",time:{isoWeekday:!0,distribution:"linear",displayFormats:{day:"DD-MM-YY",week:"MMM (Wo)"}},ticks:{tickWidth:10,autoSkip:!1,maxRotation:90,minRotation:90,z:100,labelOffset:-8,backdropPadding:3}}},layout:{padding:{left:2,right:10,bottom:2,top:5}},plugins:{legend:{display:!1},annotation:{annotations:[{type:"line",yMin:0,yMax:0,borderColor:"tomato",borderWidth:3}]},tooltip:{callbacks:{title:function(e){var t=e[0].parsed.x;return(t=new Date(t)).getDate()+"-"+(t.getMonth()+1)+"-"+(t.getYear()+1900)}}}}}});let c=function(e,t){if(0==e.length)return;var a=[],r=[];a=Object.keys(e),Object.values(e).forEach((e=>r.push(Math.round(100*e)/100)));let n=32;switch(t){case"hour":document.myChart.options.scales.x.time.unit="hour",document.myChart.options.scales.x.time.parser="HH:mm",n=24;break;case"week":document.myChart.options.scales.x.time.unit="day",document.myChart.options.scales.x.time.parser="DD.MM.YY",n=7;break;case"year":document.myChart.options.scales.x.time.unit="week",document.myChart.options.scales.x.time.parser=function(e){return o.utc(e,"DD.MM.YY")},n=30;break;case"month":document.myChart.options.scales.x.time.unit="day",document.myChart.options.scales.x.time.parser="DD.MM.YY"}return a=a.slice(-1*n),r=r.slice(-1*n),document.myChart.data.labels.length=0,document.myChart.data.datasets.forEach((e=>{e.data.length=0})),document.myChart.update(),function(e,t){!function(e){if(0!=e.length&&e[0].includes("-"))for(var t=0;t<e.length;t++){var a=e[t].split("-");e[t]=a[2]+"."+a[1]+"."+a[0].slice(-2)}}(e),document.myChart.data.labels.push.apply(document.myChart.data.labels,e),document.myChart.data.datasets.forEach((e=>{e.data.push.apply(e.data,t)})),document.myChart.update()}(a,r),!1},l=function(){var e=$("#datepicker").data("datepicker").getFormattedDate("yyyy-mm-dd");window.location.replace(window.location.origin+"?d="+e)};$(document).ready((function(){if(c(dayed,"week"),document.getdate=l,document.mkalist=c,feather.replace(),$("#datepicker").datepicker({weekStart:1,daysOfWeekHighlighted:"6,0",autoclose:!0,todayHighlight:!0}),$("#datepicker").datepicker("setDate",new Date),Object.keys(dayed).length>0){let e=o(Object.keys(dayed).slice(-1)[0]).toDate();$("#datepicker").datepicker("update",e)}}))}},a={};function r(e){var o=a[e];if(void 0!==o)return o.exports;var n=a[e]={id:e,loaded:!1,exports:{}};return t[e].call(n.exports,n,n.exports,r),n.loaded=!0,n.exports}r.m=t,e=[],r.O=(t,a,o,n)=>{if(!a){var i=1/0;for(l=0;l<e.length;l++){for(var[a,o,n]=e[l],d=!0,s=0;s<a.length;s++)(!1&n||i>=n)&&Object.keys(r.O).every((e=>r.O[e](a[s])))?a.splice(s--,1):(d=!1,n<i&&(i=n));if(d){e.splice(l--,1);var c=o();void 0!==c&&(t=c)}}return t}n=n||0;for(var l=e.length;l>0&&e[l-1][2]>n;l--)e[l]=e[l-1];e[l]=[a,o,n]},r.n=e=>{var t=e&&e.__esModule?()=>e.default:()=>e;return r.d(t,{a:t}),t},r.d=(e,t)=>{for(var a in t)r.o(t,a)&&!r.o(e,a)&&Object.defineProperty(e,a,{enumerable:!0,get:t[a]})},r.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),r.nmd=e=>(e.paths=[],e.children||(e.children=[]),e),(()=>{var e={179:0};r.O.j=t=>0===e[t];var t=(t,a)=>{var o,n,[i,d,s]=a,c=0;if(i.some((t=>0!==e[t]))){for(o in d)r.o(d,o)&&(r.m[o]=d[o]);if(s)var l=s(r)}for(t&&t(a);c<i.length;c++)n=i[c],r.o(e,n)&&e[n]&&e[n][0](),e[i[c]]=0;return r.O(l)},a=self.webpackChunkmy_webpack_project=self.webpackChunkmy_webpack_project||[];a.forEach(t.bind(null,0)),a.push=t.bind(null,a.push.bind(a))})();var o=r.O(void 0,[44,286,33],(()=>r(971)));o=r.O(o)})();