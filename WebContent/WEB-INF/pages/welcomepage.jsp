<%@ include file="headerfile.jsp"%>
<title>Trykaro.Try Before Buy</title>
</head>
<body>
	<div class="popup-wrapper" id="popup"
		style="z-index: 3; overflow: auto;">
		<div class="popup-container">
			<!-- Popup Contents, just modify with your own -->
			<div style="text-align: center;">
				<h3>Exclusive Mobile Phones Available Now</h3>
			</div>
			<br>
			<div>
				<div class="col-sm-6">
					<a
						href="http://www.trykaro.com/electronicsdetail?id=39&#LG Nexus 5X"><img
						src="res/img/product/electronics/nexus5x.jpg" alt="1" height="200"
						width="200"></a>
					<div style="text-align: center;">
						<h4>Book Nexus 5x Now</h4>
					</div>
				</div>


				<div class="col-sm-6">
					<a
						href="http://www.trykaro.com/electronicsdetail?id=35&#Apple iPhone 6s"><img
						alt="1"
						src="res/img/product/electronics/iphone6s_1.jpg
           "
						width="200" height="200"></a>
					<div style="text-align: center;">
						<h4>
							Apple iPhone 6s Now <br> Available
						</h4>
					</div>


				</div>

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>

			</div>
			<div>
				<div class="col-sm-12">
					<div class="store-btn" style="background-color: #d5375f;">


						<a class="first-link" href="login"> REGISTER NOW </a>
					</div>
				</div>
			</div>
			<a class="popup-close" href="#popup">X</a>
		</div>
	</div>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<section class="front index-page">
			<div class="front-container container">
				<div class="content">
					<h1 style="margin-top: -50px;">BUY WITH CONFIDENCE</h1>
					<h1>Experience The Change</h1>
					<br />
					<div class="get-started">

						<div class="start-button">
							<button id="jointrykaro" class="start-button"
								style="border: 0px;">JOIN TRYKARO</button>
						</div>
					</div>
					<div class="down-arrow">
						<a class="page-scroll"> <i class="fa fa-chevron-down"></i>
						</a>
					</div>
				</div>
			</div>
		</section>
		<br /> <br />

		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="benefits-header">NEW ARRIVALS</div>


				<div class="benefits">
					<div class="benefit col-sm-6">
						<a
							href="http://www.trykaro.com/electronicsdetail?id=39&#LG Nexus 5X"><img
							src="res/img/product/electronics/nexus5x.jpg" alt="1"
							height="200" width="200"></a>
						<h4>NEXUS 5X IS NOW AVAILABLE</h4>
					</div>
					<div class="benefit col-sm-6">
						<a
							href="http://www.trykaro.com/electronicsdetail?id=35&#Apple iPhone 6s"><img
							alt="1"
							src="res/img/product/electronics/iphone6s_1.jpg
           "
							width="200" height="200"></a>
						<h4>PRE BOOK TRIAL FOR APPLE IPHONE 6s IS OPEN NOW</h4>
					</div>

				</div>
			</div>
		</section>
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">



				<div class="benefits">

					<div class="benefit col-sm-12">
						<a
							href="http://www.trykaro.com/electronicsdetail?id=36&#Samsung Galaxy Note 5"><img
							alt="1"
							src="res/img/product/electronics/galaxynote5.png
           "
							width="200" height="200"></a>
						<h4>Try Samsung Galaxy Note 5 Now</h4>
					</div>

				</div>
			</div>
		</section>
		<br>
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">



				<div class="benefit col-sm-12">


					<div class="store-btn" style="">


						<a class="first-link" href="store"> Go To Store Now </a>



					</div>
				</div>
			</div>
		</section>

		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="benefits-header">FIND AND TRY PRODUCTS YOU LOVE</div>


				<div class="benefits">
					<div class="benefit col-sm-4">
						<a href="fashionapparel"><img
							src="res/img/product/designer/img-6.jpg"
							style="border-radius: 50%;" alt="1" height="200" width="200"></a>
						<h4>Exclusive Apparels</h4>
					</div>
					<div class="benefit col-sm-4">
						<a href="fragrance"><img alt="1" style="border-radius: 50%;"
							src="res/img/product/fragnance/allgoodscents/urbannights/urbane-nights_main.jpg
           "
							width="200" height="200"></a>
						<h4>Exclusive Fragrances</h4>
					</div>
					<div class="benefit col-sm-4">
						<a href="electronics"><img width="200" height="200" alt="1"
							style="border-radius: 50%;" src="res/img/product/banner.jpg">
						</a>
						<h4>Exclusive Gadgets</h4>
					</div>
				</div>
			</div>
		</section>
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="benefits-header">Trykaro Benefits</div>


				<div class="benefits">
					<div class="benefit col-sm-3">
						<div class="blue-btn">

							<a class="first-link" href=""> 100% Authentic </a> <a href="">
								Get authentic products for trying </a>
						</div>
					</div>
					<div class="benefit col-sm-3">
						<div class="yellow-btn">
							<a class="first-link" href=""> One to One Assistant </a> <a
								href=""> Get personal assistant for buying queries </a>
						</div>
					</div>
					<div class="benefit col-sm-3">
						<div class="red-btn">
							<a class="first-link" href=""> Buy With Confidence </a> <a
								href=""> First try product then decide whether to buy it or
								not </a>
						</div>
					</div>
					<div class="benefit col-sm-3">
						<div class="purple-btn">
							<a class="first-link" href=""> Special Discount </a> <a href="">
								Get special discount on purchase of trial products </a>
						</div>
					</div>
				</div>
			</div>

		</section>

	</div>
	<script>
		if ('serviceWorker' in navigator) {
			navigator.serviceWorker.register('sw.js').then(function() {
				console.log("Service Worker Registered");
			});
		}
	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>