<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>TryKaro-Beauty Store|Find and Try Samples of
	Skincare,Makeup,Haircare,Fragrances and Perfumes For Men & Women</title>
<meta name="title"
	content="Try samples of exclusive and latest skincare,makeup,fragrances and more from top brands @Trykaro.com">
<meta name="description"
	content="One place to get all of your beauty case selection right.Try samples of fragrances,perfumes,makeup,skincare and buy those you love from anywhere.Cash on delivery is available.">
<meta name="keywords"
	content="Now Try Fragrances,Now Try Perfumes ,Now Try Scents , In Bengaluru , IN Bangalore , Cosmetics in Bengaluru,perfume samples,beauty box,best cosmetics in India,exclusive fragrances,beauty care product samples,best brands,new beauty products,try personalized beauty product samples,try latest fragrances,trial samples in India,Paytmkaro,Try and Buy,experiential Marketing,one on one assistance,Best Service">
<meta property="og:title"
	content="Try samples of exclusive and latest skincare,makeup,fragrances and more from top brands @Trykaro.com" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image"
	content="res/img/product/fragnance/banner2.jpg" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="Try samples of exclusive and latest skincare,makeup,fragrances and more from top brands @Trykaro.com" />
<meta name="twitter:description"
	content="One place to get all of your beauty case selection right.Try samples of fragrances,perfumes,makeup,skincare and buy those you love from anywhere.Cash on delivery is available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image"
	content="res/img/product/fragnance/banner2.jpg" />
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
	<%@ include file="navigation-module.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- SLIDER -->
		<c:choose>
			<c:when test="${brand == ''}">
				<section class="slide _1 body-part" style="background-color: white;">
					<div class="container">
						<div class="slide-cn _1" id="slide-home">
							<!-- SLIDE ITEM -->
							<div class="slide-item ">
								<div class="item-inner">
									<div class="text text-r" style="margin-top: -80px;">
										<h3></h3>
										<div class="group"></div>
									</div>
									<div class="img img-l bannerimage">
										<img src="res/img/product/fragnance/banner-fragrance-1.jpg"
											style="width: 1200px;"
											alt="Wide range of beauty care products and fragrances">
									</div>
								</div>
							</div>
							<!-- SLIDE ITEM -->
							<!-- SLIDE ITEM -->
							<div class="slide-item ">
								<div class="item-inner">
									<div class="text text-r" style="margin-top: -80px;">
										<h3></h3>
										<div class="group"></div>
									</div>
									<div class="img img-l bannerimage">
										<img src="res/img/product/fragnance/fragrance-banner-2.jpg"
											style="width: 1200px;"
											alt="Find latest and exclusive beauty care products">
									</div>
								</div>
							</div>
							<!-- SLIDE ITEM -->
						</div>
					</div>
				</section>
			</c:when>
			<c:otherwise>
				<section class="breakcrumb bg-grey listtext">
					<div class="container">
						<h3 class="pull-left">
							<span> ${product.productName} </span>
						</h3>
						<ul class="nav-breakcrumb  pull-right" id="">
							<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
							<li><a href="<%=request.getContextPath()%>/fragrance">Fragrance</a></li>
							<li><span id="productName">${brand}</span></li>
						</ul>
					</div>
				</section>
			</c:otherwise>
		</c:choose>

		<!-- NEW ARRIVALS -->
		<section class="new-arrivals _1 body-part">
			<div class="container">
				<c:choose>
					<c:when test="${brand == ''}">
						<div class="heading _1 text-center">
							<h2 class="text-uppercase listtext">Top Fragrances</h2>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-center">
							<h2 class="text-uppercase listtext">${brand}</h2>
							<p>Currently Showing ${productCount} items</p>
						</div>
					</c:otherwise>
				</c:choose>


				<!-- <div class="col-md-9 col-md-push-3"> -->
				<div class="new-arrivals-cn _1">
					<div class="row">
						<div class="content-placeholder"></div>
						<c:forEach var="product" items="${productList}">


							<a alt="${product.productName}"
								href="<%=request.getContextPath()%>/fragranceDetails?${fn:replace(product.features['Brand Name'],' ','-')}${fn:replace(product.productName,' ','-')}&id=${product.productId}#">
								<div title="${product.productName}"
									class="col-md-3 col-sm-6 col-xs-12 productlisting">
									<div class="single-team-member">
										<div class="team-member-img">
											<img src="${product.images['image3']}"
												alt="${product.productName}">
										</div>
										<div class="team-member-name">
											<p title="${product.productName}"
												class=" text-ellipsis special-price">${product.productName}</p>
											<p class="price font-weight-800">${product.features["Brand Name"]}
											</p>
											<span class="price">${product.features["Ideal For"]}</span> <span
												class="special-price"><i class="fa fa-inr"></i>
												${product.features["Trial Price"]} (Trial Price)</span>
										</div>
									</div>
								</div>
							</a>

						</c:forEach>
					</div>

				</div>
				<!--  </div> -->
				<%--<%@ include file="fragrancefilterpanel.jsp"%> --%>
			</div>
		</section>
		<br>
		<!-- END NEW ARRIVALS -->


		<c:if test="${total > 20}">
			<div>
				<ul class='pagination' style="margin-top: 5%; padding-left: 42%;">
					<c:choose>
						<c:when test="${prev == 0}">
							<li class='pagination-prev'><a href='#'
								style="color: #d5375f">Prev</a></li>
						</c:when>
						<c:otherwise>

							<li class='pagination-prev'><a style="color: #d5375f"
								href='<%=request.getContextPath()%>/fragrance?pageNumber=${prev}&category=fargrance&tot=${total}'>Prev</a></li>
						</c:otherwise>

					</c:choose>

					<c:forEach begin="1" end="${count}" step="1" varStatus="loop">

						<li id='page-${loop.count}'><a style="color: #d5375f"
							href='<%=request.getContextPath()%>/fragrance?pageNumber=<c:out value="${loop.count}"/>&category=fargrance&tot=${total}'><c:out
									value="${loop.count}" /> </a></li>

					</c:forEach>
					<li class='pagination-next'><a style="color: #d5375f"
						href='<%=request.getContextPath()%>/fragrance?pageNumber=${next}&category=fargrance&tot=${total}'>Next</a></li>
				</ul>
			</div>
		</c:if>
		<!-- PARTNER -->
		<%-- 		<%@ include file="partner.jsp"%> --%>
		<!-- END PARTNER -->
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>