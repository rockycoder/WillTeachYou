<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>${productDetail.productName}</title>
<meta name="title"
	content="${productDetail.productName}-Try it @TryKaro.com ">
<meta name="description"
	content="TryKaro.com-${productDetail.productName} try at Rs ${productDetail.trialPrice} @TryKaro.com">
<meta name="keywords"
	content="${productDetail.brandName} ${productDetail.productName},${productDetail.brandName},${productDetail.productName},try ${productDetail.brandName} ${productDetail.productName},try ${productDetail.brandName},try upcoming mobiles,latest electronics,TryKaro,${productDetail.brandName} India,wearables electronics ">
<meta property="og:title"
	content="${productDetail.productName}-Try it @TryKaro.com" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="${productDetail.image1}" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="${productDetail.productName}" />
<meta name="twitter:title"
	content="${productDetail.productName}-Try it @TryKaro.com" />
<meta name="twitter:description"
	content="TryKaro.com -${productDetail.productName} try at Rs ${productDetail.trialPrice} @TryKaro.com" />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="${productDetail.image1}" />
</head>
<body>
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<span class="loading-1"></span> <span class="loading-2"></span> <span
				class="loading-3"></span>
		</div>
	</div>
	<!-- END LOADING -->
	<%@ include file="navigation.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- BREAKCRUMB -->
		<div id="details"></div>
		<section class="breakcrumb bg-grey listtext">
			<div class="container">
				<h3 class="pull-left">
					<span> ${productDetail.productName} </span>
				</h3>
				<ul class="nav-breakcrumb  pull-right" id="">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/store">Store</a></li>
					<li><a href="<%=request.getContextPath()%>/electronics">Electronics</a></li>
					<li><span id="productName">${productDetail.productName}</span></li>
				</ul>
			</div>
		</section>
		<!-- END BREAKCRUMB -->
		<!-- PRODUCT DETAIL -->
		<section class="product-detail _1 ">
			<div class="container">
				<div class="row">
					<div class="col-l text-center">
						<div class="product-image">
							<div class="image-block">
								<a id="view_full_size" class=""
									href="${productDetail.image1} "> <img
									src="${productDetail.image1}"
									style="width: 400px; height: 550px;"
									alt="${productDetail.productName}" />
								</a>
							</div>
							<div class="view-block">
								<ul class="thumb_list">
									<li class="active" data-src="${productDetail.image1}"><img
										src="${productDetail.image1}"
										style="width: 70px; height: 100px;"
										alt="${productDetail.productName}" /></li>
									<c:choose>
										<c:when test="${productDetail.image2 != NULL}">
											<li data-src="${productDetail.image2}"><img
												src="${productDetail.image2}"
												style="width: 70px; height: 100px;"
												alt="${productDetail.productName}" /></li>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${productDetail.image3 != NULL}">
											<li data-src="${productDetail.image3}"><img
												src="${productDetail.image3}"
												style="width: 70px; height: 100px;"
												alt="${productDetail.productName}" /></li>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${productDetail.image4 != NULL}">
											<li data-src="${productDetail.image4}"><img
												src="${productDetail.image4}"
												style="width: 70px; height: 100px;" alt="" /></li>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<div class="share">
								<span>Share:</span> <a target="_blank"
									href="//www.facebook.com/sharer.php?u=http://www.trykaro.com/electronicsdetail?id=${product.productId}&#${product.productName}"
									class="_1"><i class="fa fa-facebook-square"></i></a> <a
									target="_blank"
									href="//twitter.com/share?url=http://www.trykaro.com/electronicsdetail?id=${product.productId}&#${product.productName}"
									class="_2"><i class="fa fa-twitter-square"></i></a>
							</div>
						</div>
					</div>
					<div class="col-r">
						<div class="product-text listtext">
							<h1 class="name">${productDetail.productName}</h1>
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
							<span class="product_stock">Available</span> <span
								class="product_sku"> Manufacturer:
								${productDetail.brandName}</span>
							<div class="hr _1"></div>
							<div class="price-box" id="price">
								<p class="special-price "
									style="color: #d5375f; font-size: 16px;">
									Trial Price: <i class="fa fa-inr"></i>.<span>
										${productDetail.trialPrice} </span>(for 2hrs)
								</p>
							</div>
							<div class="price-box" id="note">
								<p class="special-price "
									style="color: #d5375f; font-size: 12px;">
									Note:Trial price mentioned above is delivery and handling
									charges for the trial. <br /> And this trial price will be
									refunded if you buy the product from the seller giving you the
									Trial.
								</p>
							</div>
							<div class="price-box">

								<p class="special-price">
									<i class="price pricetext">MRP : </i> <span class="price pricetext"><i class="fa fa-inr"></i>.
										${productDetail.price}
									</span>
								</p>
							</div>
							<div class="short-description">

								<div>
									<b>Operating System-</b> ${productDetail.operatingSystem}
								</div>
								<div>
									<b>Front Camera- </b>${productDetail.frontCamera}</div>
								<div>
									<b>Processor - </b>${productDetail.processor}</div>
							</div>
							<div class="hr _1"></div>
							<div class="add-to-box clearfix">
								<div class="add-to-cart" id="addtocart">
									<a href="#" class="btn btn-3 text-uppercase"
										id="${productDetail.productId}" name="1"><i
										class="fa fa-cart-plus"></i> <span>Add To Trial Bag </span></a>
								</div>
								<div class="add-to-cart" id="addinwishlist"
									name="${productDetail.productId}">
									<!--  <a href="#" class="btn btn-3 text-uppercase"  name="2"><i
										class="fa fa-heart-o"></i> <span>Add To Wishlist</span></a>-->
								</div>
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
									<b>Name : </b>${productDetail.productName}
								</div>
								<div>
									<b>Camera : </b> ${productDetail.camera}
								</div>

								<div>
									<b>Front Camera :</b> ${productDetail.frontCamera}
								</div>
								<div>
									<b>RAM : </b> ${productDetail.ram}
								</div>

								<div>
									<b>Screen Resolution : </b>${productDetail.screenResolution}</div>
								<div>
									<b>Screen Size : </b>${productDetail.screenSize}
								</div>
								<div>
									<b>Processor : </b>${productDetail.processor}
								</div>
								<div>
									<b>Internal Memory : </b> ${productDetail.internalMemory}
								</div>
								<div>
									<b>GPU : </b>${productDetail.gpu}</div>
								<div>
									<b>Chipset : </b>${productDetail.processorChipset}</div>
							</div>
						</div>
						<div class="tab-pane" id="information">
							<div class="text-content">
								<div>
									<b>Battery Talktime : </b>${productDetail.batteryTalkTime}</div>
								<div>
									<b>Battery Type : </b>: ${productDetail.battery}
								</div>
								<div>
									<b>Bluetooth : </b>${productDetail.bluetooth}</div>
								<div>
									<b>Expandable Memory : </b>${productDetail.expandableMemory}</div>
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
		<!-- END PRODUCT RELATED -->
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