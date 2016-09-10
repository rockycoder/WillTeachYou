<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>${productDetail.brandName}${productDetail.productName}</title>
<meta name="title"
	content=" ${productDetail.brandName} ${productDetail.productName}-Try it @TryKaro.com ">
<meta name="description"
	content="TryKaro.com- ${productDetail.brandName} ${productDetail.productName} try at Rs ${productDetail.trialPrice} @TryKaro.com">
<meta name="keywords"
	content="${productDetail.brandName} ${productDetail.productName},${productDetail.brandName},${productDetail.productName},try ${productDetail.brandName} ${productDetail.productName},try ${productDetail.brandName},try dresses,new fashion,TryKaro,${productDetail.brandName} India,men and women ">
<meta property="og:title"
	content="${productDetail.brandName} ${productDetail.productName}-Try it @TryKaro.com" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="${productDetail.image1}" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site"
	content="${productDetail.brandName} ${productDetail.productName}" />
<meta name="twitter:title"
	content="${productDetail.brandName} ${productDetail.productName}-Try it @TryKaro.com" />
<meta name="twitter:description"
	content="TryKaro.com - ${productDetail.brandName} ${productDetail.productName} try at Rs ${productDetail.trialPrice} @TryKaro.com" />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="${productDetail.image1}" />
</head>

