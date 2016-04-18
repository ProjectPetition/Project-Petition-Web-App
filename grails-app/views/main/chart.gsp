<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">      
    </script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        var body = document.createElementNS("https://petitions.whitehouse.gov/", "BODY");
        //a.href = "https://petitions.whitehouse.gov/";
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Issues');
        data.addRows([
          //add grails command to add data(numbers)
          ['Civil Rights and Liberties', 213790],
          ['Human Rights', 133647],
          ['Budget and Taxes', 121500],
          ['Energy, Environment, Natural Resources', 106758],
          ['Civil Rights and Liberties, Human Rights', 105468],
          ['Foreign Policy', 33513],
          ['Civil Rights and Liberties', 21221],
          ['Budget and Taxes, Economy,Government Reform', 16214],
          ['Arts and Humanities, Foreign Policy, Trade', 10156],
          ['Environment, Foreign Policy, Human Rights', 9506]
        ]);

        // Set chart options
        var options = {'title':'petition',
                       'width':400,
                       'height':300, 
                       vAxis: {title: "Issues"},
                       hAxis: {title: "number of Signatures"}
                     };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  </body>
</html>