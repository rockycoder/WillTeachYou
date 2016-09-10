<%@ include file="headerfile.jsp"%>
<title>TryKaro-Select delivery address and place order</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
<meta name="keywords"
	content="TryKaro,Try Karo,home delivery address ,complete order,confirm order,review order,try in india,confirm email, mobile number confirmation,order now">
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

<body>
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
	<%@ include file="navigation.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- BREAKCRUMB -->
		<section class="breakcrumb bg-grey">
			<div class="container listtext">
				<h3 class="pull-left">Checkout</h3>
			</div>
		</section>
		<!-- END BREAKCRUMB -->
		<!-- CHECKOUT DETAIL -->
		<section class="product-detail _1 " style="margin-top: 0px">
			<div class="container">
				<div class="product-collateral" id="tabs-responsive">
					<div class="form check-out-form" id="description">
						<div class="row" style="margin: auto;">
							<div style="height: 15px;"></div>
							<form method="post" action="pgRedirect" id="deliveryaddress"
								name="delivery address" onsubmit="return checkOutValidation()">
								<div>Payment Method</div>
								<div class="col-xs-12">
									<div>
										<input type="radio" name="paymentMethod" value="online"
											checked>Online<br>
									</div>
									<div>
										<input type="radio" name="paymentMethod"
											value="cashOnDelivery">Cash-On-Delivery<br>
									</div>
								</div>
								<br> <br> <br> <br> <br> <br>

								<div>Address Details</div>
								<br> <br>
								<div class="col-xs-6">
									<label>First Name <sup>*</sup></label> <input type="text"
										class="input-text" name="firstName" id="firstName">
								</div>
								<div class="col-xs-6">
									<label>Last Name <sup>*</sup></label> <input type="text"
										class="input-text" name="lastName" id="lastName">
								</div>
								<div class="col-xs-6">
									<label>Email Address <sup>*</sup></label> <input type="text"
										class="input-text" name="email" id="email">
								</div>
								<div class="col-xs-6">
									<label>Mobile Number <sup>*</sup></label> <input type="text"
										class="input-text" id="phone" name="phone">
								</div>
								<div class="col-xs-6">
									<label>Address <sup>*</sup></label> <input type="text"
										class="input-text" name="address" id="address">
								</div>
								<div class="col-xs-6">
									<label>Town/City<sup>*</sup></label> <input type="text"
										class="input-text" id="city" name="city">
								</div>
								<div class="col-xs-6">
									<label>Postal Code <sup>*</sup></label> <input type="text"
										class="input-text" id="postalCode" name="postalCode">
								</div>
								<div class="col-xs-6">
									<label>Country <sup>*</sup></label> <input type="text"
										class="input-text" id="country" name="country">
								</div>
								<div>
									<input name="customersId" type="hidden" id="customersId"
										value="${userDetail.customer.customersId}" />
								</div>
								<span id="firstnameerror" class="errormessage"></span>
								<div class="col-xs-12" style="padding-bottom: 10px;">
									<input class="btn btn-13 text-uppercase pull-right"
										type="submit" id="confirmdeliveryaddress"
										value="Confirm Order" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END CHECK OUT -->
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>