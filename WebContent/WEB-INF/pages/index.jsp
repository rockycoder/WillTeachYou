<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>Share Knowledge</title>
<meta name="title"
	content="">
</head>

<body class="body-class">
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<div class="windows8">
				<div class="wBall" id="wBall_1">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_2">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_3">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_4">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_5">
					<div class="wInnerBall"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END LOADING -->
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="res/img/hack/EducationBanner1.jpg"
						alt="Try Finest Perfumes with us">

				</div>

				<div class="item">
					<img src="res/img/hack/EducationBanner3.jpg"
						alt="TryKaro, New Way To Decide What To Shop">

				</div>
				<div class="item">
					<img src="res/img/hack/EducationBanner7.jpg"
						alt="TryKaro, New Way To Decide What To Shop">

				</div>

			</div>
			<!-- Left and right controls -->
		</div>
		
		<section class="benefits-wrapper scrolldown body-part">
			<div class="benefits-container container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li><a href="#featured" data-toggle="tab"
							style="cursor: context-menu; color: black;">Companies With Us
								</a></li>
					</ul>
				</div>

				<div class="benefits" style="margin-top: 35px;">


					<div class="benefit col-sm-3">
						<a href="<%=request.getContextPath()%>/jabra#Jabra Headphones"><img
							src="res/img/homepage/Jabra.png" width="100%"
							alt="Jabra Headphones"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/fragrance?brand=All Good Scents#All-Good-Scents"><img
							src="res/img/all-good-scents-banner.png" width="100%"
							alt="Latest All Good Scents Perfumes"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/beautycare?brand=ORIFLAME#Try-oriflame-cosmetics"><img
							src="res/img/homepage/oriflamehome.jpg" width="100%"
							alt="ORIFLAME COSMETICS FOR TRIAL"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/sensegizDetail#Sense-Giz-Find"><img
							src="res/img/sensegiz-find.png" width="100%" alt="Sensegiz find"></a>
					</div>


				</div>
				<br> <br>
				<div class="benefits">


					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/beautycare?brand=BIODERMA#Boiderma-Cosmetics"><img
							src="res/img/homepage/Bioderma.png" width="100%"
							alt="Boiderma Cosmetics"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/beautycare?brand=SOUL TREE#soul-tree-cosmetics"><img
							src="res/img/homepage/soulTree.png" width="100%"
							alt="Soul Tree Cosmetics"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/beautycare?brand=The Man Company#the-man-company"><img
							src="res/img/homepage/Themancompany.png" width="100%"
							alt="The Man Company"></a>
					</div>
					<div class="benefit col-sm-3">
						<a href="<%=request.getContextPath()%>/teeweDetail#Teewe2"><img
							src="res/img/homepage/Teewe.png" width="100%" alt="Teewe-2"></a>
					</div>


				</div>
			</div>
		</section></div>
<%-- 	<%@ include file="locationPopup.jsp"%> --%>
	<%@ include file="footer.jsp"%>

</body>
</html>
