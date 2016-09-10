<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>TryKaro-Try Latest Electronics, Beauty Care Products And
	Fashion Apparel</title>
<meta name="title"
	content="Try Latest Mobile, Cameras, Gaming Console, Fashion Apparels &amp; Beauty Products @ Trykaro.com">
<meta name="description"
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suits you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available">
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
	content="TryKaro.com - India's first website to try wide range of products including Electronics, Clothes And Beauty Care Products.Try personalized samples which suits you plus get ideas and inspiration to do experiment in your daily routine. Cash on delivery and Subscription also available." />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/logo.png" />

</head>
<body class="body-class">
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
					<img src="res/img/banner-cosmetics.png"
						alt="TryKaro, New Way To Decide What To Shop"
						usemap="#bannersignup"
						style="width: 100em; margin-left: auto; margin-right: auto;">
					<map name="#bannersignup">
						<area shape="rect" coords="100,398,312,461"
							href="<%=request.getContextPath()%>/beautycare"
							alt="Try Beauty Care products ">
					</map>
				</div>
				<div class="item">
					<img src="res/img/banner-gadgets-bkp.jpg"
						alt="TryKaro, New Way To Decide What To Shop" usemap="#gadgetLink"
						style="width: 100em; margin-left: auto; margin-right: auto;">
					<map name="#gadgetLink">
						<area shape="rect" coords="231,420,488,486"
							href="<%=request.getContextPath()%>/gadgets"
							alt="Try Latest Gadgets with Us  ">
					</map>
				</div>
				<div class="item">
					<img src="res/img/banner-cosmetics.jpg"
						alt="Try Fragrances Of Best Brands" usemap="#trycosmetics"
						style="width: 100em; margin-left: auto; margin-right: auto;">
					<map name="#trycosmetics">
						<area shape="rect" coords="889,315,1096,372"
							href="<%=request.getContextPath()%>/beautycare"
							alt="Fragrance Trial">
					</map>
				</div>
				<div class="item">
					<img src="res/img/frg-banner.png"
						alt="Try Finest Perfumes with us"
						style="width: 100em; margin-left: auto; margin-right: auto;"
						usemap="#tryfragrances">
					<map name="#tryfragrances">
						<area shape="rect" coords="881,297,1023,344"
							href="<%=request.getContextPath()%>/fragrance"
							alt="Try Fragrance with us">
					</map>
				</div>





			</div>
			<!-- Left and right controls -->
		</div>
		<!-- 		<div class="benefits-container container" style="padding-top: 10px;">
			<div class="heading-tabs _1  text-center">
				<ul>
					<li><a href="#featured" data-toggle="tab"
						style="cursor: context-menu; color: black;">How It Works</a></li>
				</ul>
			</div>
		</div> -->
		<section class="brand-features  ">
			<div class="brand-container container">
				<br />
				<div>
					<div class="col-sm-3">
						<div class="icon">
							<img src="res/img/join-trykaro.png"
								alt="join tyrkaro.com and try wide range of products"></img>
						</div>
						<h4 class="aboutustext4">
							<b>Join Us And Find Products You Love</b>
						</h4>
					</div>
					<div class="col-sm-3">
						<div class="icon">
							<img src="res/img/order-to-try.png" alt="order products to try"></img>
						</div>
						<h4 class="aboutustext2">
							<b>Order Products You Want To Try </b>
						</h4>
					</div>
					<div class="col-sm-3">
						<div class="icon">
							<img src="res/img/home-delivery.png"
								alt="home delivery for products"></img>
						</div>
						<h4 class="aboutustext3">
							<b>Get Trial Products </b>
						</h4>
					</div>
					<div>
						<div class="col-sm-3">
							<div class="icon">
								<img src="res/img/shop-from-anywhere.png"
									alt="buy from anywhere with our offers"></img>
							</div>
							<h4 class=" aboutustext1">
								<b>Shop From Anywhere With Our Exclusive Offers</b>
							</h4>
						</div>
					</div>

				</div>



			</div>

		</section>
		<div class="brand-container container">
			<div id="the-sticky-div" class="benefit col-sm-6 sticky"
				style="border-radius: 25px; top: 88%; z-index: 10; width: 100%; padding-top: 10px; padding-left: 44%;">
				<div class="add-to-cart" id="storeFixed">
					<a href="<%=request.getContextPath()%>/howitworks"
						class="btn btn-3 text-uppercase btn-floating btn-large waves-effect waves-light red"
						id="storeIndex" style="border-radius: 22px;"> <span>Discover
							More</span>
					</a>
				</div>
			</div>
		</div>
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li><a href="#featured" data-toggle="tab"
							style="cursor: context-menu; color: black;">TOP FEATURED
								PRODUCTS</a></li>
					</ul>
				</div>

				<div class="benefits">


					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/goProDetail#GoPro-Hero-Adventure-and-sports-Camera"><img
							src="res/img/product/electronics/gopro/home-page.jpg"
							width="100%" alt="GoPro-Hero-Adventure-and-Sports-Camera"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/fragrance?brand=#All-Good-Scents"><img
							src="res/img/all-good-scents-banner.png" width="100%"
							alt="Latest All Good Scents Perfumes"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/oriflame#Try-oriflame-cosmetics"><img
							src="res/img/homepage/oriflamehome.jpg" width="100%"
							alt="ORIFLAME COSMETICS FOR TRIAL"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/electronicsdetail?id=50#Sony-Xperia-Z5-Premium"><img
							src="res/img/xperiaz5.png" width="100%"
							alt="Sony Xperia Z5 Premium Trial Available Now"></a>
					</div>

				</div>
				<div class="benefits">
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/electronicsdetail?id=48#OnePlus-X"><img
							src="res/img/oneplus_x_banner.jpg" width="100%"
							alt="OnePlus X Try Now"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/sensegizDetail#Sense-Giz-Find"><img
							src="res/img/sensegiz-find.png" width="100%" alt="Sensegiz find"></a>
					</div>
					<div class="benefit col-sm-3">
						<a
							href="<%=request.getContextPath()%>/fragrance?brand=BVLGARI#BVLGARI-PERFUMES"><img
							src="res/img/homepage/bvlgarihome2.jpg" width="100%"
							alt="BVLGARI PERFUMES"></a>
					</div>
				</div>
			</div>
		</section>
		<section class="benefits-wrapper scrolldown">
			<div class="benefits-container container">
				<div class="benefits-header"
					style="color: #d5375f; padding-left: 35px;">
					BUY <strong>WHAT SUITS YOU</strong>
				</div>

				<div class="benefits">
					<div
						style="width: 73%; font-style: italic; padding-left: 29%; letter-spacing: 1px;">
						GET A SPECIAL CUSTOMIZED BOX OF BEAUTY CARE SAMPLES THAT SUITS
						YOUR SKIN TYPE, DRESSES THAT SUIT OCCASIONS AND ELECTRONIC GADGETS
						THAT MATCHES YOUR LIFESTYLE.</div>
					<div class="benefit col-sm-6">
						<a href="<%=request.getContextPath()%>/beautybox"> <img
							src="res/img/customisedbeautybox.jpg" width="50%"
							alt="Try Beauty Box">
						</a>
						<div class="add-to-cart" id="beautybox">
							<a href="<%=request.getContextPath()%>/beautybox"
								class="btn btn-3 text-uppercase" id="beautybox"> <span>Explore
									Our Beauty Box </span>
							</a>
						</div>
					</div>
					<%-- 					<div class="benefit col-sm-4">
						<a href="<%=request.getContextPath()%>/dressbag"> <img
							src="res/img/dressbag.png" width="100%" alt="Try Dress Bag">
						</a>
						<div class="add-to-cart" id="dressbag">
							<a href="<%=request.getContextPath()%>/dressbag"
								class="btn btn-3 text-uppercase" id="dressbag"> <span>Explore
									Our Dress Bag </span>
							</a>
						</div>
					</div> --%>
					<div class="benefit col-sm-6">
						<a href="<%=request.getContextPath()%>/gadgetbox"> <img
							src="res/img/product/bag/gadget/traveller-edition-box.png"
							width="50%" alt="Try Gadget Box"></a>
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

		<!-- <section class="benefits-wrapper scrolldown"
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
						Indicators
						Wrapper for slides
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
						Left and right controls
					</div>
				</div>
			</div>

		</section> -->
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
