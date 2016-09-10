<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>TryKaro-India's First Website To Try Wide Range Of Products</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com -India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
<meta name="keywords"
	content="TryKaro,Try Karo,try mobiles,try fashion apparels,beauty product samples,fragrances trial,try in india,beauty box,dress bag,gadget box ">
<meta property="og:title"
	content="TryKaro.com -India's First Website To Try Wide Range Of Products" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="res/img/logo.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="TryKaro.com -India's First Website To Try Wide Range Of Products" />
<meta name="twitter:description"
	content="TryKaro.com -India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/logo.png" />
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<section class="login-register">
			<div class="container">
				<div class="row">
					<div class="col-md-4" style="margin-left: 33.33%;">
						<div class="heading _two text-left">
							<h2>Change Password</h2>
						</div>
						<div id="user_login" class="form login ">
							<form method="post" id="PasswordChange" action="saveNewPassword"
								onsubmit="return passwordChange()">
								<input type="hidden" id="guid" name="guid"
									value=<c:out value="${guid}">${guid}</c:out>> <input
									type="hidden" id="userId" name="userId"
									value=<c:out value="${userId}">${userId}</c:out>> <label>New
									Password <sup>*</sup>
								</label> <span id="newpassworderror" class="errormessage"> </span> <input
									id="newPassword" type="password" onkeypress="checkLogin(event)"
									name="password" class="input-text"> <label>Confirm
									Password <sup>*</sup>
								</label> <span id="confirmpassworderror" class="errormessage"></span> <input
									type="password" onkeypress="checkLogin(event)"
									name="confirm_password" id="confirmPassword" class="input-text">
								<div></div>
								<!-- <button class="btn btn-13 btn-submit text-uppercase"
									onclick="userLogin()">Login</button> -->
								<input class="btn btn-13 btn-submit text-uppercase"
									type="submit" name="login" value="Confirm">
							</form>
						</div>
					</div>

				</div>
			</div>
		</section>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>