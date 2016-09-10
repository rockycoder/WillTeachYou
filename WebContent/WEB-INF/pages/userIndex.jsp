<%@ include file="headerfile.jsp"%>
<title>Trykaro.Try Before Buy</title>
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="userNavigation.jsp"%>
		<section class="front index-page">
			<div class="front-container container">
				<div class="content">
					<h1>We Send You Free Trial Products</h1>
					<h1>Tell Us What You Think</h1>
					<br />
					<!--  <div class="get-started">

+						<div class="start-button">Join Trykaro</div>

+					</div>-->
					<div class="down-arrow">
						<a class="page-scroll"> <i class="fa fa-chevron-down"></i>
						</a>
					</div>
				</div>
			</div>

		</section>
		<br /> <br />
		<section class="steps-wrapper scrolldown">
			<div class="steps-container container">
				<div class="step-wrapper col-sm-4">
					<div class="step1">
						<div class="content">
							<!--<h1>Step 1</h1>
							<h3>Join Us</h3>-->
						</div>
					</div>
					<!--	<p class="step-description">Register with us and earn free credit points .</p>-->
				</div>
				<div class="step-wrapper col-sm-4">
					<div class="step2">
						<div class="content">
							<!--<h1>Step 2</h1>
							<h3>Order Free Trial Products</h3>-->
						</div>
					</div>
					<!--<p class="step-description">Explore different arrays of products from our store, compare them and order free trial.</p>-->
				</div>
				<div class="step-wrapper col-sm-4">
					<div class="step">
						<div class="content">
							<!--<h1>Step 3</h1>
							<h3>Get Free Home Delivery</h3>-->
						</div>
					</div>
					<!--<p class="step-description">Get orders on scheduled time, use products as you own them and buy from anywhere with our exclusive coupons.</p>
				-->
				</div>
			</div>
		</section>

		<section class="benefits-wrapper">
			<div class="benefits-container container">
				<div class="benefits-header">Trykaro benefits</div>
				<div class="benefits">
					<div class="benefit col-sm-4">
						<i class="fa fa-user-plus fa-5x"></i>
						<h3>
							Explore Various<br /> Products
						</h3>
					</div>
					<div class="benefit col-sm-4">
						<i class="fa fa-clone fa-5x"></i>
						<h3>
							Try Free <br /> Products
						</h3>
					</div>
					<div class="benefit col-sm-4">
						<i class="fa fa-weixin fa-5x"></i>
						<h3>
							Speak <br /> your Mind
						</h3>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
	if('serviceWorker' in navigator) {
        navigator.serviceWorker
       .register('sw.js')
       .then(function() { console.log("Service Worker Registered"); });
}
	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>
