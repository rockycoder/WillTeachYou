<%@ include file="headerfile.jsp"%>
<title>TryKaro-Your Trial Bag</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
<meta name="keywords"
	content="TryKaro,Try Karo,try mobiles,try fashion apparels,beauty product samples,fragrances trial,try in india,beauty box,dress bag,gadget box ">
<meta property="og:title"
	content="TryKaro.com - India's First Website To Try Wide Range Of Products" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="res/img/logo.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="TryKaro.com - India's First Website To Try Wide Range Of Products" />
<meta name="twitter:description"
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/logo.png" />
</head>
<script>
	$(document)
			.ready(
					function() {

						var list = [];
						try {

							list = getLocalItems();
						} catch (err) {

							loadScript('res/js/library/jquery-cookie-file.js',
									function() {
										list = getLocalItems();
									});

						}

						$("#cart-table-content").css('display', 'none');
						$("#cart-loading").css('display', 'block');

						$
								.ajax({
									type : "POST",
									url : "sycCartWithServer?productsList="
											+ JSON.stringify(list),
									data : JSON.stringify(list),
									cache : false,
									success : function(result) {
										$("#cart-table-content").css('display',
												'block');
										$("#cart-loading").css('display',
												'none');
										var totalAmount = 0.0;
										if (result != null
												&& result != undefined
												&& result != '') {

											syncResponse = jQuery
													.parseJSON(result);
											if (syncResponse != undefined
													&& syncResponse != null
													&& syncResponse != '') {

												list = syncResponse.items;
												discountResponse = syncResponse.discountResponse;
												persistCouponAppliedValues(discountResponse);

											}

											if (typeof $.cookie('basket') === 'undefined') {

											} else {
												$.cookie("basket", null);
												$.removeCookie("basket");
											}
											var basket = $.cookie("basket")
													|| [];
											$.cookie("basket", basket);
											list
													.forEach(function(item) {
														if (item != null) {
															totalAmount = totalAmount
																	+ parseFloat($
																			.trim(item.trialPrice));
															basket.push(item);
														}
													});

											$.cookie("basket", basket);
											updateMiniItemBasket();
											updateCartValues();
											createCart(totalAmount);

										} else {

											if (list != null && list != ''
													&& list != undefined) {
												createCart(parseFloat($.trim($(
														"#totalamount").text())));

												updateCartValues();
											}

										}
									},
									error : function(result) {
										$("#cart-table-content").css('display',
												'block');
										$("#cart-loading").css('display',
												'none');
										$
												.toaster({
													priority : 'warning',
													title : '',
													message : 'Oops!!! Something went wrong,try again'
												});
									}
								});

						function getLocalItems() {
							var cookieData = $.cookie('basket');
							var list = [];
							var result;
							var data;
							if (cookieData != undefined && cookieData != null
									&& cookieData != '') {
								if ($.isArray(cookieData)) {
									data = cookieData;
								} else {
									data = JSON.parse(cookieData);
								}
								jQuery.each(data, function(i, item) {
									if (item != null) {
										var temp = {
											"productId" : item.productId,
											"categoryId" : item.categoryId,
											"color" : item.color,
											"customerid" : item.customerid

										};
										list.push(temp);
									}
								});
							}
							return list;
						}

						function createCart(totalAmount) {
							if (jQuery.parseJSON(getCookie("basket")) == null) {
								$('.table-cn tbody')
										.append(
												'<tfoot><tr class="tr-f"><td class="td-item">No Item Added</td></tr></tfoot>');

							} else {
								var length = jQuery
										.parseJSON(getCookie("basket")).length;
								var str = getCookie("basket");
								//$('.table table-cart tr:last-child').remove();
								for (var i = 0; i < length; ++i) {
									if (jQuery.parseJSON(getCookie("basket"))[i] != null) {
										$('.table-cn tbody ')
												.append(
														'<tr  id="'+i+'"><td class="td-item" id="'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].productId
																+ '" name="'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].categoryId
																+ '"><div class="img"><ahref="#" onclick="return false;" class="disable-a-tag-cursor"><img src="'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].imageUrl
																+ '"alt="" style="width:100px;height:100px;"></a></div><div class="info"><a href="#"></a><span class="attr">Product: <span>'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].productName
																+ '</span></span><span class="attr"><span></span></span></div></td><td class="td-sub text-center"><i class="fa fa-inr"></i>.'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].trialPrice
																+ '</td><td class="td-sub text-center" id="originalprice">'
																+ jQuery
																		.parseJSON(getCookie("basket"))[i].actualPrice
																+ '</td><td class="td-remove text-center" ><a href="#" class="delete" id="'
																	+ i
																	+ '"><img src="res/img/icon-delete.png"  id="'+i+'" alt=""></a></td></tr>');
									}
								}

							}

						}

					});
