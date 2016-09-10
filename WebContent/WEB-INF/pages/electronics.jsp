<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>TryKaro- Try Latest Electronics,Mobiles,Tablets,Gaming Consoles,Cameras,Wearables and more in India</title>
<meta name="title"
	content="Try Latest Electronics,Mobiles,Tablets,Gaming Consoles,Cameras,Wearables and more in India">
<meta name="description"
	content="Order latest exclusive electronics,mobiles,tablets,cameras,gaming consoles,wearables and more for trial in your home.Buy from anywhere with exclusive offers @TryKaro.com ">
<meta name="keywords"
	content="latest mobiles,best cameras,top tablets,new wearables in india,try cameras in india,try mobiles,try in home,buy from anywhere,electronics trial,Order trial online in india ">
<meta property="og:title"
	content="Try Latest Electronics,Mobiles,Tablets,Gaming Consoles,Cameras,Wearables and more in India" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.trykaro.com" />
<meta property="og:image" content="res/img/product/electronics/banner5.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@TryKaro" />
<meta name="twitter:title"
	content="Try Latest Electronics,Mobiles,Tablets,Gaming Consoles,Cameras,Wearables and more in India" />
<meta name="twitter:description"
	content="Order latest exclusive electronics,mobiles,tablets,cameras,gaming consoles,wearables and more for trial in your home.Buy from anywhere with exclusive offers @TryKaro.com" />
<meta name="robots" content="index, follow">
<meta name="twitter:image" content="res/img/product/electronics/banner5.png" />
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
							<div class="text text-r" style="margin-top: -80px;">
								<div class="group"></div>
							</div>
							<div class="img img-l bannerimage">
								<img src="res/img/product/electronics/banner6.png"
									style="width: 1200px;" alt="Nexus 5X available now">
							</div>
						</div>
					</div>
					<!-- SLIDE ITEM -->
					<!-- SLIDE ITEM -->
