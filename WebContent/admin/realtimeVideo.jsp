<%@page import="bookshop.DAO.BuyDAO"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<hmtl>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 360px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
   font-family: Verdana, sans-serif;
   border-collapse: collapse;
   border: 1px solid #EBEBEB;
   margin: 10px auto;
   text-align: center;
   width: 100%;
   max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
   font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


</style>
<body>

<figure class="highcharts-figure">
    <div id="container"></div>
</figure>
<script>
Highcharts.chart('container', {

    title: {
        text: 'video realtime'
    },

    
    	xAxis: {
    		 categories: ['v00001', 'v00002', 'v00003', 'v00004', 'v00005', 'v00006',
    	         'v00007', 'v00008', 'v00009']
        },
    

    yAxis: {
  
       min:'0',
        title: {
            text: 'video '
        }
    },


    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
        
    },



    series: [{
       name : 'video',
       data : [
          ['v00001', ${vCnt[0]}],
          ['v00002', ${vCnt[1]}],
          ['v00003', ${vCnt[2]}],
          ['v00004', ${vCnt[3]}],
          ['v00005', ${vCnt[4]}],
          ['v00006', ${vCnt[5]}],
          ['v00007', ${vCnt[6]}],
          ['v00008', ${vCnt[7]}],
          ['v00009', ${vCnt[8]}]
   
       ]
        
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    
    }

});
</script>
</body>
</hmtl>