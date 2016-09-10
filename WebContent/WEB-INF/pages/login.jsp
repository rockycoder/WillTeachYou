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
		<section class="login-register">
			<div class="container">
				<div class="row">
					<!-- LOGIN -->
					<div class="col-md-6">
						<div class="heading _two text-left">
							<h2>Registered User</h2>
						</div>
						<div id="user_login" class="form login ">
							<form method="post" action="userSignIn"
								onsubmit="return userLogin()">
								<label>Email Address <sup>*</sup></label> <span
									id="loginemailerror" class="errormessage"> </span> <input
									type="text" onkeypress="checkLogin(event)" name="email"
									class="input-text"> <label>Password <sup>*</sup>
								</label> <span id="loginpassworderror" class="errormessage"></span> <input
									type="password" onkeypress="checkLogin(event)" name="password"
									class="input-text">
								<div></div>
								<!-- 			<div class="check-box">
									<input type="checkbox" class="checkbox" id="remenber">
									<label for="remenber">Remember Me</label>
								</div> -->
								<p>
									<a href="url" class="btn" data-popup-open="popup-1"
										style="text-decoration: underline;">Forgot your Password?</a>
								</p>
								<!-- <button class="btn btn-13 btn-submit text-uppercase"
									onclick="userLogin()">Login</button> -->
								<input class="btn btn-13 btn-submit text-uppercase"
									type="submit" name="login" value="Login" id="user-login">
								<span id="wrongCredentials" class="errormessage"> <c:out
										value="${message}">${message}</c:out>
								</span>
							</form>
							<div class="btn-group">
								<p>You can also login with social networks</p>
								<div class="row">
									<!-- <div class="col-sm-6 col-md-12 col-lg-6">
										<Button class="btn btn-6 text-uppercase"
											onclick=facebookLogIn()>
											<i class="fa fa-facebook"></i> Sign in with Facebook
										</Button>
									</div> -->
									<div class="col-sm-6 col-md-12 col-lg-6"
										style="margin-bottom: 10px">
										<Button class="btn btn-6 text-uppercase googleplus"
											onclick=googleLogIn()>
											<i class="fa  fa-google-plus"></i> Sign in with Google
										</Button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END LOGIN -->
					<!-- REGISTER -->
					<div class="col-md-6">
						<div class="heading _two text-left">
							<h2>Create A New Account</h2>
						</div>
						<form method="post" action="RegisterUser"
							onsubmit="return userRegister()">
							<div id="user_registration" class="form login ">
								<label>Email <sup>*</sup></label> <span id="regemailerror"
									class="errormessage"></span> <input type="text" name="email"
									class="input-text"> <label>Password<sup>*</sup></label>
								<span id="passworderror" class="errormessage"></span> <input
									type="password" name="password" class="input-text"> <label>Re-Password<sup>*</sup></label>
								<input type="password" name="confirm_password"
									class="input-text">
								<!-- <button class="btn btn-13 btn-submit text-uppercase"
								onclick=userRegister()>Register</button> -->
								<input class="btn btn-13 btn-submit text-uppercase"
									type="submit" name="register" value="Register">
							</div>
							<c:if test="${presence=='present'}">
								<div style="color: red;">
									<c:out value="${registermessage}"></c:out>
								</div>
							</c:if>
						</form>
					</div>
					<!-- END REGISTER -->
				</div>
			</div>
		</section>
		<br>
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
						<div class="modal-body" id="forgot-password-desc">
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
					<div class="modal-footer" id="forgot-password-footer">
						<button id="forgotPasswordSubmit" type="button"
							class="btn btn-13 btn-submit text-uppercase modalbutton"
							onclick=sendForgotPassword()>Send</button>
					</div>
					<div class="modelLoading" id="forgot-password-loading"
						style="display: none;">
						<img style="padding-left: 36%; position: inherit;"
							src="res/img/gif/recover-password.gif"
							id="recover-password-loading">
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>