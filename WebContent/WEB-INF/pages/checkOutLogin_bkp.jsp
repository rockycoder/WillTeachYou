<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>TryKaro-Login India's First Website To Try Wide Range Of
	Products</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com -Login India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
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
	content="TryKaro.com - Login India's First Website To Try Wide Range Of Products" />
<meta name="twitter:description"
	content="TryKaro.com -Login India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/logo.png" />
</head>
<body>
	<script type="text/javascript">
function openPopUp(message)
{
alert(message);
}
</script>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<section class="login-register">
			<div class="container">
				<div class="row">
					<!-- LOGIN -->
					<div class="col-md-6" style="margin-left: 25%;">
						<div class="heading _two text-left">
							<h2>Please Login First For CheckOut</h2>
						</div>
						<div id="user_login" class="form login ">
							<form method="post" action="checkLoginConfirm"
								onsubmit="return userLogin()">
								<label>Email Address <sup>*</sup></label> <span
									id="loginemailerror" class="errormessage"> </span> <input
									type="text" onkeypress="checkLogin(event)" name="email"
									class="input-text"> <label>Password <sup>*</sup>
								</label> <span id="loginpassworderror" class="errormessage"></span> <input
									type="password" onkeypress="checkLogin(event)" name="password"
									class="input-text">
								<div></div>
								<div class="check-box">
									<input type="checkbox" class="checkbox" id="remenber">
									<label for="remenber">Remember Me</label>
								</div>
								<p>
									<a href="#" class="btn" data-popup-open="popup-1">Forgot
										your Password?</a>
								</p>
								<!-- <button class="btn btn-13 btn-submit text-uppercase"
									onclick="userLogin()">Login</button> -->
								<input class="btn btn-13 btn-submit text-uppercase"
									type="submit" name="login" value="Login"> <span
									id="wrongCredentials" class="errormessage"> <c:out
										value="${message}">${message}</c:out>
								</span>
							</form>
						</div>
					</div>
					<!-- END LOGIN -->
					<!-- REGISTER -->
					<!-- END REGISTER -->
				</div>
			</div>
		</section>
		<!-- END Contact details -->
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