<%@ include file="headerfile.jsp"%>
<title>Trykaro, Error page</title>
</head>
<body>
	<%@ include file="navigation.jsp"%>
	<section class="page-404" style="background-color: #ffffff;">
		<!-- CONTENT -->
		<div class="page-404-cn  text-center">
			<div class="container">
				<h3>

					<c:choose>
						<c:when test="${not empty headingError}">
							<span>${headingError}</span>
						</c:when>
						<c:otherwise>
							<span>OOPS</span>Error
					</c:otherwise>
					</c:choose>


				</h3>

				<c:choose>
					<c:when test="${not empty PaytmErrorMessage}">
						<p>${PaytmErrorMessage}</p>
					</c:when>
					<c:otherwise>
						<p>Something went wrong!!! Please try again</p>
					</c:otherwise>
				</c:choose>


				<a href="<%=request.getContextPath()%>/index"
					class="btn btn-10 text-uppercase">Back To Home Page</a>
			</div>
		</div>
		<!--END CONTENT -->
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>