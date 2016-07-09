var NavigationBar = React.createClass({

	render: function() {
		return (
			<nav className="navbar navbar-default navbar-fixed-top">
				<div className="container">
					<div className="navbar-header">
						<div className="navbar-brand">
							Project Petition
						</div>
					</div>
					<div className="navbar-collapse collapse">
						<ul className="nav navbar-nav">
							<li>
								<a href="index">Home</a>
							</li>
							<li>
								<a href="publications">Publications</a>
							</li>
							<li>
								<a href="about">About</a>
							</li>
						</ul>

						<ul className="nav navbar-nav navbar-right">
			                        </ul>
			                        <img id="ualbany_logo_wide" src="/assets/ualbany_logo_wide.png" />
					</div>
				</div>
			</nav>
		);
	}

});

var navBar = ReactDOM.render(<NavigationBar />, document.getElementById('nav_bar'));
