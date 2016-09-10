<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>TryKaro-Find And Try Latest Exclusive Fashion Apparels
	For Men & Women</title>
<meta name="title"
	content="Find And Try Latest Exclusive Fashion Apparels For Men & Women @Trykaro.com">
<meta name="description"
	content="One stop to get all your fashion requirements right.Order trial for fashion apparels you love and buy from anywhere.">
<meta name="keywords"
	content="men fashion,women fashion,special occasion clothes,dress trial,try dresses in home,special dress bag,fashion blog,latest fashion,traditional wear,order dress trial in India ">
<meta property="og:title"
	content="Find And Try Latest Exclusive Fashion Apparels For Men & Women @Trykaro.com" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="res/img/product/clothing/banner4.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="Find And Try Latest Exclusive Fashion Apparels For Men & Women @Trykaro.com" />
<meta name="twitter:description"
	content="One stop to get all your fashion requirements right.Order trial for fashion apparels you love and buy from anywhere." />
<meta name="robots" content="index, follow">
<meta name="twitter:image"
	content="res/img/product/clothing/banner4.png" />
</head>
<body>

	<%@ include file="navigation.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- SLIDER -->



		<section class="slide _1" style="background-color: white;">
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
								<img src="res/img/product/clothing/banner4.png"
									style="width: 1200px;" alt="Latest fashion for men and women">
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
								<img src="res/img/product/clothing/banner5.png"
									style="width: 1200px;" alt="Try new exclusive dresses">
							</div>
						</div>
					</div>
					<!-- SLIDE ITEM -->
				</div>
			</div>
		</section>


		<!-- END SLIDER -->
		<!-- NEW ARRIVALS -->
		<section class="new-arrivals _1">
			<div class="container">
				<div class="heading _1 text-center">
					<h2 class="text-uppercase listtext">Popular Apparels</h2>
				</div>
				<!-- LOADING -->
				<!-- 	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<span class="loading-1"></span> <span class="loading-2"></span> <span
				class="loading-3"></span>
		</div>
	</div> -->
				<!-- END LOADING -->
				<div class="new-arrivals-cn _1">
					<div class="row">
						<!--  <div class="col-xs-6 col-sm-4 col-md-3">-->
						<div class="content-placeholder"></div>
						<c:forEach var="product" items="${productList}">
							<div class="col-xs-6 col-sm-4 col-md-3 productlisting"
								style="height: 518px; width: 300px">
								<div class="grid-item _1 ">
									<div class="image">
										<a
											href="<%=request.getContextPath()%>/apparelsDetails?id=${product.productId}#${product.features['Brand Name']} ${product.productName}">
											<img src="${product.images['image1']}"
											alt="${product.features['Brand Name']} ${product.productName}">
										</a>
										<div class="action">
											<div class="group">
												<a id="detailView" name="${product.productId}"
													href="<%=request.getContextPath()%>/apparelsDetails?id=${product.productId}#${product.features['Brand Name']} ${product.productName}"><i
													class="fa fa-eye"></i></a>
											</div>
											<div class="rating">
												<span class="star"> <i class="fa fa-star-o"></i> <i
													class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
													class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
												</span> 0 Review(s)
											</div>
										</div>
									</div>
									<div class="text listtext">
										<div class="price-box">
											<div>
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="<%=request.getContextPath()%>/apparelsDetails?id=${product.productId}#${product.features['Brand Name']} ${product.productName}">
													<p class="special-price">
														<span class="price">${product.productName}</span>
												</a>
												</p>
											</div>
											<div>
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="<%=request.getContextPath()%>/apparelsDetails?id=${product.productId}#${product.features['Brand Name']} ${product.productName}">
													<p class="special-price">
														<span class="price">${product.features["Brand Name"]}</span>
												</a>
												</p>
											</div>
											<div>
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="<%=request.getContextPath()%>/apparelsDetails?id=${product.productId}#${product.features['Brand Name']} ${product.productName}">
													<p class="special-price">
														<span class="price"><i class="fa fa-inr"></i>
															${product.features["Trial Price"]} (Trial Price/ 3 Days)</span>
												</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<c:if test="${total > 24}">
			<div>
				<ul class='pagination' style="margin-top: 5%; padding-left: 42%;">
					<c:choose>
						<c:when test="${prev == 0}">
							<li class='pagination-prev'><a href='#'
								style="color: #d5375f">Prev</a></li>
						</c:when>
						<c:otherwise>

							<li class='pagination-prev'><a style="color: #d5375f"
								href='<%=request.getContextPath()%>/fashionapparel?pageNum=${prev}&category=fashionApparel&tot=${total}'>Prev</a></li>
						</c:otherwise>

					</c:choose>

					<c:forEach begin="1" end="${count}" step="1" varStatus="loop">

						<li id='page-${loop.count}'><a style="color: #d5375f"
							href='<%=request.getContextPath()%>/fashionapparel?pageNum=<c:out value="${loop.count}"/>&category=fashionApparel&tot=${total}'><c:out
									value="${loop.count}" /> </a></li>

					</c:forEach>
					<li class='pagination-next'><a style="color: #d5375f"
						href='<%=request.getContextPath()%>/fashionapparel?pageNum=${next}&category=fashionApparel&tot=${total}'>Next</a></li>
				</ul>
			</div>
		</c:if>


		<!-- END NEW ARRIVALS -->


		<!-- PARTNER -->
		<%@ include file="partner.jsp"%>
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