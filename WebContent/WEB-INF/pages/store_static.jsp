<%@ include file="headerfile.jsp"%>
<title>TryKaro Store -One Place For Finding & Trying Wide Range
	Of Products</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>TryKaro Store -One Place For Finding & Trying Wide Range
	Of Products</title>
<meta name="title"
	content="TryKaro Store-One Place To Find And Try Wide Range Of Products ">
<meta name="description"
	content="Find wide range of products including Electronics, Fashion Apparels and Beauty Care Products. Order trial of products and buy from anywhere with exclusive offers @TryKaro.com">
<meta name="keywords"
	content="TryKaro Store,find mobiles in india,find latest fashion apparels,find beauty product samples in india ,try latest electronic products,try with exclusive offers,product reviews,dress for men and women, men and women perfumes,latest mobiles, latest cameras">
<meta property="og:title"
	content="TryKaro Store-One Place To Find And Try Wide Range Of Products" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com/store" />
<meta property="og:image" content="res/img/slide/banner4.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:tit-le"
	content="TryKaro Store-One Place To Find And Try Wide Range Of Products" />
<meta name="twitter:description"
	content="Find wide range of products including Electronics, Fashion Apparels and Beauty Care Products. Order trial of products and buy from anywhere with exclusive offers @TryKaro.com " />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/slide/banner4.png" />
