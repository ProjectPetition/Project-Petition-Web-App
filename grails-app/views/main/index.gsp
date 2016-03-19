<html>
<head>
	<title>Home</title>
</head>
<body>

	<div id="nav_bar"></div>

	<div class="jumbotron">
		<div class="container text-center">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Welcome to Project Petition</h2>
				<h4>This website makes it possible for interested users of We the People to quickly learn about trending petitions, and to track petitions of interest over their 30 day life span.  Once 30 days is past, a petition either achieves the threshold of 100,000 signatures and thus merits a response from the Obama Administration or the petition is removed from the We the People petition platform.</h4>
				<h4>Trending petition: "${p[0].title}"</h4>
			</div>
		</div>
	</div>

	<div class="graph-images">
		<div class="container text-center">
			<h2>E-petitioning Trends (Graphs)</h2>
		</div>
		<div class="container">
			<div class="row">
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
		</div>
	</div>

	<div class="container">

		<div class="container text-center">
			<h2>Trending Petitions</h2>
		</div>

		<g:each in="${0..1}" var="i">
		  <div class="row trends-row">
		    <g:each in="${0..1}" var="i2">
		      <div class="col-xs-6">
			<h4>${p[2 * i + i2].title}</h4>
			<p>${p[2 * i + i2].signatureCounts.findAll({!it.forecast}).size()} days old</p>
			<p>Signature counts: ${p[2 * i + i2].signatureCounts.sort{it.date}.collectEntries{[(it.date.getDateString()):it.count]}}</p>
			<a href="${p[2 * i + i2].url}">Link to petition</a>
		      </div>
		    </g:each>
		  </div>
		</g:each>
	</div>

	<script type="text/babel" src="/assets/components/NavigationBar.js"></script>

	<script type="text/javascript" src="/assets/jquery.min.js"></script>
	<script type="text/javascript" src="/assets/bootstrap.min.js"></script>

</body>
</html>