</script>
<body>
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<span class="loading-1"></span> <span class="loading-2"></span> <span
				class="loading-3"></span>
		</div>
	</div>
	<!-- END LOADING -->
	<%@ include file="navigation-module.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- BREAKCRUMB -->
		<section class="breakcrumb bg-grey">
			<div class="container listtext">
				<h3 class="pull-left">Your Trial Bag</h3>
				<%-- <ul class="nav-breakcrumb  pull-right">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/cart">My Trial
							Bag</a></li>
				</ul> --%>
			</div>
		</section>
		<!-- END BREAKCRUMB -->
		<!-- SHOP CART -->
		<section class="shop-cart">
			<div class="container">
				<!-- TABLE CART -->
				<div class="modelLoading" id="cart-loading" style="display: none;">
					<img style="padding-left: 36%; position: inherit;"
						src="res/img/gif/recover-password.gif"
						id="recover-password-loading">
				</div>
				<div class="table-cn" id="cart-table-content">
					<table class="table table-cart listtext">
						<thead>
							<tr>
								<th>Items</th>
								<th>Trial Price</th>
								<th>Original Price</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr class="tr-f">
								<td class="td-item"></td>
								<td></td>
								<td class="td-sub text-center">Total Amount :</td>
								<td class="td-sub text-center" id="total-amount">0.0</td>
								<td></td>
							</tr>
							<tr class="tr-f">
								<td class="td-item"></td>
								<td></td>
								<td class="td-sub text-center">Discount Amount :</td>
								<td class="td-sub text-center" id="discount-amount">0.0</td>
								<td></td>
							</tr>
							<tr class="tr-f">
								<td class="td-item"></td>
								<td></td>
								<td class="td-sub text-center">Delivery Charges(Applicable
									if Total amount is less then 100 Rs) :</td>
								<td class="td-sub text-center" id="delivery-amount">0.0</td>
								<td></td>
							</tr>
							<tr class="tr-f">
								<td class="td-item"></td>
								<td></td>
								<td class="td-sub text-center">Final Amount :</td>
								<td class="td-sub text-center" id="final-amount">0.0</td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- END TABLE CART -->
				<!-- CART BUTTON -->
				<div class="shop-button clearfix listtext"
					style="background-color: white;">
					<!--  <a href="#" class="btn btn-13 pull-left">Update Wishlist</a>-->
					<c:choose>
						<c:when
							test="${not empty userDetail && userDetail.customer.customersEmailAddress !=null }">
							<a href="#" id="checkoutConfirmWithLogin"
								class="btn btn-13 pull-right">Proceed to Checkout</a>
						</c:when>
						<c:otherwise>
							<a href="#" id="checkoutConfirm" class="btn btn-13 pull-right">Proceed
								to Checkout</a>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- END CART BUTTON -->
				<!-- CART COLLATERALS -->
				<div class="cart-collaterals">
					<div class="row">

						<div class="col-sm-6 col-md-4">
							<h2>Got a Coupon?</h2>
							<input type="text" class="input-text" id="apply-coupon-text"
								placeholder="Enter coupon code...">
							<button id="apply-coupon" class="btn btn-13">APPLY</button>
							<!-- <a id="removeCoupon" href="#" >Remove Coupon </a> -->
						</div>
					</div>
				</div>
				<!-- END CART COLLATERALS -->
			</div>
		</section>
		<!-- END SHOP CART -->
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>