<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>${productDetail.brandName} ${productDetail.productName}</title>
<meta name="title"
	content="${productDetail.brandName} ${productDetail.productName}-Try it @TryKaro.com ">
<meta name="description"
	content="TryKaro.com-${productDetail.brandName} ${productDetail.productName} try at Rs ${productDetail.trialPrice} @TryKaro.com">
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
					<span>${productDetail.brandName}  ${productDetail.productName} </span>
				</h3>
				<ul class="nav-breakcrumb  pull-right" id="">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/store">Store</a></li>
					<li><a href="<%=request.getContextPath()%>/fashionapparel">Apparels</a></li>
					<li><span id="<%=request.getContextPath()%>/productName"> ${productDetail.brandName} ${productDetail.productName}</span></li>
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
								<a id="view_full_size" class="" href="${productDetail.image1} ">
									<img src="${productDetail.image1}"
									style="width: 300px; height: 400px;"
									alt="${productDetail.brandName} ${productDetail.productName}" />
									<span class="view-link"></span>
								</a>
							</div>
							<div class="view-block">
								<ul class="thumb_list">
									<c:choose>
										<c:when test="${productDetail.image1 != NULL}">
											<li class="active" data-src="${productDetail.image1}"><img
												src="${productDetail.image1}"
												alt="${productDetail.brandName} ${productDetail.productName}" />
											</li>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${productDetail.image2 != NULL}">
											<li data-src="${productDetail.image2}"><img
												src="${productDetail.image2}"
												alt="${productDetail.brandName} ${productDetail.productName}" /></li>
										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${productDetail.image3 != NULL}">
											<li data-src="${productDetail.image3}"><img
												src="${productDetail.image3}"
												alt="${productDetail.brandName} ${productDetail.productName}" /></li>
										</c:when>
									</c:choose>

									
								</ul>
							</div>
							<div class="share">
								<span>Share:</span> <a target="_blank"
									href="//www.facebook.com/sharer.php?u=http://www.trykaro.com/apparelsDetails?id=${product.productId}&#${product.features['Brand Name']} ${product.productName}"
									class="_1"><i class="fa fa-facebook-square"></i></a> <a
									target="_blank"
									href="//twitter.com/share?url=http://www.trykaro.com/apparelsDetails?id=${product.productId}&#${product.features['Brand Name']} ${product.productName}"
									class="_2"><i class="fa fa-twitter-square"></i></a>
							</div>
						</div>
					</div>
					<div class="col-r">
						<div class="product-text listtext">
							<h1 class="name">${productDetail.brandName} ${productDetail.productName}</h1>
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
										${productDetail.trialPrice} </span>(per 3 days) +  Refundable Deposit:<i class="fa fa-inr"></i>. ${productDetail.trialPrice}
								</p>
							</div>
							
							<div class="price-box" id="note">
								<p class="special-price "
									style="color: #d5375f; font-size: 14px;">
									<b>DELIVERS WITHIN 3 WORKING DAYS</b><br/>
								</p>
							</div>
								<div class="price-box" id="note">
								<p class="special-price "
									style="color: #d5375f; font-size: 14px;">
									Free accessories, on availability.<br/> 
Return within 3 days after delivery, contact us for longer trials.
									
									
								</p>
							</div>
							<div class="price-box">
								<p class="special-price ">
									<i class="price pricetext">MRP : </i> 	<span class="price pricetext"><i class="fa fa-inr"></i>.
										${productDetail.retailPrice}
									</span>
									<!-- <a href="http://www.candidknots.com"
												target="_blank" class="btn btn-3"
												style="border-radius: 162px;"> Shop Here</a> -->
								</p>
							</div>
							<div class="short-description">
								<div>
									<b>Print Size - </b>${productDetail.size}</div>
							</div>
							<div class="hr _1"></div>
							<div class="add-to-box clearfix">
								<div class="add-to-cart" id="addtocart">
									<a href="#" class="btn btn-3 text-uppercase"
										id="${productDetail.clothId}" name="${productDetail.category}"><i
										class="fa fa-cart-plus"></i> <span>Add To Trial Bag </span></a>
								</div>
								<div class="add-to-cart" id="addinwishlist"
									name="${productDetail.clothId}">
									<!--  <a href="#" class="btn btn-3 text-uppercase"  name="2"><i
										class="fa fa-heart-o"></i> <span>Add To Wishlist</span></a>-->
								</div>
								<!--  	<div class="add-to-user">
									<a href="#" class="btn btn-13"><i class="fa fa-heart-o"></i>
										<span>Add to WishList</span></a> <!--  <a href="#" class="btn btn-13"><i
										class="fa fa-refresh"></i> <span>Add to Compare</span></a>-->
								<!--  	</div>-->
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
								<div>${productDetail.productName}</div>
								<div>
									<b>Size : </b>${productDetail.size}
								</div>
								<div>
									<b>Waist Size : </b>${productDetail.measurementWaistSize}</div>
								<div>
									<b>Bust Size :</b>${productDetail.measurementBustSize}</div>
								<div>
									<b>Style and Fit : </b>${productDetail.styleAndFit}</div>
								<div>
									<b>Fabric : </b>${productDetail.fabric}</b>
								</div>
								<div>
									<b>Sleeve : </b>${productDetail.sleeve}
								</div>
								<div>
									<b>Fit : </b> ${productDetail.fit}
								</div>
								<div>
									<b>Length : </b>${productDetail.length}</div>
							</div>
						</div>
						<div class="tab-pane" id="information">
							<div class="text-content"></div>
							<div>
								<b>Style:</b> ${productDetail.style}
							</div>
							<div>
								<b>Neckline : </b>${productDetail.neckline}</div>
							<div>
								<b>Ideal For : </b>${productDetail.idealFor}
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
		<%@ include file="partner.jsp"%>
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!--  <a class="btn" data-popup-open="popup-1" href="#">Open Popup #1</a>-->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
	<!--Model review start -->
	<div class="popup" data-popup="popup-1">
		<div class="modal-dialog">
			<a class="popup-close" data-popup-close="popup-1" href="#">x</a>
			<div class="modal-content">
				<div class="modal-header heading _two text-left">
					<h2 class="modal-title modalheader" id="myModalLabel">
						<b>Write a review and let us know what you feel</b>
					</h2>
				</div>
				<div class="modal-body">
					<p class="modalcontent">
						<b>Note: All fields are mandatory</b> <sup></sup>
					</p>
					<div class="form login modalform" id="reviewtitle">
						<br> <input title="Review title" name=reviewtitle
							id=reviewtitle type="text" class="input-text" autocomplete="off"
							placeholder="Review Title" /> <input title="Reviewlike"
							name=reviewlike id=reviewlike type="text" class="input-text"
							autocomplete="off" placeholder="What you liked about product?" />
						<input title="Reviewdontlike" name=reviewdontlike
							id=reviewdontlike type="text" class="input-text"
							autocomplete="off"
							placeholder="What you didn't liked about product?" />
						<textarea name="txtMessage"
							class="form-control noradius widder-input" id=review
							placeholder="Your Review" name=review id=reviewmessage></textarea>
						<h3 class="modalheader">How Much Will You Rate It?</h3>
						<div class="row lead">
							<div id="stars" class="starrr" style="color: #d5375f;"></div>
						</div>
					</div>
					<div id="reviewerror" class="errormessage modalcontent"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="reviewsubmit"
						class="btn btn-13 btn-submit text-uppercase modalbutton">Submit
						Review</button>
				</div>
			</div>
		</div>
	</div>
	<!--Model review end -->
</body>
</html>