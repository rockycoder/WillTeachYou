<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <link href='http://fonts.googleapis.com/css?family=Orbitron:900'
	rel='stylesheet' type='text/css'> -->
<!-- <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<div class="header-wrapper">
	<nav class="navbar nav-main">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="logo-header">
					<a href="<%=request.getContextPath()%>/index" class="logotext"
						style="color: white; padding-top: 10px; padding-bottom: 6px;"> Will Teach You</a>
				</div>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">


					<li class="padding-header-top"><a
						href="<%=request.getContextPath()%>/Student">Students</a></li>
					<li class="padding-header-top"><a
						href="<%=request.getContextPath()%>/Company">Companies</a></li>
					<li class="padding-header-top"><a
						href="<%=request.getContextPath()%>/Volunteer">Volunteers</a></li>


					<li class="padding-header-top"><a
						href="<%=request.getContextPath()%>/login">Login</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>