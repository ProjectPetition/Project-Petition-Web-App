<html> 
<head>
  <title>Home</title>
</head>
<body>

	<div id="nav_bar"></div>

	<div class="jumbotron">
		<div class="container text-left">
			<div class="col-lg-10 col-lg-offset-1" >  <!-- control size when website goes lg param. -->   <!-- "col-lg-8  col-lg-offset-2" offset push left side of padding space--> 
				<h2>Welcome to Project Petition</h2>
				<h4>This website makes it possible for interested users of We the People to quickly learn about trending petitions, and to track petitions of interest over their 30 day life span.  Once 30 days is past, a petition either achieves the threshold of 100,000 signatures and thus merits a response from the Obama Administration or the petition is removed from the We the People petition platform.</h4>
				<h4>Trending petition: "${p[0].title}"</h4>
			</div>
		</div>
	</div>

	<div class="graph-images">
		<div class="container text-left">
			<h2>E-petitioning Trends (Graphs)</h2>
		</div>
		<div class="container">
			<div class="row">
			<!-- not anymore. 
				<div class="col-xs-4">
					<asset:image src="TopSevenDistribution.jpg" class="trend-graph-image" alt="Top Seven Distribution"/>
				</div>
				<div class="col-xs-4">
					<asset:image src="WtpCategoryDistribution.jpg" class="trend-graph-image" alt="WtP Category Distribution"/>
				</div>
				<div class="col-xs-4">
					<asset:image src="ProGunControlPetitions.png" class="trend-graph-image" alt="Pro Gun Control Petitions"/>
				</div>
				</div>
				-->
				<!-- new thing. -->
				<div class="col-xs-4">
					<asset:image src="Graph.png" class="trend-graph-image" alt="week_bar_chart"/>
				</div>
				<!-- new thing. -->
				</div>
				<!-- close row container -->
			</div>
		</div>
	</div>

	<div class="container">

		<div class="container text-left">
			<h2>Trending Petitions</h2>
		</div>

		<g:each in="${0..1}" var="i">
		  <div class="row trends-row">
		    <g:each in="${0..1}" var="i2">
		      <div class="col-xs-6">
			<h4>${p[2 * i + i2].title}</h4>
			<p>Deadline: ${new java.util.Date((long)p[2 * i + i2].deadline * 1000).format("MMM d yyyy, h:mm a")}</p>
			<div class="forecast" id="graph${2 * i + i2}" style="text-align:center"></div>
			<a href="${p[2 * i + i2].url}">Link to petition</a>
		      </div>
		    </g:each>
		  </div>
		</g:each>
	</div>
	<script type="text/babel" src="/assets/components/NavigationBar.js"></script>
	<script type="text/javascript" src="/assets/jquery.min.js"></script>
	<script type="text/javascript" src="/assets/bootstrap.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
	<script src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/metrics-graphics/2.8.0/metricsgraphics.min.js"></script>
	<script>
	 <g:each in="${0..3}" var="i">
	 d3.json('/main/forecast?id=${p[i].id}', function(data) {
	   data = MG.convert.date(data, 'date');
	   var marker = [{
             'date': new Date('${new java.util.Date((long)p[i].deadline * 1000)}'),
             'label': 'Deadline'
	   }];
	   MG.data_graphic({
             title: "Forecast:",
             description: "A forecast of the petition's future signatures. The gray region is a 95% confidence interval",
             data: data,
	     interpolate: 'basic',
	     baselines: [{value: 100000, label: 'Success'}],
             width: 400,
             height: 320,
             right: 40,
	     left: 90,
	     top: 60,
             bottom: 60,
	     mouseover: function(d) {
               d3.select('#graph${i} svg .mg-active-datapoint')
		 .text('Date: ' + d.date.toDateString().slice(4) + ', Signatures: ' + d.value.toLocaleString());
             },
	     markers: marker,
             area: false,
             target: '#graph${i}',
             show_secondary_x_label: false,
             show_confidence_band: ['l', 'u'],
             x_extended_ticks: false,
	     x_label: 'Date',
	     y_label: 'Signatures'
	   });
	 });
	 </g:each>
	</script>
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
        data.addColumn('number', 'Number of Issues');
        data.addRows([
        	<g:each in="${issueCounts.keySet()}" var="name">
          ['${name}', ${issueCounts[name]}],
        	</g:each>
        ]);

        // Set chart options
        var options = {'title':'Number of Issues',
                       'width':1300,
                       'height':800, 
                       vAxis: {title: "Issues"},
                       hAxis: {title: "number of Issues"}
                     };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <div id="chart_div"></div>

    
    

</body>
</html>
