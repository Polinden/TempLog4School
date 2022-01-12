         import Chart from 'chart.js/auto';
         import * as moment from 'moment';
         import ___ from'chartjs-adapter-moment';
         import annotationPlugin from 'chartjs-plugin-annotation';


         Chart.register(annotationPlugin);

         let asd=1.1
         let drt=document.body.clientWidth;
         if (drt>1000) asd=2.2;
         else if (drt>1200) asd=2.8;
         
         let ctx = document.getElementById("myChart");
                document.myChart = new Chart(ctx, {
                type: 'line',
                data: {
                  labels: [], 
                  datasets: [{
                    data: [],
                    lineTension: 0,
                    backgroundColor: 'transparent',
                    borderColor: '#007bff',
                    borderWidth: 4,
                    pointBackgroundColor: '#007bff'
                  }]
                },
                options: {
                  aspectRatio: asd,
                  scales: {
		    y: {
                        beginAtZero: false
                    },
	  	    x: {
                       type: 'time',
                       time: {   
			  isoWeekday: true,     
			  distribution: 'linear', 
	                  displayFormats: {
                              'day': 'DD-MM-YY',
			      'week': 'MMM (Wo)',	  
                          },
                       },
		       ticks: {
			 tickWidth: 10,
                         autoSkip: false,
                         maxRotation: 90,
                         minRotation: 90,
			 z: 100,
                         labelOffset: -8,
			 backdropPadding: 3       
	               }
		     }
                  },
		  layout: {
			padding: {
		   	     left: 2,
			     right: 10,
			     bottom: 2,
			     top: 5
			}
                  },
              plugins: {
                  legend: {
                    display: false
                },
	     annotation: {
		annotations: [{
		type: 'line',
	        yMin:    0,
                yMax:    0,
	        borderColor: 'tomato',
		borderWidth: 3
	       }]
              },
              tooltip: {
                 callbacks: {
                     title: function(tooltipItems) {
			var d=tooltipItems[0].parsed.x;
                        d=new Date(d);
                        return d.getDate()+"-"+(d.getMonth()+1)+"-"+(d.getYear()+1900);
                     }
                 } 
              },
	    }  
	 }});
        
         function formatDate(x){
		if (x.length==0) return;
		if (x[0].includes('-')) {  
		for (var i=0; i<x.length; i++){
		    var sa=x[i].split('-');
		    x[i]=sa[2]+'.'+sa[1]+'.'+sa[0].slice(-2);
		  }
		}
	 }

         function addData(alist,blist) {
	       formatDate(alist); 
               document.myChart.data.labels.push.apply(document.myChart.data.labels, alist);
               document.myChart.data.datasets.forEach((dataset) => {
               dataset.data.push.apply(dataset.data, blist);
               });
               document.myChart.update();		 
            }
         
           function removeData() {
                document.myChart.data.labels.length=0;
                document.myChart.data.datasets.forEach((dataset) => {
                dataset.data.length=0;
               });
            document.myChart.update();
            }
        
          
          let mkalist=function(list, fortime){
	             if (list.length==0) return;	 
		     var alist=[];
		     var blist=[];		       
		     alist=Object.keys(list);
		     Object.values(list).forEach(z=> blist.push(Math.round(z*100)/100));
		     let ab_filter=32;
		     switch (fortime) {
	             case 'hour':		     
		       document.myChart.options.scales.x.time.unit = "hour";
		       document.myChart.options.scales.x.time.parser = "HH:mm";
                       ab_filter=24;
		       break;	     
		     case 'week':
		        document.myChart.options.scales.x.time.unit = "day";
	                document.myChart.options.scales.x.time.parser = "DD.MM.YY";
                        ab_filter=7;
		        break; 
		     case 'year':
		        document.myChart.options.scales.x.time.unit = "week";
	                document.myChart.options.scales.x.time.parser = function(date) {return moment.utc(date, "DD.MM.YY");};
                        ab_filter=30;
		        break; 
		     case 'month':
		        document.myChart.options.scales.x.time.unit = "day";
	                document.myChart.options.scales.x.time.parser = "DD.MM.YY";
		        break; 
		     };
		     alist=alist.slice(-1*ab_filter);	
		     blist=blist.slice(-1*ab_filter); 
		     removeData();
		     addData(alist,blist);
		     return false;		 
                }

	      let getdate = function(){
                 var dd=$("#datepicker").data('datepicker').getFormattedDate('yyyy-mm-dd');
		 // REDIRECT TO URL
		 window.location.replace(window.location.origin+"?d="+dd);		    
	      }     



	 //init all data
         $( document ).ready(function() {
		 mkalist(dayed, 'week');   
		 document.getdate=getdate;       
		 document.mkalist=mkalist;
		 feather.replace();       

		 $('#datepicker').datepicker({
		     weekStart: 1,
		     daysOfWeekHighlighted: "6,0",
		     autoclose: true,
		     todayHighlight: true,
		 });
		 $('#datepicker').datepicker("setDate", new Date());
		 if (Object.keys(dayed).length>0) {
		       let t=moment(Object.keys(dayed).slice(-1)[0]).toDate();
		       $("#datepicker").datepicker("update", t);
		 };
	 });



   



