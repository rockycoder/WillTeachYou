<%@ include file="headerfile.jsp"%>
<title>Trykaro, Error page</title>
</head>
<body>
	<%@ include file="navigation.jsp"%>
	<section class="page-404" style="background-color: #ffffff;">
		<!-- CONTENT -->
		<div class="page-404-cn  text-center">
			<div class="container">
				<h2>
					<span>OOPS</span>Error
				</h2>
				<p>Page not found !!! Please try something else .</p>

				<a href="<%=request.getContextPath()%>/index"
					class="btn btn-10 text-uppercase">Back To Home Page</a>
			</div>
		</div>
		<!--END CONTENT -->
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>