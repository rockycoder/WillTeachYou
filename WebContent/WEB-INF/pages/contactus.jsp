<%@ include file="headerfile.jsp"%>
<title>TryKaro-India's First Website To Try Wide Range Of
	Products</title>
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
<body class="body-class">
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
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<section class="front contactus body-part">
			<div class="front-container container">
				<div class="content">
					<h1>Contact Us</h1>
					<h1>Let us know what you want</h1>
					<br />
					<div class="get-started"></div>
					<div class="down-arrow">
						<a class="page-scroll"> <i class="fa fa-chevron-down"></i>
						</a>
					</div>
				</div>
			</div>
		</section>
		<div class="wrap-page">
			<section class="login-register scrolldown">
				<div class="container" id="downcontactus">
					<div class="row">
						<!-- Contact -->
						<div class="col-md-6">
							<div class="heading _two text-left">
								<h2>Get in touch</h2>
							</div>
							<div class="form login ">
								<label><b>Address:#126,KHB COLONY 5th BLOCK<br />
										KORAMANGALA,BENGALURU (KA)<br />560034
								</b></label><br /> <label><b>Email:admin@trykaro.in</b></label><br /> <label><b>Mobile:+91-9650439777</b></label><br />
								<div></div>
								<!-- <iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.978702791302!2d77.66325199999999!3d12.844652000000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae135aeb7f340f%3A0x3ad86af40d2ac611!2sInternational+Institute+of+Information+Technology!5e0!3m2!1sen!2sin!4v1439460007000"
									width="500" height="180" frameborder="0" style="border: 0"
									allowfullscreen></iframe> -->
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d243.03659532384077!2d77.61645753359339!3d12.934339545365708!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae14502a57ce59%3A0xa39bac30f94984d!2sIncubex+KRM!5e0!3m2!1sen!2sin!4v1449989593345"
									width="500" height="450" frameborder="0" style="border: 0"
									allowfullscreen></iframe>
							</div>
						</div>
						<!-- END Contact -->
						<!-- Contact Form-->
						<div class="col-md-6">
							<div class="heading _two text-left">
								<h2>Contact Us</h2>
							</div>
							<div id="contactus_form" class="form login ">
								<label>Name <sup>*</sup></label> <span id="usernameerror"
									class="errormessage"></span> <input type="text"
									onkeypress="checkContact(event)" name="name" class="input-text">
								<label>Email <sup>*</sup></label> <span id="emailerror"
									class="errormessage"></span> <input type="text" name="email"
									onkeypress="checkContact(event)" class="input-text"> <label>Message<sup>*</sup></label>
								<span id="messageerror" class="errormessage"></span>
								<textarea name="txtMessage"
									class="form-control noradius widder-input"
									onkeypress="checkContact(event)" id=user_feedback name=message></textarea>
								<br />
								<button class="btn btn-13 btn-submit text-uppercase"
									onclick="contactUs()">SUBMIT</button>
							</div>
						</div>
						<!-- END Contact-->
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>