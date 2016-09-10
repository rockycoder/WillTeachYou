<%@ include file="headerfile.jsp"%>
<title>TryKaro Product</title>
</head>
<script type="text/javascript">
 $(function () 
{   
	var catId=getUrlParameter('category');
	var data={ "categoryId":2,"pageNumber":1};
	 console.log(catId);
	 $.ajax({
		type:"GET",
		url:"getMinimizedProductsList",
		data: data,
        success: function(result)
        {
        	console.log(result);
        	var data=jQuery.parseJSON(result);
          // alert("done");
        	 var theTemplateScript = $("#product-list").html();  
        	   var theTemplate = Handlebars.compile(theTemplateScript);
        	   // Pass our data to the template
        	   var theCompiledHtml = theTemplate(data);

        	   // Add the compiled html to the page
        	   $('.content-placeholder').html(theCompiledHtml);
        }});
  
 });
</script>
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
					<!--  <div class="slide-item ">
						<div class="item-inner">
							<div class="text">
								<!--  <h2>
									<span>TRY LATEST</span> MOBILES <br> AND OTHER GADGETS
								</h2>
								<p>
								<h3>
									Find Exciting Gadgets,Make Comparsions,<br> Get Trail
									Products And Buy From Anywhere.
								</h3>
								</p>

								<div class="group">
									<a href="#" class="btn btn-8">TRY NOW</a>
								</div>-->
							<!--  </div>

							<div class="img bannerimage">
								<img src="res/img/product/fragnance/banner1.jpg" style="width:1200px;" alt="">
							</div>
						</div>

					</div>-->
					<!-- SLIDE ITEM -->
                    <!-- SLIDE ITEM -->
					<div class="slide-item " >
						<div class="item-inner">
							<div class="text text-r" style="
    margin-top: -80px;">
								<h3>
									<span> FRAGRANCE FOR </span> <br>MEN
								</h3>

								<!--  <p>
									Find Latest Services With Best Deals <br /> And Try Them.
								</p>-->

								<div class="group">
									<a href="#" class="btn btn-8">TRY NOW</a>
								</div>
							</div>

							<div class="img img-l bannerimage">
								<img src="res/img/product/fragnance/banner2.jpg" style="width:1200px;"  alt="">
							</div>

						</div>
					</div>
					<!-- SLIDE ITEM -->

				</div>
			</div>
		</section>
		<!-- END SLIDER -->

		<!-- HOME SHIPPING -->
		<section class="shipping-top">
			<div class="container">
				<div class="row">

					<div class="col-xs-4">
						<div class="item">
							<div class="img">
								<img src="res/img/shipping/img-18.jpg" alt="" /> <span
									class="icon"><i class="fa fa-gift"></i></span>
							</div>
							<div class="text">
								<h2>Earn Credit</h2>
								<p>
									Earn Credit<span></span> points on feedbacks
								</p>
							</div>
						</div>
					</div>

					<div class="col-xs-4">
						<div class="item">
							<div class="img">
								<img src="res/img/shipping/img-15.jpg" alt="" /> <span
									class="icon"><i class="fa fa-thumbs-o-up"></i></span>
							</div>
							<div class="text">

								<h2>Special discounts</h2>
								<p>Get discount coupons on trial product purchase</p>
							</div>
						</div>
					</div>

					<div class="col-xs-4">
						<div class="item">
							<div class="img">
								<img src="res/img/shipping/img-12.jpg" alt="" /> <span
									class="icon"><i class="fa fa-truck"></i></span>
							</div>
							<div class="text">

								<h2>Delivery</h2>
								<p>Get free home delivery</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- END HOME SHIPPING -->

		<!-- NEW ARRIVALS -->
		<section class="new-arrivals _1">
			<div class="container">

				<div class="heading _1 text-center">

					<h2 class="text-uppercase listtext">Popular Products</h2>

				</div>

				<div class="new-arrivals-cn _1">
					<div class="row">
					<!--  <div class="col-xs-6 col-sm-4 col-md-3">-->
						<div class="content-placeholder"></div>
						<script id="product-list" type="text/x-handlebars-template">
                        {{#each this }}
						<div class="col-xs-6 col-sm-4 col-md-3 productlisting">
							
							<div class="grid-item _1 ">

								<div class="image">

									<a href="productdetails?id={{productId}}"> <img
										src="res/img/{{images.image1}}" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="productdetails?id={{productId}}"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> {{reviews}}Review(s)

										</div>

									</div>
 {{#if this.tag}}
 <span class="state-box _4">{{tag}}</span>
 {{else}}        
 {{/if}}

								</div>

								<div class="text listtext">

									<h2 class="name">
										<a href="productdetails">{{image}}</a>
									</h2>

									<div class="price-box">

										<div><p class="special-price">
											<span class="price">{{[productName]}}</span></p></div>
<div><p class="special-price"><span class="price">All Good Scents</span></p></div>
<div><p class="special-price"><span class="price"> Rs {{features.Price}}</span></p></div>


										

									</div>

								</div>

							</div>
							
						</div>

						
{{/each}}
</script>


					</div>

				</div>

			</div>
			</div>
		</section>
		<!-- END NEW ARRIVALS -->

		<!-- BANNER -->
		<!--<section class="banner">
			<div class="container">
				<div class="row">

					<div class="col-xs-6 col-md-4">
						<div class="banner-item">
							<a href="#"><img src="res/img/banner/img-7.jpg" alt=""></a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4">
						<div class="banner-item">
							<a href="#"><img src="res/img/banner/img-8.jpg" alt=""></a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4">
						<div class="banner-item">
							<a href="#"><img src="res/img/banner/img-9.jpg" alt=""></a>
						</div>
					</div>

					<div class="col-xs-12 col-md-8">
						<div class="banner-item">
							<a href="#"><img src="res/img/banner/img-10.jpg" alt=""></a>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- BANNER -->

		<!-- TOP PRODUCT -->
		<section class="product-featured _1">
			<div class="container">
				<div class="heading-tabs _1  text-center">
					<ul>
						<li class="active"><a href="#hot-deals" data-toggle="tab">Most
								Viewed</a></li>
						<li><a href="#featured" data-toggle="tab">Featured</a></li>
						<li><a href="#best-sellers" data-toggle="tab">Most Tried</a></li>
					</ul>
				</div>

				<div class="tab-content">

					<div class="tab-pane fade active in hot-deals" id="hot-deals">
						<div class="featured-slide _1"
							data-custom="0-1,480-2,768-3,992-4,1200-5">
							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-1.jpeg" style="width:120px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">New</span>

									<div class="count-date _1" data-end="2015/05/04 12:4:00"></div>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Samsung Galaxy E7</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 15,000</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-2.jpeg" style="width:150px;height:200px;"alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Samsung Galaxy Note 3</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 35,000</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-3.jpeg" style="width:120px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<div class="count-date _1" data-end="2015/09/08 4:40:00"></div>


								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">LG G4</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 34,800</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-4.jpeg" style="width:120px;height:200px;"alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">New</span>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Nokia Lumia 535</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 21,000</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-5.jfif" style="width:120px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<div class="count-date _1" data-end="2015/06/08 7:20:00"></div>


								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">HTC M9 One Plus</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 35,000</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-1.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">ZOEVA Complete Set</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 12,915</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-2.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">KOH GEN DO</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 5,325</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->
						</div>
					</div>

					<div class="tab-pane fade featured" id="featured">
						<div class="featured-slide _1"
							data-custom="0-1-1,480-2,768-3,992-4,1200-5">
							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-1.jpg" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">Hot Cake</span>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Bungalow 8</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 9,800</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->
							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-5.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">New</span>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">MIRENESSE</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 8,125</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-3.jpg" style="width:150px;height:200px;"alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">MIRENESSE AIR BRUSH</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 6,780</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-2.jpg"  alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Chhavvi Aggarwal</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 21,900</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->
							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-4.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">SIGMA BEAUTY</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 5,612</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-3.jpg"  alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Pernia Qureshi</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 7,800</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-4.jpg"  alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Abraham & Thakore
</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 7,230</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->
						</div>
					</div>

					<div class="tab-pane fade best-sellers" id="best-sellers">
						<div class="featured-slide _1"
							data-custom="0-1-2,480-2,768-3,992-4,1200-5">
							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-1.jpg" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">Hot Cake</span>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Bungalow 8</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 9,800</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

						<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-1.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">ZOEVA Complete Set</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 12,915</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->


							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-6.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">AMERICAN CREW</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 2,650</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

								<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/designer/img-4.jpg"  alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Abraham & Thakore
</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 7,230</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/mobiles/img-1.jpeg" style="width:120px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>

									<span class="state-box _4">New</span>

									<div class="count-date _1" data-end="2015/05/04 12:4:00"></div>

								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Samsung Galaxy E7</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 15,000</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->
							<!-- GRID ITEM -->
								<!-- GRID ITEM -->
							<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/beauty/img-4.jpg" style="width:150px;height:200px;" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">SIGMA BEAUTY</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">Rs 5,612</span>
										</p>

									</div>

								</div>

							</div>
							<!-- END GRID ITEM -->

							<!-- GRID ITEM -->
						<!--  	<div class="grid-item _1 ">

								<div class="image">

									<a href="product-detail-1.html"> <img
										src="res/img/product/clothing/img-29.jpg" alt="">
									</a>

									<div class="action">

										<div class="group">

											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart-o"></i></a> <a href="#"><i
												class="fa fa-refresh"></i></a> <a href="product-detail-1.html"><i
												class="fa fa-eye"></i></a>
										</div>

										<div class="rating">

											<span class="star"> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star-half"></i>
											</span> 3 Review(s)

										</div>

									</div>
								</div>

								<div class="text">

									<h2 class="name">
										<a href="product-detail-1.html">Obey Obey Star' 96 Tee</a>
									</h2>

									<div class="price-box">

										<p class="special-price">
											<span class="price">£236.99</span>
										</p>

									</div>

								</div>

							</div>-->
							<!-- END GRID ITEM -->
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- END TOP PRODUCT -->
		

	
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