<%@page import="bookshop.DAO.BuyDAO"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<%
   BuyDAO buy = new BuyDAO();
   int tot1 = buy.getBuyBookCount1();
   int tot2 = buy.getBuyBookCount2();
   int tot3 = buy.getBuyBookCount3();
   int tot4 = buy.getBuyBookCount4();
   int tot5 = buy.getBuyBookCount5();
   int tot6 = buy.getBuyBookCount2();
   int tot7 = buy.getBuyBookCount7();
   int tot8 = buy.getBuyBookCount8();
   int tot9 = buy.getBuyBookCount9();
   int tot10 = buy.getBuyBookCount10();
   int tot11 = buy.getBuyBookCount11();
   int tot12 = buy.getBuyBookCount12();
   int tot13 = buy.getBuyBookCount13();
   int tot14 = buy.getBuyBookCount14();
   int tot15 = buy.getBuyBookCount15();
         

%>
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
          ['b00001', <%=tot1%>],
          ['b00002', <%=tot2%>],
          ['b00003', <%=tot3%>],
          ['b00004', <%=tot4%>],
          ['b00005', <%=tot5%>],
          ['b00006', <%=tot6%>],
          ['b00007', <%=tot7%>],
          ['b00008', <%=tot8%>],
          ['b00009', <%=tot9%>],
          ['b00010', <%=tot10%>],
          ['b00011', <%=tot11%>],
          ['b00012', <%=tot12%>],
          ['b00013', <%=tot13%>],
          ['b00014', <%=tot14%>],
          ['b00015', <%=tot15%>],
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