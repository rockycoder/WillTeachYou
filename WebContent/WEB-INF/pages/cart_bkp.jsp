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
						if (jQuery.parseJSON(getCookie("basket")) == null) {
							$('.table-cn tbody')
									.append(
											'<tfoot><tr class="tr-f"><td class="td-item">No Item Added</td></tr></tfoot>');

						} else {
							var length = jQuery.parseJSON(getCookie("basket")).length;
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
															+ '"><div class="img"><a href="#"><img src="'
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
															+ '</td><td class="td-remove text-center" ><a href="#" class="delete" onClick="deleteItem()" id="'
															+ i
															+ '"><img src="res/img/icon-delete.png"  id="'+i+'" alt=""></a></td></tr>');
								}
								// $(#originalprice).text(jQuery.parseJSON( getCookie("basket") )[i].trialPrice) ;
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
	<%@ include file="navigation.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- BREAKCRUMB -->
		<section class="breakcrumb bg-grey">
			<div class="container listtext">
				<h3 class="pull-left">Your Trial Bag</h3>
				<ul class="nav-breakcrumb  pull-right">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/store">Store</a></li>
					<li><a href="<%=request.getContextPath()%>/cart">My Trial
							Bag</a></li>
				</ul>
			</div>
		</section>
		<!-- END BREAKCRUMB -->
		<!-- SHOP CART -->
		<section class="shop-cart">
			<div class="container">
				<!-- TABLE CART -->
				<div class="table-cn ">
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
								<td class="td-item"><b>* Note: We currently support
										only cash on delivery payment mode</b></td>
								<td></td>
								<td class="td-sub text-center"></td>
								<td class="td-sub text-center"></td>
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