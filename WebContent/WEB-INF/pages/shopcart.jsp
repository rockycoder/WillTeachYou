<%@ include file="headerfile.jsp"%>
<title>Shop Cart</title>
</head>
<body>

	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<span class="loading-1"></span>
			<span class="loading-2"></span>
			<span class="loading-3"></span>
		</div>
	</div>
	<!-- END LOADING -->
<%@ include file="navigation.jsp"%>
	<div class="wrap-page">

		<!-- HEADER -->
			<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		
		<!-- BREAKCRUMB -->
		
		<!-- END BREAKCRUMB -->
		
		<!-- SHOP CART -->
		<section class="shop-cart">
			<div class="container">

				<!-- TABLE CART -->
				<div class="table-cn ">
					<table class="table table-cart">
						<thead>
							<tr>
								<th>Items</th>
								<th>Quantity</th>
								<th>Subtotal</th>
								<th>GrandTotal</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-item">
									<div class="img">
										<a href="#">
											<img src="images/cart/img-4.jpg" alt="">
										</a>
									</div>
									<div class="info">
										<a href="#">G.E.T. Anorak Jacket</a>
										<span class="attr">Color : <span>Dark Blue</span></span>
										<span class="attr">Size : <span>XL</span></span>
									</div>
								</td>
								<td class="td-qty text-center">
									<div class="qty">
										<button class="qty-plus">+</button>
										<input type="text" class="input-text" value="01">
										<button class="qty-minus">-</button>
									</div>
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="images/icon-delete.png" alt=""></a>
								</td>
							</tr>
							<tr>
								<td class="td-item">
									<div class="img">
										<a href="#">
											<img src="images/cart/img-5.jpg" alt="">
										</a>
									</div>
									<div class="info">
										<a href="#">G.E.T. Anorak Jacket</a>
										<span class="attr">Color : <span>Dark Blue</span></span>
										<span class="attr">Size : <span>XL</span></span>
									</div>
								</td>
								<td class="td-qty text-center">
									<div class="qty">
										<button class="qty-plus">+</button>
										<input type="text" class="input-text" value="01">
										<button class="qty-minus">-</button>
									</div>
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="images/icon-delete.png" alt=""></a>
								</td>
							</tr>
							<tr>
								<td class="td-item">
									<div class="img">
										<a href="#">
											<img src="images/cart/img-6.jpg" alt="">
										</a>
									</div>
									<div class="info">
										<a href="#">The North Face Adena Shirt</a>
										<span class="attr">Color : <span>Dark Blue</span></span>
										<span class="attr">Size : <span>XL</span></span>
									</div>
								</td>
								<td class="td-qty text-center">
									<div class="qty">
										<button class="qty-plus">+</button>
										<input type="text" class="input-text" value="02">
										<button class="qty-minus">-</button>
									</div>
								</td>
								<td class="td-sub text-center">
									£220.50
								</td>
								<td class="td-sub text-center">
									£220.50
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="images/icon-delete.png" alt=""></a>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr class="tr-f">
								<td class="td-item">
									<p>Shipping: <span>Freeshipping Worldwide</span></p>
								</td>
								<td></td>
								<td class="td-sub text-center">
									£557.98
								</td>
								<td class="td-sub text-center">
									£557.98
								</td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- END TABLE CART -->
				
				<!-- CART BUTTON -->
				<div class="shop-button clearfix">
					<a href="#" class="btn btn-13 pull-left">Update Cart</a>
					<a href="#" class="btn btn-13 pull-right">Process to Checkout</a>
				</div>
				<!-- END CART BUTTON -->
				
				<!-- CART COLLATERALS -->
				<div class="cart-collaterals">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<h2>Have a Gift Card?</h2>
							<input type="text" class="input-text" placeholder="Enter gift code...">
							<button class="btn btn-13">APPLY</button>
						</div>
						<div class="col-sm-6 col-md-4">
							<h2>Got a Coupon?</h2>
							<input type="text" class="input-text" placeholder="Enter coupon code...">
							<button class="btn btn-13">APPLY</button>
						</div>
						<div class="col-sm-12 col-md-4">
							<h2>Esitimate &amp; Tax</h2>

							<label>Country <sup>*</sup></label>
							<select>
								<option>Select Option...</option>
								<option>Afghanistan</option>
								<option>Åland Islands</option>
								<option>Albania</option>
							</select>

							<label>State/ Province<sup>*</sup></label>
							<select>
								<option>Select Option...</option>
								<option>Alabama</option>
								<option>Alaska</option>
								<option>American Samoa</option>
							</select>

							<label>State/ Province</label>
							<input type="text" class="input-text" placeholder="Select Option...">

							<button class="btn btn-13">Get a Qoute</button>

						</div>
					</div>
				</div>
				<!-- END CART COLLATERALS -->

			</div>
		</section>
		<!-- END SHOP CART -->

		<!-- PARTNER -->
		<section class="partner partner-shop">
			<div class="container">

				<div class="heading _1 text-center">
					<h2 class="text-uppercase">Popular Brands</h2>
				</div>

				<div class="partner-cn _1">
					<div  id="partner" data-custom="0-1,480-2,768-3,992-4,1200-5">
						<a href="#">
							<img src="images/partner/img-6.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-7.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-8.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-9.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-10.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-7.jpg" alt="">
						</a>
						<a href="#">
							<img src="images/partner/img-8.jpg" alt="">
						</a>
					</div>
				</div>
			</div>
		</section>
		<!-- END PARTNER -->
		
		<!-- FOOTER -->
		<footer class="dark">
			<div class="container">
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<h2 class="title-f">Information</h2>
						<ul class="ul-f">
							<li><a href="#">About us</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Custom Service</a></li>
							<li><a href="#">Terms &amp; Condition</a></li>
						</ul>
					</div>
					<div class="col-xs-6 col-md-3">
						<h2 class="title-f">Customer Care</h2>
						<ul class="ul-f">
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order Status</a></li>
							<li><a href="#">Become an Affiliate</a></li>
							<li><a href="#">Shipping Rates</a></li>
						</ul>
					</div>
					<div class="col-xs-6 col-md-3">
						<h2 class="title-f">Our Newsletter</h2>
						<div class="letter-from">
							<form action="#">
								<input type="text" placeholder="Enter Email..." class="input-text">
								<button class="letter-btn"><i class="fa fa-play"></i></button>
							</form>
						</div>
						
						<div class="follow-f">
							<h2 class="title-f">Follow us</h2>
							<div class="follow-sc">
								<a href="#"><i class="fa  fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest"></i></a>
								<a href="#"><i class="fa fa-instagram"></i></a>
								<a href="#"><i class="fa fa-youtube-play"></i></a>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<h2 class="title-f">From the Flickr</h2>
						<div class="flickr clearfix">
							<a href="#"><img src="images/flickr/img-1.jpg" alt=""></a>
							<a href="#"><img src="images/flickr/img-2.jpg" alt=""></a>
							<a href="#"><img src="images/flickr/img-3.jpg" alt=""></a>
							<a href="#"><img src="images/flickr/img-4.jpg" alt=""></a>
							<a href="#"><img src="images/flickr/img-5.jpg" alt=""></a>
							<a href="#"><img src="images/flickr/img-6.jpg" alt=""></a>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-b">
				<div class="container">
					<div class="row">
						
						<div class="col-md-6 col-md-push-6 payment-icon">
							<a href="#"><img src="images/payment/icon-5.png" alt=""></a>
							<a href="#"><img src="images/payment/icon-4.png" alt=""></a>
							<a href="#"><img src="images/payment/icon-3.png" alt=""></a>
							<a href="#"><img src="images/payment/icon-2.png" alt=""></a>
							<a href="#"><img src="images/payment/icon-1.png" alt=""></a>
						</div>

						<div class="col-md-6 col-md-pull-6 copyright">
							<p>
								&copy; 2015 HTML5 Template by <a href="http://megadrupal.com/" title="MegaDrupal">MegaDrupal</a> - All Rights Reserved.
							</p>
						</div>

					</div>
				</div>
			</div>
		</footer>
		<!-- END FOOTER -->

		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->

	</div>

	<!-- Library JS -->
	<!-- <script src="js/library/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="js/library/jquery-ui.min.js" type="text/javascript"></script>
	<script src="js/library/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/library/owl.carousel.min.js" type="text/javascript"></script>
	<script src="js/library/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
	<script src="js/library/parallax.min.js" type="text/javascript"></script>
	<script src="js/library/jquery.countdown.min.js" type="text/javascript"></script>
	<script src="js/library/jquery.mb.YTPlayer.js" type="text/javascript"></script>
	<script src="js/library/jquery.responsiveTabs.min.js" type="text/javascript"></script>
	<script src="js/library/jquery.fancybox.js" type="text/javascript"></script>
	<script src="js/library/SmoothScroll.js" type="text/javascript"></script>
	<script src="js/library/isotope.min.js" type="text/javascript"></script>
	<script src="js/library/jquery.colio.min.js" type="text/javascript"></script>

	Main Js
	<script src="js/script.js" type="text/javascript"></script> -->
</body>
</html>