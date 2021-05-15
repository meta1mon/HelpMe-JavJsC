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
        text: 'book realtime'
    },

    
    	xAxis: {
    		 categories: ['b00001', 'b00002', 'b00003', 'b00004', 'b00005', 'b00006',
    	         'b00007', 'b00008', 'b00009', 'b00010', 'b00011', 'b00012', 'b00013', 'b00014', 'b00015']
        },
    

    yAxis: {
  
       min:'0',
        title: {
            text: 'book '
        }
    },


    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
        
    },



    series: [{
       name : 'book',
       data : [
           ['b00001', ${bCnt[0]}],
           ['b00002', ${bCnt[1]}],
           ['b00003', ${bCnt[2]}],
           ['b00004', ${bCnt[3]}],
           ['b00005', ${bCnt[4]}],
           ['b00006', ${bCnt[5]}],
           ['b00007', ${bCnt[6]}],
           ['b00008', ${bCnt[7]}],
           ['b00009', ${bCnt[8]}],
           ['b00010', ${bCnt[9]}],
           ['b00011', ${bCnt[10]}],
           ['b00012', ${bCnt[11]}],
           ['b00013', ${bCnt[12]}],
           ['b00014', ${bCnt[13]}],
           ['b00015', ${bCnt[14]}],
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