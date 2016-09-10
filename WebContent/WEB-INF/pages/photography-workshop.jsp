<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>TryKaro-Join India's First Website To Try Wide Range Of
	Products</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com -Join India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
<meta name="keywords"
	content="TryKaro,Try Karo,try mobiles,try fashion apparels,beauty product samples,fragrances trial,try in india,beauty box,dress bag,gadget box ">
<meta property="og:title"
	content="TryKaro.com -Join India's First Website To Try Wide Range Of Products" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="res/img/logo.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="TryKaro.com - Join India's First Website To Try Wide Range Of Products" />
<meta name="twitter:description"
	content="TryKaro.com -Join India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/logo.png" />
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>


		<section class="login-register">
			<div class="container">
				<div class="row">
					<!-- LOGIN -->
					<div class="col-md-6">

						<iframe
							src="https://docs.google.com/forms/d/1XttYI4N-Bzsm4-2Fb_kjPKds7kFwqLr2_9lMjexl_yI/viewform?embedded=true"
							height="500" frameborder="0" marginheight="0" marginwidth="0"
							style="width: 470px; margin-left: -88px; margin-top: 5%;">Loading...</iframe>
					</div>
					<!-- END LOGIN -->
					<!-- REGISTER -->
					<div class="col-md-6">
						<div style="margin-top: 5%;">
							<img src="res/img/photograph.jpg"></img>
						</div>
						<div class="col-md-6">
							<a href="http://www.sonimtech.com/index.php/en" target="_blank"><img
								src="res/img/images.jpg"></img></a>
						</div>
						<div class="col-md-6">
							<a href="http://www.darter.in/" target="_blank"><img
								style="margin-top: 14%;" src="res/img/darter.jpg"></img></a>
						</div>
						<div>
							<a href="http://trykaro.com/" target="_blank"><img
								style="margin-left: 9%; margin-top: -3%;"
								src="res/img/trykaro-image..jpg"></img></a>
						</div>
					</div>
					<!-- END REGISTER -->
				</div>
			<div style="text-align: center;
    font-size: larger;
    font-weight: 700;">
			<b>VENUE:</b> SONIM TECHNOLOGY 43/B, Ground & II Floor, Raman Tower, First Main Road, JP Nagar 3rd Phase, Bengaluru, Karnataka 560078
			<br><b> TIME : </b> Friday, 5th Feb 6:15 PM - 8:30 PM
		
			</div>
			</div>
			
		</section>

	</div>
	<%@ include file="footer.jsp"%>
	<!-- SCROLL TOP -->
	<div id="scroll-top" class="_1">Scroll Top</div>
	<!-- END SCROLL TOP -->
	<!--Model forget password start -->
	<div class="popup" data-popup="popup-1">
		<div class="modal-dialog">
			<a class="popup-close" data-popup-close="popup-1" href="#">x</a>
			<div class="modal-content">
				<div class="modal-header heading _two text-left">
					<h2 class="modal-title modalheader" id="myModalLabel">
						<b>Recover Password</b>
					</h2>
				</div>
				<div class="modal-body">
					<div class="form login modalform" id="reviewtitle">
						<div class="modal-body  ">
							<div></div>
							<p class="modalcontent">Enter the e-mail associated with your
								TryKaro account, then click Send. A link to a page is sent where
								you can easily create a new password.</p>
						</div>
						<div class="form login modalform" id="forgot_email">
							<input title="Enter email id" name=email id=user_email
								type="email" class="input-text " onkeypress="checkForgot(event)"
								autocomplete="off" placeholder="Email Id" />
						</div>
						<div id="forgotpasswordmessage" class="errormessage modalcontent"></div>
					</div>
					<div class="modal-footer">
						<button type="button"
							class="btn btn-13 btn-submit text-uppercase modalbutton"
							onclick=sendForgotPassword()>Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>