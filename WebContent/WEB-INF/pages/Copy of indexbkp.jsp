<%@ include file="headerfile.jsp"%>
<title>TryKaro-Try Latest Electronics, Beauty Care Products And
	Fashion Apparel</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suites you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
<meta name="keywords"
	content="TryKaro,Try Karo,upcoming mobile phones,try mobiles,try fashion apparels,beauty product samples,fragrances trial,try in india,beauty box,dress bag,gadget box ">
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
<body>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="res/img/banner_2.png"
						alt="TryKaro, New Way To Decide What To Shop" width="100%"
						usemap="#bannersignup">
					<map name="#bannersignup">
						<area shape="rect" coords="100,398,312,461"
							href="<%=request.getContextPath()%>/login"
							alt="Sign Up Now With TryKaro">
					</map>
				</div>
				<div class="item">
					<img src="res/img/apparels_banner.png"
						alt="Try Latest Fashion Apparels With TryKaro" width="100%"
						usemap="#tryapparels">
					<map name="#tryapparels">
						<area shape="rect" coords="509,356,779,410"
							href="<%=request.getContextPath()%>/fashionapparel"
							alt="Try Latest Apparels">
					</map>
				</div>
				<div class="item">
					<img src="res/img/mobile_banner.png" width="100%"
						alt="Try Latest Mobile Phones">
				</div>
				<div class="item">
					<img src="res/img/fragrance_banner.png"
						alt="Try Fragrances Of Best Brands" width="100%"
						usemap="#tryfragrances">
					<map name="#tryfragrances">
						<area shape="rect" coords="594,368,749,436"
							href="<%=request.getContextPath()%>/fragrance"
							alt="Fragrance Trial">
					</map>
				</div>
			</div>
			<!-- Left and right controls -->
		</div>
		<br /> <br />
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="benefits-header" style="color: #d5375f;">
					BUY <strong>WHAT SUITES YOU</strong>
				</div>
				<div style="width: 55%; margin-left: 21%; font-style: italic;">
					Get A Special Customized Box Of Beauty Care Samples That Suites
					Your Skin Type, Dresses That Suites Occasions And Electronic
					Gadgets That Matches Your Lifestyle.</div>
				<div class="benefits">
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/beautybox"> <img
							src="res/img/customisedbeautybox.jpg" width="100%"
							alt="Try Beauty Box">
						</a>
						<div class="add-to-cart" id="beautybox">
							<a href="<%=request.getContextPath()%>/beautybox"
								class="btn btn-3 text-uppercase" id="beautybox"> <span>Explore
									Our Beauty Box </span>
							</a>
						</div>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/dressbag"> <img
							src="res/img/dressbag.png" width="100%" alt="Try Dress Bag">
						</a>
						<div class="add-to-cart" id="dressbag">
							<a href="<%=request.getContextPath()%>/dressbag"
								class="btn btn-3 text-uppercase" id="dressbag"> <span>Explore
									Our Dress Bag </span>
							</a>
						</div>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/gadgetbox"> <img
							src="res/img/gadgetbox.png" width="100%" alt="Try Gadget Box"></a>
						<div class="add-to-cart" id="gadgetbox">
							<a href="<%=request.getContextPath()%>/gadgetbox"
								class="btn btn-3 text-uppercase" id="gadgetbox"> <span>Explore
									Our Gadget Box </span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br /> <br />
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li><a href="#featured" data-toggle="tab"
							style="cursor: context-menu; color: black;">TOP FEATURED
								PRODUCTS</a></li>
					</ul>
				</div>
				<%-- <div class="benefits">
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/electronicsdetail?id=36&# Samsung-Galaxy-Note-5"><img src="res/img/galaxynote5_.jpg"
							width="100%" alt="Try Samsung Galaxy "></a>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/electronicsdetail?id=39#LG-Nexus-5X"><img src="res/img/nexus5x.jpg"
							width="100%" alt="Nexus 5X Available Now"></a>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/electronicsdetail?id=35#Apple-iPhone-6s"><img src="res/img/iphone6s.png"
							width="100%" alt="Iphone6s Try Now"></a>
					</div>
				</div>
				<div class="benefits">
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/fragrance?brand=#All-Good-Scents"><img src="res/img/all-good-scents-banner.png"
							width="100%" alt="Latest All Good Scents Perfumes"></a>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/electronicsdetail?id=48#OnePlus-X"><img src="res/img/oneplus_x_banner.jpg"
							width="100%" alt="OnePlus X Try Now"></a>
					</div>
					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/electronicsdetail?id=50#Sony-Xperia-Z5-Premium"><img src="res/img/xperiaz5.png"
							width="100%" alt="Sony Xperia Z5 Premium Trial Available Now"></a>
					</div>
				</div>
				<div class="benefits">
					<div class="benefit col-sm-4" style="
    margin-left: 33.34%;">
						<a href="<%=request.getContextPath()%>/sensegizDetail#Sense-Giz-Find"><img src="res/img/sensegiz-find.png"
							width="100%" alt="Sensegiz find"></a>
					</div>
				</div> --%>
				<div class="benefits">

					<div class="benefit col-sm-4">
						<a
							href="<%=request.getContextPath()%>/fragrance?brand=#All-Good-Scents"><img
							src="res/img/all-good-scents-banner.png" width="100%"
							alt="Latest All Good Scents Perfumes"></a>
					</div>
					<div class="benefit col-sm-4">
						<a
							href="<%=request.getContextPath()%>/fragrance?brand=Oriflame#ORIFLAME-COSMETICS"><img
							src="res/img/homepage/oriflamehome.jpg" width="100%"
							alt="ORIFLAME COSMETICS FOR TRIAL"></a>
					</div>
					<div class="benefit col-sm-4">
						<a
							href="<%=request.getContextPath()%>/fashionapparel?brand=MANGO#MANGO"><img
							src="res/img/homepage/mango.jpg" width="100%" alt="MANGO DRESSES"></a>
					</div>

				</div>
				<div class="benefits">
					<div class="benefit col-sm-4">
						<a
							href="<%=request.getContextPath()%>/electronicsdetail?id=50#Sony-Xperia-Z5-Premium"><img
							src="res/img/xperiaz5.png" width="100%"
							alt="Sony Xperia Z5 Premium Trial Available Now"></a>
					</div>


					<div class="benefit col-sm-4">
						<a
							href="<%=request.getContextPath()%>/electronicsdetail?id=48#OnePlus-X"><img
							src="res/img/oneplus_x_banner.jpg" width="100%"
							alt="OnePlus X Try Now"></a>
					</div>

					<div class="benefit col-sm-4">


						<a
							href="<%=request.getContextPath()%>/sensegizDetail#Sense-Giz-Find"><img
							src="res/img/sensegiz-find.png" width="100%" alt="Sensegiz find"></a>
					</div>
				</div>
				<div class="benefits">
					<%-- 	<div class="benefit col-sm-4" style="margin-left: 33.34%;">
						<a
							href="<%=request.getContextPath()%>/electronicsdetail?id=35#Apple-iPhone-6s"><img
							src="res/img/homepage/zaraHome.jpg" width="100%"
							alt="Iphone6s Try Now"></a>
					</div> --%>


					<div class="benefit col-sm-4" style="margin-left: 20.34%;">

						<a
							href="<%=request.getContextPath()%>/fragrance?brand=BVLGARI#BVLGARI-PERFUMES"><img
							src="res/img/homepage/bvlgarihome2.jpg" width="100%"
							alt="BVLGARI PERFUMES"></a>

					</div>

					<div class="benefit col-sm-4">


						<a
							href="<%=request.getContextPath()%>/fashionapparel?brand=ZARA#Zara-apparel"><img
							src="res/img/homepage/zaraHome.jpg" width="100%"
							alt="Zara apparels"></a>
					</div>


				</div>
			</div>
		</section>
		<!-- TOP PRODUCT -->
