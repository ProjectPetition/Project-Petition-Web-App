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
		    <h4>Project Petition is a research group at SUNY Albany studying e-petitioning and and its impact on government and society. This website provides data about recent petitions posted on We the People (petitions.whitehouse.gov) as well as Project Petition research.</h4>
		    <h4 style="padding-top: 15px;">Trending petition: <a href="${p[0].url}">"${p[0].title}"</a></h4>
		</div>
	    </div>
	</div>

	<div class="graph-images">
	    <div class="container text-left">
		<h2>Popular Petitions:</h2>
	    </div>
	    <div class="container">
		<div class="row" style="text-align:center">
		    <div class="col-xs-6">
			<asset:image src="Graph.png" class="trend-graph-image" alt="week_bar_chart"/>
		    </div>
		    <div class="col-xs-6">
			<asset:image src="last_month.png" class="trend-graph-image" alt="week_bar_chart"/>
		    </div>
		</div>
	    </div>
	</div>
	<div class="container" style="text-align:center">
	    <div class="container text-left">
		<h2>Petition Issues:</h2>
	    </div>
	    <div id="chart_div" style="display:inline-block"></div>
	</div>

	<div class="container">
	    <div class="container text-left">
		<h2 style="margin-top:50px">Trending Petitions:</h2>
	    </div>

	    <g:each in="${0..1}" var="i">
		<div class="row trends-row">
		    <g:each in="${0..1}" var="i2">
			<div class="col-xs-6">
			    <h4><a href="${p[2 * i + i2].url}" title="${p[2 * i + i2].title}">${p[2 * i + i2].title}</a></h4>
			    <p>Deadline: ${new java.util.Date((long)p[2 * i + i2].deadline * 1000).format("MMM d yyyy, h:mm a")}</p>
			    <div class="forecast" id="graph${2 * i + i2}" style="text-align:center"></div>
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
             /* data.addColumn('string', 'Topping');
	      * data.addColumn('number');*/
	     var data = google.visualization.arrayToDataTable([
		 ['Issue', 'Frequency', { role: 'annotation' } ],
        	 <g:each in="${issueCounts.keySet()}" var="name">
		 ['${name.replace("&amp;", "and")}', ${issueCounts[name]}, '${name.replace("&amp;", "and")}'],
        	 </g:each>
             ]);

             // Set chart options
             var options = {'title':'Issue:',
			    'width':800,
			    'height':600,
			    hAxis: {title: "Frequency",
				    format: '',
				    minValue: 0,
				    gridlines: {count: -1}},
			    vAxis: {textPosition: 'none'},
			    legend: { position: 'none' },
			    bar: { groupWidth: "90%" },
			    chartArea: {left:30,top:30,width:'90%',height:'85%'}
             };

             // Instantiate and draw our chart, passing in some options.
             var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
             chart.draw(data, options);
	 }
	</script>
    </body>
</html>
