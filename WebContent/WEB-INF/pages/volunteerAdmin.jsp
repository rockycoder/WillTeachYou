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

						$
								.ajax({
									type : "POST",
									url : "sycCartWithServer?productsList="
											+ JSON.stringify(list),
									data : JSON.stringify(list),
									cache : false,
									success : function(result) {

										var length = jQuery.parseJSON(result).length;
										var arr = result;
										//$('.table table-cart tr:last-child').remove();
										for (var i = 0; i < length; ++i) {
											if (jQuery
													.parseJSON(getCookie("basket"))[i] != null) {
												$('.table-cn tbody ')
														.append(
																'<tr  id="'+i+'"><td class="td-item" id="'
																		+ arr[i].productId
																		+ '" name="'
																		+ arr[i].categoryId
																		+ '"><div class="img"><ahref="#" onclick="return false;" class="disable-a-tag-cursor"><img src="'
																		+ arr[i].imageUrl
																		+ '"alt="" style="width:100px;height:100px;"></a></div><div class="info"><a href="#"></a><span class="attr">Product: <span>'
																		+ arr[i].productName
																		+ '</span></span><span class="attr"><span></span></span></div></td><td class="td-sub text-center"><i class="fa fa-inr"></i>.'
																		+ arr[i].trialPrice
																		+ '</td><td class="td-sub text-center" id="originalprice">'
																		+ arr[i].actualPrice
																		+ '</td><td class="td-remove text-center" ><a href="#" class="delete" id="'
																			+ i
																			+ '"><img src="res/img/icon-delete.png"  id="'+i+'" alt=""></a></td></tr>');
											}
										}

									},
									error : function(result) {

									}
								});

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

					</table>
				</div>
			</div>
		</section>
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>