<%-- 		<section class="product-featured _1 listtext" id="bestseller">
			<div class="container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li><a href="#featured" data-toggle="tab"
							style="cursor: context-menu; color: black;">Best Trial
								Products</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade active in hot-deals" id="hot-deals">
						<div class="featured-slide _1"
							data-custom="0-1,480-2,768-3,992-4,1200-5">
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights">
										<img
										src="res/img/product/fragnance/allgoodscents/urbannights/urbane-nights_listing.jpg"
										style="width: 200px; height: 200px;"
										alt="All Good Scents Urbane Nights">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights"><i
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
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights">Urbane
											Nights</a>
									</h2>
									<div class="price-box"></div>
								</div>
							</div>
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;# EMBROIDDED-PINK-ANARKALI">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1612.jpg?v=1443646149"
										style="width: 120px; height: 200px;"
										alt="KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;#KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
									<!--  <span class="state-box _4">New</span>-->
								</div>
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;#KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI">EMBROIDDED
											PINK ANARKALI</a>
									</h2>
									<div class="price-box">
										<p class="special-price"></p>
									</div>
								</div>
							</div>
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;# Apple-iPhone-6s">
										<img
										src="res/img/product/electronics/apple/iphone6s/appleiphone6s_main.jpg"
										style="width: 120px; height: 200px;"
										alt="Apple Apple-iPhone-6s">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;#Apple Apple-iPhone-6s"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
									<!--  <span class="state-box _4">New</span>-->
								</div>
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;#Apple Apple-iPhone-6s">Apple
											iPhone 6s</a>
									</h2>
									<div class="price-box">
										<p class="special-price"></p>
									</div>
								</div>
							</div>
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise">
										<img
										src="res/img/product/fragnance/allgoodscents/arise/arise_4_listing.jpg"
										style="width: 120px; height: 200px;"
										alt="All Good Scents Arise">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise"><i
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
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise">Arise</a>
									</h2>
									<div class="price-box"></div>
								</div>
							</div>
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;# Sony-Xperia-Z5-Premium">
										<img
										src="res/img/product/electronics/sony/sonyxperiaz5/image1.jpg"
										style="width: 120px; height: 200px;"
										alt="Sony Sony-Xperia-Z5-Premium">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;#Sony Sony-Xperia-Z5-Premium"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
									<!--  <span class="state-box _4">New</span>-->
								</div>
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;#Sony Sony-Xperia-Z5-Premium">Sony
											Xperia Z5 Premium</a>
									</h2>
									<div class="price-box">
										<p class="special-price"></p>
									</div>
								</div>
							</div>
							<div class="grid-item _1 ">
								<div class="image">
									<a
										href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
										<img
										src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1569.jpg?v=1443646054"
										style="width: 120px; height: 200px;"
										alt="AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA">
									</a>
									<div class="action">
										<div class="group">
											<a
												href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;#AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA"><i
												class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
									<!--  <span class="state-box _4">New</span>-->
								</div>
								<div class="text">
									<h2 class="name">
										<a
											href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;#AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA">ZARDOZI
											EMBROIDERED LEHENGA</a>
									</h2>
									<div class="price-box">
										<p class="special-price"></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section> --%>
		<br> <br>
		<section class="benefits-wrapper scrolldown"
			style="background: #c9e6e6;">
			<div class="benefits-container container">
				<div class="benefits">
					<div style="color: #0093a4;">
						<h3>
							<strong>People Are Talking About Us</strong>
						</h3>
					</div>
					<br />
					<div id="myCarousel" class="carousel slide" data-ride="carousel"
						style="background: #c9e6e6;">
						<!-- Indicators -->
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div id="testimony1" style="">
									<p
										style="font-size: 15px; font-weight: 800; font-family: serif;">"Great
										idea to try out first before buy, waiting for new products."</p>
									<p
										style="font-size: 15px; font-weight: 800; font-family: serif;">-
										Ashish Dhole</p>
								</div>
							</div>
							<div class="item">
								<div id="testimony1">
									<p
										style="font-size: 15px; font-weight: 800; font-family: serif;">
										"Awesome,I liked the perfume box which you sent to me."</p>
									<p
										style="font-size: 15px; font-weight: 800; font-family: serif;">-
										Suhani Khare</p>
								</div>
							</div>
						</div>
						<!-- Left and right controls -->
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