</head>
<body>
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<span class="loading-1"></span> <span class="loading-2"></span> <span
				class="loading-3"></span>
		</div>
	</div>
	<!-- END LOADING -->
	<%@ include file="navigation.jsp"%>
	<div class="wrap-page">
		<!-- HEADER -->
		<%@ include file="storenavbar.jsp"%>
		<!-- END HEADER -->
		<!-- SLIDER -->
		<section class="slide _1" style="background-color: white;">
			<div class="container">
				<div class="slide-cn _1" id="slide-home">
					<!-- SLIDE ITEM -->
					<div class="slide-item ">
						<div class="item-inner">
							<div class="text text-r">
								<h3 style="font-size: 35px; font-weight: bold;">
									<!-- <span>TRY BEST</span> SERVICES<br> AVAILABLE-->
									Keep Losing Things?
								</h3>
								<br />
								<h4>
									Stick or tie it to anything and trace it <br />via the mobile
									app
								</h4>
								<p>
								<h4 style="font-weight: bold;">TRIAL AVAILABLE NOW</h4>
								</p>
								<div class="group">
									<a
										href="<%=request.getContextPath()%>/sensegizDetail#Sense-Giz-Find"
										class="btn btn-8">TRY NOW </a>
								</div>
							</div>
							<div class="img img-l">
								<img src="res/img/slide/sensegiz-find-banner.png"
									alt="sensegiz find">
							</div>
						</div>
					</div>
					<!-- SLIDE ITEM -->
					<!-- SLIDE ITEM -->
					<div class="slide-item ">
						<div class="item-inner">
							<div class="text">
								<h2>
									TRY FRAGRANCES<br> OF BEST BRANDS
								</h2>
								<p>
								<h3>
									Find Coolest Fragrances <br> Get Trial And Buy From
									Anywhere.
								</h3>
								</p>
								<div class="group">
									<a href="<%=request.getContextPath()%>/beautycare"
										class="btn btn-8">TRY NOW</a>
								</div>
							</div>
							<div class="img">
								<img src="res/img/product/slide/banner12.png"
									alt="Best brand fragrances">
							</div>
						</div>
					</div>
					<!-- SLIDE ITEM -->
					<!-- SLIDE ITEM -->
					<div class="slide-item ">
						<div class="item-inner">
							<div class="text">
								<h2>
									EXCLUSIVE APPARELS <br> FOR WOMEN AND MEN
								</h2>
								<p>
								<h3>
									Notch Up Your Style Quotient<br> Get Trial And Buy From
									Anywhere.
								</h3>
								</p>
								<div class="group">
									<a href="<%=request.getContextPath()%>/fashionapparel"
										class="btn btn-8">TRY NOW</a>
								</div>
							</div>
							<div class="img">
								<img src="res/img/slide/latest-fashion.png"
									alt="Latest fashion for men and women">
							</div>
						</div>
					</div>
					<!-- SLIDE ITEM -->
				</div>
			</div>
		</section>
		<!-- END SLIDER -->
		<!-- NEW ARRIVALS -->
		<section class="new-arrivals _1">
			<div class="container" style="margin-top: -2%;">
				<div class="col-md-3">
					<!-- SIDEBAR CATEGORIES -->
					<aside class="sidebar sidebar-cat _1">
						<h2 class="sidebar-title">
							<b>QUICK LINKS</b>
						</h2>
						<ul class="nav-cat ">
							<li>
								<div>
									<label for="cat-5"><a
										href="https://medium.com/@admin_76514"
										style="text-decoration: none; color: black;">Blogs</a> </label>
								</div>
							</li>
							<!--  <li>
								<div>
									<label for="cat-6">FAQS </label>
								</div>
							</li>-->
							<li>
								<div>
									<label for="cat-7"><a
										href="<%=request.getContextPath()%>/index#bestseller"
										style="text-decoration: none; color: black;">Best Sellers</a></label>
								</div>
							</li>
						</ul>
					</aside>
					<!-- END SIDEBAR CATEGORIES -->
				</div>
				<div class="benefit col-sm-3">
					<a href="<%=request.getContextPath()%>/fashionapparel"><img
						src="res/img/iphone-camera-special edition.jpg" width="250px"
						alt="Special Edition Electronics"></a>
					<div class="add-to-cart" id="specialgadgetbox">
						<a href="<%=request.getContextPath()%>/gadgetbox"
							class="btn btn-3 text-uppercase" id="specialgadgetbox"><span>Exclusive
								Gadget Edition</span></a>
					</div>
				</div>
				<div class="benefit col-sm-3">
					<a href="<%=request.getContextPath()%>/fashionapparel"><img
						src="res/img/special gift set collection.png" width="250px"
						alt="Special gift set"></a>
					<div class="add-to-cart" id="specialgiftset">
						<a href="<%=request.getContextPath()%>/dressbag"
							class="btn btn-3 text-uppercase" id="specialgiftset"><span>Special
								Dress Bag Edition </span></a>
					</div>
				</div>
				<div class="benefit col-sm-3">
					<a href="<%=request.getContextPath()%>/fashionapparel"><img
						src="res/img/special beauty box editiion.jpg" width="250px"
						alt="Special beauty box"></a>
					<div class="add-to-cart" id="limitedexclusivebox">
						<a href="<%=request.getContextPath()%>/beautybox"
							class="btn btn-3 text-uppercase" id="limitedexclusivebox"><span>Special
								Beauty Box Edition</span></a>
					</div>
				</div>
			</div>
		</section>
		<!-- END NEW ARRIVALS -->

		<section class="new-arrivals _1">
			<div class="container">
				<div class="heading _1 text-center">
					<h2 class="text-uppercase">New Arrivals</h2>
				</div>
				<div class="new-arrivals-cn _1">
					<div class="row">

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">


									<a
										href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
										<img
										src="res/img/product/cosmetics/Oriflame/Giordani-Gold-Jewel/Main/Giordani-Gold-Jewel-Dusky-Nude.png"
										alt="Oriflame Giordani-Gold-Jewel-Lipstick"
										style="height: 128px; width: 128px">
									</a>
									<div class="action">
										<div class="group">


											<a id="detailView" name="30"
												href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>


											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
													<span class="price">Giordani Gold Jewel Lipstick</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
													<span class="price">Oriflame</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/beautyCareDetail?id=30#Oriflame Giordani-Gold-Jewel-Lipstick">
													<span class="price"><i class="fa fa-inr"></i> 40.0
														(Trial Price)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">


									<a
										href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
										<img
										src="res/img/product/cosmetics/Oriflame/True-Perfection-Perfecting-Day-Moisturiser/True-Perfection-Perfecting-Day-Moisturiser-Main.png"
										alt="Oriflame True-Perfection-Perfecting-Day-Moisturiser"
										style="height: 128px; width: 128px">
									</a>

									<div class="action">
										<div class="group">


											<a id="detailView" name="35"
												href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
													<span class="price">True Perfection Perfecting Day
														Moisturiser</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
													<span class="price">Oriflame</span>
												</a>
											</p>
										</div>
										<div>


											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/beautyCareDetail?id=35#Oriflame True-Perfection-Perfecting-Day-Moisturiser">
													<span class="price"><i class="fa fa-inr"></i> 25.0
														(Trial Price)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/fragranceDetails?id=52#All-Good-Scents Arise">
										<img
										src="res/img/product/fragnance/allgoodscents/arise/arise_4_listing.jpg"
										alt="All-Good-Scents Arise"
										style="width: 160px; height: 160px">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="52"
												href="/Trymeagain/fragranceDetails?id=52#All-Good-Scents Arise">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="52"
													href="/Trymeagain/fragranceDetails?id=52#All-Good-Scents Arise">
													<span class="price">Arise</span>
												</a>
											</p>
										</div>
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="52"
													href="/Trymeagain/fragranceDetails?id=52#All-Good-Scents Arise">
													<span class="price">All Good Scents</span>
												</a>
											</p>
										</div>
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="52"
													href="/Trymeagain/fragranceDetails?id=52#All-Good-Scents Arise">
													<span class="price"><i class="fa fa-inr"></i> 25.0
														(Trial Price)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/electronicsdetail?id=48#One-Plus OnePlus-X">
										<img
										src="res/img/product/electronics/oneplus/oneplusx/oneplusx_main.jpeg"
										style="height: 200px; width: 125px;" alt="One-Plus OnePlus-X">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="48"
												href="/Trymeagain/electronicsdetail?id=48#OnePlus X"> <i
												class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="48"
												href="/Trymeagain/electronicsdetail?id=48#OnePlus X">
												<p class="special-price">
													<span class="price">OnePlus X</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="48"
												href="/Trymeagain/electronicsdetail?id=48#One-Plus OnePlus-X">
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="48"
												href="/Trymeagain/electronicsdetail?id=48#One-Plus OnePlus-X">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i>150.0
														(Trial Price)</span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/fragranceDetails?id=37#Roberto-Cavalli Serpentine">
										<img
										src="res/img/product/fragnance/Roberto-Cavalli/Serpentine-Roberto-Cavalli-EDT/Serpentine-Roberto-Cavalli-EDT-listing.jpg"
										alt="Roberto-Cavalli Serpentine"
										style="width: 160px; height: 160px">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="37"
												href="/Trymeagain/fragranceDetails?id=37#Roberto-Cavalli Serpentine">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="37"
													href="/Trymeagain/fragranceDetails?id=37#Roberto-Cavalli Serpentine">
													<span class="price">Serpentine</span>
												</a>
											</p>
										</div>
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="37"
													href="/Trymeagain/fragranceDetails?id=37#Roberto-Cavalli Serpentine">
													<span class="price">Roberto Cavalli</span>
												</a>
											</p>
										</div>
										<div>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="37"
													href="/Trymeagain/fragranceDetails?id=37#Roberto-Cavalli Serpentine">
													<span class="price"><i class="fa fa-inr"></i> 140.0
														(Trial Price)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a href="/Trymeagain/fragranceDetails?id=28#Calvin-Klein Eternity-Night"> <img
										src="res/img/product/fragnance/Calvin-Klein/Eternity-Night/Enternity-Night-listing.jpg"
										style="height: 200px; width: 125px;"
										alt="Calvin-Klein
											Eternity-Night"
										data-pin-nopin="true">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="28"
												href="/Trymeagain/fragranceDetails?id=28#Calvin-Klein Eternity-Night"> <i
												class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="28"
												href="/Trymeagain/fragranceDetails?id=28#Calvin-Klein Eternity-Night">
												<p class="special-price">
													<span class="price">Eternity Night</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="28"
												href="/fragranceDetails?id=28&amp;# Eternity-Night"> </a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="28"
												href="/fragranceDetails?id=28&amp;# Eternity-Night">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 140.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1569.jpg?v=1443646054"
										style="height: 200px; width: 125px;"
										alt="AMEENA'S-ATTIRE
											ZARDOZI-EMBROIDERED-LEHENGA">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="333"
												href="/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="333"
												href="/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
												<p class="special-price">
													<span class="price">ZARDOZI EMBROIDERED LEHENGA</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="333"
												href="/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="333"
												href="/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 3199.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a href="/apparelsDetails?id=325&amp;# GOLD-AND-RED-LEHENGA">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1722.jpg?v=1443646128"
										style="height: 200px; width: 125px;"
										alt="AMEENA'S-ATTIRE
											GOLD-AND-RED-LEHENGA">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="325"
												href="/apparelsDetails?id=325&amp;# GOLD-AND-RED-LEHENGA">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="325"
												href="/apparelsDetails?id=325&amp;# GOLD-AND-RED-LEHENGA">
												<p class="special-price">
													<span class="price">GOLD AND RED LEHENGA</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="325"
												href="/apparelsDetails?id=325&amp;# GOLD-AND-RED-LEHENGA">
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="325"
												href="/apparelsDetails?id=325&amp;# GOLD-AND-RED-LEHENGA">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 3070.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-0051.jpg?v=1443646165"
										alt="MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA"
										style="height: 200px; width: 125px;">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="357"
												href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
													<span class="price">CLASSIC BLACK BAND-GALA</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
													<span class="price">MANOVIRAJ KHOSLA</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=357#MANOVIRAJ KHOSLA CLASSIC BLACK BAND-GALA">
													<span class="price"><i class="fa fa-inr"></i> 1499.0
														(Trial Price/ 3 Days)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a href="/electronicsdetail?id=50&amp;# Xperia-Z5-Premium">
										<img
										src="res/img/product/electronics/sony/sonyxperiaz5/image1.jpg"
										style="height: 200px; width: 125px;"
										alt="Sony
											Xperia-Z5-Premium">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="50"
												href="/electronicsdetail?id=50&amp;# Xperia-Z5-Premium">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="50"
												href="/electronicsdetail?id=50&amp;# Xperia-Z5-Premium">
												<p class="special-price">
													<span class="price">Xperia Z5 Premium</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="50"
												href="/electronicsdetail?id=50&amp;# Xperia-Z5-Premium">
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="50"
												href="/electronicsdetail?id=50&amp;# Xperia-Z5-Premium">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 150.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/beautyCareDetail?id=13&amp;# Time-Revolution-night-repair">
										<img
										src="res/img/product/cosmetics/missha/time-revolution-night-repair/missha-time-revolution-night-repair_listing.jpeg"
										style="height: 200px; width: 125px;"
										alt="Missha
											Time-Revolution-night-repair">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="13"
												href="/beautyCareDetail?id=13&amp;# Time-Revolution-night-repair">
												<i class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="13"
												href="/beautyCareDetail?id=13&amp;# Time-Revolution-night-repair">
												<p class="special-price">
													<span class="price">Time Revolution night repair</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="13"
												href="/beautyCareDetail?id=13&amp;# Time-Revolution-night-repair">
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="13"
												href="/beautyCareDetail?id=13&amp;# Time-Revolution-night-repair">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 30.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1459.jpg?v=1443646060"
										alt="ALLEN SOLLY STRIPED SHEATH DRESS"
										style="height: 200px; width: 125px;">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="342"
												href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
													<span class="price">STRIPED SHEATH DRESS</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
													<span class="price">ALLEN SOLLY</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=342#ALLEN SOLLY STRIPED SHEATH DRESS">
													<span class="price"><i class="fa fa-inr"></i> 430.0
														(Trial Price/ 3 Days)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1929.jpg?v=1443646104"
										alt="ZARA PAINTED ENVY JUMPSUIT"
										style="height: 200px; width: 125px;">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="303"
												href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
													<span class="price"> ENVY JUMPSUIT</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
													<span class="price">ZARA</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=303#ZARA PAINTED ENVY JUMPSUIT">
													<span class="price"><i class="fa fa-inr"></i> 399.0
														(Trial Price/ 3 Days)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a href="/fragranceDetails?id=26&amp;# Jasmin-Noir"> <img
										src="res/img/product/fragnance/BVLGARI/BVLGARI-JASMIN-NOIR/BVLGARI-JASMIN-NOIR-listing.jpg"
										style="height: 200px; width: 125px;"
										alt="Bvlgari
											Jasmin-Noir">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="26"
												href="/fragranceDetails?id=26&amp;# Jasmin-Noir"> <i
												class="fa fa-eye"></i>
											</a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="26"
												href="/fragranceDetails?id=26&amp;# Jasmin-Noir">
												<p class="special-price">
													<span class="price">Jasmin Noir</span>
												</p>
											</a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="26"
												href="/fragranceDetails?id=26&amp;# Jasmin-Noir"> </a>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="26"
												href="/fragranceDetails?id=26&amp;# Jasmin-Noir">
												<p class="special-price">
													<span class="price"><i class="fa fa-inr"></i> 140.0
														(Trial Price) </span>
												</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1503.jpg?v=1443646057"
										alt="ARROW TEXTURED SHIFT DRESS"
										style="height: 200px; width: 125px;">
									</a>
									<div class="action">
										<div class="group">
											<a id="detailView" name="338"
												href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text listtext">
									<div class="price-box">
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
													<span class="price">TEXTURED SHIFT DRESS</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
													<span class="price">ARROW</span>
												</a>
											</p>
										</div>
										<div>
											<a id="detailView"
												style="text-decoration: none; color: black;" name="2"
												href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
											</a>
											<p class="special-price">
												<a id="detailView"
													style="text-decoration: none; color: black;" name="2"
													href="/Trymeagain/apparelsDetails?id=338#ARROW TEXTURED SHIFT DRESS">
													<span class="price"><i class="fa fa-inr"></i> 399.0
														(Trial Price/ 3 Days)</span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
		<%@ include file="partner.jsp"%>
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>