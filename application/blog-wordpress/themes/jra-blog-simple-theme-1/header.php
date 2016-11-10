<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Blog Home - Joe Rice - Architect</title>
	
	<!-- Bootstrap Core CSS -->
	<link
		href="<?php bloginfo('template_directory');?>/css/vendor/bootstrap.css"
		rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="<?php bloginfo('template_directory');?>/css/blog.css"
		rel="stylesheet">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	<?php wp_head();?>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<?php bloginfo( 'wpurl' );?>">Joe Rice - Architect</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<div id="menu-bar">
					<ul class="nav navbar-nav">
						<li><a href="#">Blog</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Architecture <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Cloud-Native Architecture</a></li>
								<li><a href="#">Resiliency & High Availability</a></li>
								<li><a href="#">Scalability & Performance</a></li>
								<li><a href="#">Polyglot Persistence</a></li>
								<li><a href="#">Business Insight</a></li>
								<li><a href="#">Operational Insight</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Cost Management</a></li>
								<li><a href="#">Enterprise Integration</a></li>
								<li class="divider"></li>
								<li><a href="#">All...</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Agile Delivery <span class="caret"></span></a>

							<ul class="dropdown-menu">
								<li><a href="#">Agile Planning</a></li>
								<li><a href="#">Agile Design</a></li>
								<li><a href="#">Agile Development</a></li>
								<li><a href="#">Agile Testing</a></li>
								<li><a href="#">Agile Deployment</a></li>
								<li><a href="#">Agile Operations</a></li>
								<li class="divider"></li>
								<li><a href="#">Continuous Integration</a></li>
								<li><a href="#">Continuous Delivery</a></li>
								<li><a href="#">Continuous Deployment</a></li>
								<li class="divider"></li>
								<li><a href="#">Dev-Ops</a></li>
								<li><a href="#">Automation and Tooling</a></li>
								<li class="divider"></li>
								<li><a href="#">All...</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Tech Articles <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Tech Overviews</a></li>
								<li><a href="#">Tutorials & How-To's</a></li>
								<li><a href="#">Cheat Sheets</a></li>
								<li class="divider"></li>
								<li class="dropdown-submenu"><a tabindex="-1" href="#">Languages</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Java</a></li>
										<li><a tabindex="-1" href="#">JavaScript</a></li>
										<li><a tabindex="-1" href="#">PHP</a></li>
										<li><a tabindex="-1" href="#">Python</a></li>
										<li><a tabindex="-1" href="#">Scala</a></li>
										<li><a tabindex="-1" href="#">Go</a></li>
										<li><a tabindex="-1" href="#">Shell - Bash</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1" href="#">Frameworks</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Java - Spring</a></li>
										<li><a tabindex="-1" href="#">Java - J2EE</a></li>
										<li><a tabindex="-1" href="#">JavaScript - JQuery</a></li>
										<li><a tabindex="-1" href="#">Node.js - Express</a></li>
										<li><a tabindex="-1" href="#">Node,js - Restify</a></li>
										<li><a tabindex="-1" href="#">Css - Bootstrap</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1" href="#">Build
										Tools</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Maven</a></li>
										<li><a tabindex="-1" href="#">Gradle</a></li>
										<li><a tabindex="-1" href="#">Gulp</a></li>
										<li><a tabindex="-1" href="#">Grunt</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1" href="#">Database
										- RDMS</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">MySql / MariaDB</a></li>
										<li><a tabindex="-1" href="#">Oracle</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a tabindex="-1" href="#">Database
										- NoSql</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">Couchbase</a></li>
										<li><a tabindex="-1" href="#">MongoDB</a></li>
										<li><a tabindex="-1" href="#">Casandra</a></li>
										<li><a tabindex="-1" href="#">ElasticSearch</a></li>
										<li><a tabindex="-1" href="#">Neo4J</a></li>
									</ul></li>
								<li class="divider"></li>
								<li><a href="#">All...</a></li>
							</ul></li>

						<li><a href="#">Tech Industry and Trends</a></li>
					</ul>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="img-holder">
		<img class="img-avatar img-circle img-responsive"
			src="<?php bloginfo('template_directory');?>/image/joe-rice-avatar.png">
	</div>
	<div class="container">
		<h1 class="page-header">
			<?php echo get_bloginfo( 'name' ); ?> <small><?php echo get_bloginfo( 'description' ); ?></small>
		</h1>
	</div>

	<!-- Page Content -->
	<div class="container">
	