<body>
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
<!-- 			<img class="logoimage" src="res/img/logo.png" alt="trykaro logo"
				style="width: 75px; height: 75px;" /> <br>
			<br> -->
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
	<div class="overlay">
		<div id="loading-img"></div>
	</div>
	<%@ include file="navigation-module.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- BREAKCRUMB -->

		<div id="details"></div>
		<section class="breakcrumb bg-grey listtext body-part">
			<div class="container">
				<h3 class="pull-left">
					<span> ${productDetail.brandName}
						${productDetail.productName} </span>
				</h3>
				<ul class="nav-breakcrumb  pull-right" id="">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/beautycare">Beauty
							Care</a></li>
					<li><span id="productName">${productDetail.brandName}
							${productDetail.productName}</span></li>
				</ul>
			</div>
		</section>
		<!-- END BREAKCRUMB -->
		<!-- PRODUCT DETAIL -->
		<section class="product-detail _1 body-part">
			<div class="container">
				<div class="row">
					<div class="col-l text-center">
						<div class="product-image">
							<img src="res/img/Try-n-Retain.png"
								style="width: 100px; height: 100px; position: absolute; position: 0px; top: 5px; bottom: 0px; left: 70%; z-index: 1;"
								alt=" ">

							<div class="image-block">


								<c:choose>
									<c:when test="${productDetail.subCategory != 'Lipstick'}">
										<a id="view_full_size" class=""
											href="${productDetail.image1} "> <img
											src="${productDetail.image1}"
											style="width: 400px; height: 500px;"
											alt="${productDetail.brandName} ${productDetail.productName}" />

										</a>
									</c:when>
									<c:otherwise>
										<a id="view_full_size" class="" href="${image1} "> <img
											src="${image1}" style="width: 400px; height: 500px;"
											alt="${productDetail.brandName} ${productDetail.productName}" />

										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="view-block">
								<ul class="thumb_list">
									<c:choose>
										<c:when test="${productDetail.subCategory != 'Lipstick'}">
											<c:choose>
												<c:when test="${productDetail.image1 != NULL}">
													<li class="active" data-src="${productDetail.image1}"><img
														src="${productDetail.image1}"
														style="width: 70px; height: 100px;"
														alt="${productDetail.brandName} ${productDetail.productName}" />
													</li>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${productDetail.image2 != NULL}">
													<li data-src="${productDetail.image2}"><img
														src="${productDetail.image2}"
														style="width: 70px; height: 100px;"
														alt="${productDetail.brandName} ${productDetail.productName}" /></li>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${productDetail.image3 != NULL}">
													<li data-src="${productDetail.image3}"><img
														src="${productDetail.image3}"
														style="width: 70px; height: 100px;"
														alt="${productDetail.brandName} ${productDetail.productName}" /></li>
												</c:when>
											</c:choose>

											<c:choose>
												<c:when test="${productDetail.image4 != NULL}">
													<li data-src="${productDetail.image4}"><img
														src="${productDetail.image4}"
														style="width: 70px; height: 100px;"
														alt="${productDetail.brandName} ${productDetail.productName}" /></li>
												</c:when>

											</c:choose>
										</c:when>
										<c:otherwise>
											<li data-src="${image1}"><img src="${image1}"
												style="width: 70px; height: 100px;"
												alt="${productDetail.brandName} ${productDetail.productName}" /></li>

										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<div class="share">
								<span>Share:</span> <a target="_blank"
									href="http://www.facebook.com/sharer.php?u=trykaro.com/beautyCareDetail?id=${productDetail.id}#${productDetail.brandName} ${productDetail.productName}"
									class="_1"><i class="fa fa-facebook-square"></i></a> <a
									target="_blank"
									href="//twitter.com/share?url=trykaro.com/beautyCareDetail?id=${productDetail.id}#${productDetail.brandName} ${productDetail.productName}"
									class="_2"><i class="fa fa-twitter-square"></i></a>
							</div>
						</div>
					</div>
					<div class="col-r">
						<div class="product-text listtext">
							<h1 class="name">${productDetail.brandName}
								${productDetail.productName}</h1>
							<h4 class="name"></h4>
							<div class="product_review">
								<div class="review_star">
									<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<ul class="review_text">
									<li><a href="#"><span>(0)</span>Reviews</a></li>
									<li><a data-popup-open="popup-1" href="#">Write a
											review</a></li>
								</ul>
							</div>
							<c:choose>
								<c:when test="${productDetail.inStock > 0}">
									<span class="product_stock">Available</span>
								</c:when>
								<c:otherwise>
									<span class="product_outofstock">Out of Stock</span>
								</c:otherwise>
							</c:choose>
							<span class="product_sku">
								Manufacturer:${productDetail.brandName} </span>

							<div class="thumbnail-lipstick">
								<ul class="variant">
									<c:choose>
										<c:when test="${productDetail.subCategory == 'Lipstick'}">
											<c:forEach var="color" items="${thumbNailList}">
												<li class="color-box"><span><img
														class="thumbnail-lipstick" alt="${color}"
														src="${fn:replace(productDetail.image1,'Image',color)}"></span>
													<span id="hidden-span" hidden="true">${productDetail.image2}</span></li>

											</c:forEach>

										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<div class="price-box" id="price">
								<p
									class="special-price font-weight-800 font-size-18 tryKaro-note-color">
									Trial Price: <i class="fa fa-inr"></i>.<span>${productDetail.trialPrice}
									</span>(per sample of around ${productDetail.trialSize})
								</p>
							</div>


							<div class="price-box" id="note">
								<p class="special-price tryKaro-note-color">${productDetail.trykaroNote}</p>
							</div>

							<div class="price-box">
								<p class="special-price">
									<i class="price pricetext">MRP : </i> <span
										class="price pricetext"><i class="fa fa-inr"></i>. <c:choose>
											<c:when test="${productDetail.price != 0.0}">
											${productDetail.price}
										</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose> </span>
								</p>
							</div>

							<div class="hr _1"></div>
							<div class="add-to-box clearfix">
								<c:choose>
									<c:when test="${productDetail.inStock > 0}">
										<div class="add-to-cart" id="addtocart">
											<a href="#" class="btn btn-3 text-uppercase"
												id="${productDetail.id}" name="${productDetail.categoryId}">
												<i class="fa fa-cart-plus"></i> <span>Add To Trial
													Bag </span>
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="add-to-cart disable-div-button" id="addtocart">
											<a href="#" class="btn btn-3 text-uppercase"
												id="${productDetail.id}" name="${productDetail.categoryId}">
												<i class="fa fa-cart-plus"></i> <span>Add To Trial
													Bag </span>
											</a>
										</div>
										<%-- <div class="add-to-cart" id="notifyOutOfStockProduct">
									<a href="#" class="btn btn-3 text-uppercase"
										id="${productDetail.id}" name="${productDetail.categoryId}">
										 <span>Notify Me
									</span>
									</a>
								</div> --%>
									</c:otherwise>
								</c:choose>
								<div class="add-to-cart" id="addinwishlist"
									name="${productDetail.id}"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="product-collateral listtext" id="tabs-responsive">
					<ul class="nav-tab">
						<li class="active"><a href="#description"
							aria-controls="description" data-toggle="tab">Details</a></li>
						<li><a href="#information" aria-controls="information"
							data-toggle="tab">Additional Details</a></li>
						<li><a href="#customer" aria-controls="customer"
							data-toggle="tab">User Reviews</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane" id="description">
							<div class="text-content">
								<div>
									<h4>${productDetail.brandName}
										${productDetail.productName}</h4>
								</div>
								<div>
									<b>Description : </b>${productDetail.description}
								</div>
								<div>
									<b>Feature : </b>${productDetail.feature}
								</div>
							</div>
						</div>
						<div class="tab-pane" id="information">
							<div class="text-content">
								<div>
									<b>Ingredients : </b>${productDetail.ingredients}
								</div>
								<div>
									<b>Usage : </b>${productDetail.usage}
								</div>
							</div>
						</div>
						<div class="tab-pane" id="customer">
							<div class="text-content">
								<div>No Review, be the first to review</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END PRODUCT DETAIL -->
		<!-- PARTNER -->
		<%-- 		<%@ include file="partner.jsp"%> --%>
		<!-- END PARTNER -->
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!--  <a class="btn" data-popup-open="popup-1" href="#">Open Popup #1</a>-->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
	<!--Model review start -->
	<%@ include file="feedbackpage.jsp"%>

	<!--Model review end -->
</body>
</html>