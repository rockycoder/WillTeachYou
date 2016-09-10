<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href='http://fonts.googleapis.com/css?family=Orbitron:900'
	rel='stylesheet' type='text/css'>

<div class="header-wrapper">
	<nav class="navbar nav-main">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="logo-header">
					<a href="<%=request.getContextPath()%>/index" class="logotext"
						style="color: white;">Will Teach You</a>
				</div>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">


					<li><a href="<%=request.getContextPath()%>/store">Store</a></li>
					<li><a href="<%=request.getContextPath()%>/howitworks">Beauty
							Care</a></li>
					<li><a href="<%=request.getContextPath()%>/howitworks">Electronics</a></li>

					<%
						String user = null;
						/* if (session.getAttribute("userDetail") != null) {
							user = (String) session.getAttribute("user");
						} */
						String userName = null;
						String sessionID = null;
						Cookie[] cookies = request.getCookies();
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								if (cookie.getName().equals("user"))
									userName = cookie.getValue();
								if (cookie.getName().equals("JSESSIONID"))
									sessionID = cookie.getValue();
							}
						} else if (session.getAttribute("userDetail") != null) {
							sessionID = session.getId();
						}

						pageContext.setAttribute("sessionID", sessionID);
						pageContext.setAttribute("userName", userName);
						pageContext.setAttribute("session", session);
					%>


					<c:choose>
						<c:when
							test="${not empty userDetail && userDetail.customer.customersEmailAddress !=null }">
							<li>
								<div class="navbar-header pull-right">
									<ul class="nav pull-left">
										<li class="dropdown pull-right"><a href="#"
											data-toggle="dropdown" class="dropdown-toggle dropdownicon"><span
												class="glyphicon glyphicon-user"></span><b class="caret"></b></a>
											<ul class="dropdown-menu dropdowncolor">
												<!--  <li><a href="profile" title=" Your Profile">Profile</a></li>-->
												<!--  <li><a href="wishlistplus" title="Add Items To Wishlist From Anywhere">Wishlist Plus</a></li>-->
												<li><a href="<%=request.getContextPath()%>/cart"
													title="Your Trial Bag">My Trial Bag</a></li>


												<c:choose>
													<c:when
														test="${not empty userDetail && userDetail.customer.customersEmailAddress !=null }">
														<li><a id="headerCheckOutWithLogin" href="#"
															title="Checkout And Confirm Order">Checkout</a></li>
													</c:when>
													<c:otherwise>
														<li><a id="headerCheckOut" href="#"
															title="Checkout And Confirm Order">Checkout</a></li>

													</c:otherwise>
												</c:choose>
												<li><a href="<%=request.getContextPath()%>/logout"
													title="Logout" onclick="clearCookies();">Logout </a></li>
											</ul> <input name="hiddenId" type="hidden" id="hiddenUserId"
											value="${userDetail.customer.customersId}" />
									</ul>
								</div>
							</li>
						</c:when>

						<c:otherwise>

							<li><a href="<%=request.getContextPath()%>/login">Sign
									in/Sign up</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>