<!-- 					<div class="slide-item ">
						<div class="item-inner">
							<div class="text text-r" style="margin-top: -80px;">
								<div class="group"></div>
							</div>
							<div class="img img-l bannerimage">
								<img src="res/img/product/electronics/banner5.png"
									style="width: 1200px;" alt="Apple iPhone 6S & 6S Plus">
							</div>
						</div>
					</div> -->
					<!-- SLIDE ITEM -->
				</div>
			</div>
		</section>
		<!-- END SLIDER -->
		<!-- NEW ARRIVALS -->
		<section class="new-arrivals _1">
			<div class="container">
				<div class="heading _1 text-center">
					<h2 class="text-uppercase listtext">Popular Mobiles</h2>
				</div>
				<div class="new-arrivals-cn _1">
					<div class="row">
						<!--  <div class="col-xs-6 col-sm-4 col-md-3">-->
						<div class="content-placeholder"></div>
						<c:forEach var="product" items="${productList}">
							<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
								<div class="grid-item _1 ">
									<div class="image">
										<a
											href="<%=request.getContextPath()%>/electronicsdetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
											<img src="${product.images['image1']}"
											style="height: 200px; width: 125px;"
											alt="${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
										</a>
										<div class="action">
											<div class="group">
												<a id="detailView" name="${product.productId}"
													href="<%=request.getContextPath()%>/electronicsdetail?id=${product.productId}#${product.productName}">
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
													style="text-decoration: none; color: black;"
													name="${product.productId}"
													href="<%=request.getContextPath()%>/electronicsdetail?id=${product.productId}#${product.productName}">
													<p class="special-price">
														<span class="price">${product.productName}</span>
													</p>
												</a>
											</div>
											<div>
												<a id="detailView"
													style="text-decoration: none; color: black;"
													name="${product.productId}"
													href="<%=request.getContextPath()%>/electronicsdetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
												</a>
											</div>
											<div>
												<a id="detailView"
													style="text-decoration: none; color: black;"
													name="${product.productId}"
													href="<%=request.getContextPath()%>/electronicsdetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
													<p class="special-price">
														<span class="price"><i class="fa fa-inr"></i>${product.features["Trial Price"]}
															(Trial Price)</span>
													</p>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- END NEW ARRIVALS -->
		<!-- TOP PRODUCT -->
		<section class="product-featured _1 listtext">
			<div class="container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li><a href="#featured" data-toggle="tab">Featured Products</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade active in hot-deals" id="hot-deals">
						<div class="featured-slide _1"
							data-custom="0-1,480-2,768-3,992-4,1200-5">
							<div class="grid-item _1 ">
								<div class="image">
									<a href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights">
										<img src="res/img/product/fragnance/allgoodscents/urbannights/urbane-nights_listing.jpg" style="width: 200px; height: 200px;" alt="All Good Scents Urbane Nights">
									</a>
									<div class="action">
										<div class="group">
											<a href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights"><i class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text">
									<h2 class="name">
										<a href="<%=request.getContextPath()%>/fragranceDetails?id=14&amp;#All Good Scents Urbane Nights">Urbane
											Nights</a>
									</h2>
									<div class="price-box"></div>
								</div>
							</div>
							<div class="grid-item _1 ">
									<div class="image">
										<a href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;# EMBROIDDED-PINK-ANARKALI">
											<img src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1612.jpg?v=1443646149" style="width: 120px; height: 200px;" alt="KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI">
										</a>
										<div class="action">
											<div class="group">
												<a href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;#KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI"><i class="fa fa-eye"></i></a>
											</div>
											<div class="rating">
												<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
												</span> 0 Review(s)
											</div>
										</div>
										<!--  <span class="state-box _4">New</span>-->
									</div>
									<div class="text">
										<h2 class="name">
											<a href="<%=request.getContextPath()%>/apparelsDetails?id=330&amp;#KUDOZ-STUDIO EMBROIDDED-PINK-ANARKALI">EMBROIDDED PINK ANARKALI</a>
										</h2>
										<div class="price-box">
											<p class="special-price"></p>
										</div>
									</div>
								</div>
								<div class="grid-item _1 ">
									<div class="image">
										<a href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;# Apple-iPhone-6s">
											<img src="res/img/product/electronics/apple/iphone6s/appleiphone6s_main.jpg" style="width: 120px; height: 200px;" alt="Apple Apple-iPhone-6s">
										</a>
										<div class="action">
											<div class="group">
												<a href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;#Apple Apple-iPhone-6s"><i class="fa fa-eye"></i></a>
											</div>
											<div class="rating">
												<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
												</span> 0 Review(s)
											</div>
										</div>
										<!--  <span class="state-box _4">New</span>-->
									</div>
									<div class="text">
										<h2 class="name">
											<a href="<%=request.getContextPath()%>/electronicsdetail?id=35&amp;#Apple Apple-iPhone-6s">Apple iPhone 6s</a>
										</h2>
										<div class="price-box">
											<p class="special-price"></p>
										</div>
									</div>
								</div>
								<div class="grid-item _1 ">
								<div class="image">
									<a href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise">
										<img src="res/img/product/fragnance/allgoodscents/arise/arise_4_listing.jpg" style="width: 120px; height: 200px;" alt="All Good Scents Arise">
									</a>
									<div class="action">
										<div class="group">
											<a href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise"><i class="fa fa-eye"></i></a>
										</div>
										<div class="rating">
											<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
											</span> 0 Review(s)
										</div>
									</div>
								</div>
								<div class="text">
									<h2 class="name">
										<a href="<%=request.getContextPath()%>/fragranceDetails?id=15&amp;#All Good Scents Arise">Arise</a>
									</h2>
									<div class="price-box"></div>
								</div>
							</div>
							<div class="grid-item _1 ">
									<div class="image">
										<a href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;# Sony-Xperia-Z5-Premium">
											<img src="res/img/product/electronics/sony/sonyxperiaz5/image1.jpg" style="width: 120px; height: 200px;" alt="Sony Sony-Xperia-Z5-Premium">
										</a>
										<div class="action">
											<div class="group">
												<a href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;#Sony Sony-Xperia-Z5-Premium"><i class="fa fa-eye"></i></a>
											</div>
											<div class="rating">
												<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
												</span> 0 Review(s)
											</div>
										</div>
										<!--  <span class="state-box _4">New</span>-->
									</div>
									<div class="text">
										<h2 class="name">
											<a href="<%=request.getContextPath()%>/electronicsdetail?id=50&amp;#Sony Sony-Xperia-Z5-Premium">Sony Xperia Z5 Premium</a>
										</h2>
										<div class="price-box">
											<p class="special-price"></p>
										</div>
									</div>
								</div>
							<div class="grid-item _1 ">
									<div class="image">
										<a href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;# ZARDOZI-EMBROIDERED-LEHENGA">
											<img src="https://cdn.shopify.com/s/files/1/0928/1576/products/SR-1569.jpg?v=1443646054" style="width: 120px; height: 200px;" alt="AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA">
										</a>
										<div class="action">
											<div class="group">
												<a href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;#AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA"><i class="fa fa-eye"></i></a>
											</div>
											<div class="rating">
												<span class="star"> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
												</span> 0 Review(s)
											</div>
										</div>
										<!--  <span class="state-box _4">New</span>-->
									</div>
									<div class="text">
										<h2 class="name">
											<a href="<%=request.getContextPath()%>/apparelsDetails?id=333&amp;#AMEENA'S-ATTIRE ZARDOZI-EMBROIDERED-LEHENGA">ZARDOZI EMBROIDERED LEHENGA</a>
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
		</section>
		<!-- PARTNER -->
		<%@ include file="partner.jsp"%>
		<!-- END PARTNER -->
		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>