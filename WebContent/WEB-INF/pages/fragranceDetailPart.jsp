<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="breakcrumb bg-grey listtext">
	<div class="container">

		<h3 class="pull-left">
			<span> ${fragranceDetail.brandName}
				${fragranceDetail.productName} ${fragranceDetail.classification}</span>
		</h3>
		<ul class="nav-breakcrumb  pull-right">
			<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
			<li><a href="store">Store</a></li>
			<li><span>{{fragranceDetail.productName}}</span></li>
		</ul>

	</div>
</section>
<!-- END BREAKCRUMB -->
<!-- PRODUCT DETAIL -->
<section class="product-detail _1 ">
	<div class="container">

		<div class="row">

			<div class="col-l text-center">

				<div class="product-image">

					<div class="image-block">

						<a id="view_full_size" class="fancybox" href="res/img/{fragranceDetail.Image1}">
							<img src="${fragranceDetail.Image1}" alt="" /> <span class="view-link"></span>
						</a>

					</div>

					<div class="view-block">

						<ul class="thumb_list">

							<li data-src="${fragranceDetail.Image1}"><img
								src="res/img/product/fragnance/allgoodscents/tender/tender_thumbnail.jpg"
								alt="" /></li>

							<li class="active" data-src="res/img/{fragranceDetail.Image2}"><img
								src="res/img/product/fragnance/allgoodscents/tender/tender-box_thumbnail.jpg"
								alt="" /></li>

							<li data-src="res/img/{{Image3}}"><img
								src="res/img/product/fragnance/allgoodscents/tender/tender-with-box_thumbnail.jpg"
								alt="" /></li>

							<li data-src="images/product/detail/img-1.jpg"><img
								src="images/product/detail/thumb1/img-4.jpg" alt="" /></li>



						</ul>

					</div>
					<a class="btn" data-popup-open="popup-1" href="#">Open Popup #1</a>
					<div class="share">
						<span>Share:</span> <a target="_blank"
							href="//www.facebook.com/sharer.php?u=http://localhost:8080<%=request.getContextPath()%>/productdetails?id={{Fragrance_Id}}"
							class="_1"><i class="fa fa-facebook-square"></i></a> <a
							target="_blank"
							href="//twitter.com/share?url=http://localhost:8080<%=request.getContextPath()%>/productdetails?id={{Fragrance_Id}}"
							class="_2"><i class="fa fa-twitter-square"></i></a>
					</div>
				</div>

			</div>

			<div class="col-r">

				<div class="product-text listtext">

					<h1 class="name">${fragranceDetail.productName}-${fragranceDetail.ProductTagLine}</h1>
					<h4 class="name"></h4>

					<div class="product_review">

						<div class="review_star">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half"></i>
						</div>
						<a class="btn" data-popup-open="popup-1" href="#">Open Popup
							#1</a>
						<ul class="review_text">
							<li><a href="#"><span>(0)</span>Reviews</a></li>
							<li><a href="#">Write a review</a></li>

						</ul>

					</div>

					<span class="product_stock">Available in stock</span> <span
						class="product_sku"> Manufacturer: {{BrandName}}</span>

					<div class="hr _1"></div>

					<div class="price-box">

						<p class="special-price">
							<span class="price">Rs {{Price}} ({{SizeMl}})</span>
						</p>



					</div>

					<div class="short-description">

						<div>TopNote- {{TopNote}}</div>
						<div>HeartNote- {{HeartNote}}</div>
						<div>BaseNote- {{BaseNote}}</div>

					</div>

					<div class="hr _1"></div>



					<div class="add-to-box clearfix">



						<div class="add-to-cart">
							<a href="#" class="btn btn-3 text-uppercase"><i
								class="fa fa-cart-plus"></i> <span>Add To Cart</span></a>
						</div>

						<div class="add-to-user">
							<a href="#" class="btn btn-13"><i class="fa fa-heart-o"></i>
								<span>Add to WishList</span></a> <a href="#" class="btn btn-13"><i
								class="fa fa-refresh"></i> <span>Add to Compare</span></a>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="product-collateral listtext" id="tabs-responsive">
			<ul class="nav-tab">

				<li class="active"><a href="#description"
					aria-controls="description" data-toggle="tab">Details</a></li>

				<li><a href="#information" aria-controls="information"
					data-toggle="tab">Additional Details</a></li>

				<li><a href="#customer" aria-controls="customer"
					data-toggle="tab">User Reviews (0)</a></li>

			</ul>

			<div
				class="tab-content listtext r-tabs-accordion-title r-tabs-state-active">

				<div class="tab-pane r-tabs-panel r-tabs-state-active"
					id="description" style="display: block;">

					<div class="text-content">
						<div>IDEAL FOR {{IdealFor}}</div>
						<div>
							<b>{{ProductName}}-{{ProductTagLine}}</b>
						</div>
						<div>{{ProductDescription}}</div>
						<div>
							<b>{{AdditionalFeatures}}</b>
						</div>
						<div>
							<br /> TopNote- {{TopNote}}
						</div>
						<div>HeartNote- {{HeartNote}}</div>
						<div>BaseNote- {{BaseNote}}</div>
					</div>
				</div>

				<div class="tab-pane" id="information">

					<div class="text-content">

						<div>Classification : {{Classification}}</div>


						<div>Size: {{SizeMl}}</div>


					</div>
				</div>

				<div class="tab-pane" id="customer">

					<div class="text-content">
						<div>No Review, be the first to review</div>
					</div>

				</div>

				<div class="tab-pane" id="shipping">

					<div class="text-content">
						<p>Beautiful green skirt featuring crossed fabric overlays at
							front and back. Zip/hook closure at side, fully lined. By Finders
							Keepers.</p>
						<br>
						<p>* Polyester/Elastane; Lining: Polyester</p>
						<p>* 26"/66 waist</p>
						<p>* 17.5"/44.5cm length</p>
						<p>* Model is wearing size small</p>
						<p>* Measurements taken from size small</p>
						<p>* Dry clean only</p>
						<p>* Imported</p>
						<p>* Can’t live without: Love</p>
						<p>* Tell us a secret: I never go anywhere in public without
							mascara.</p>
					</div>

				</div>

				<div class="tab-pane" id="tags">

					<div class="text-content">
						<p>Lorem ipsum dolor sit amet, an munere tibique consequat
							mel, congue albucius no qui, at everti meliore erroribus sea.
							Vero graeco cotidieque ea duo, in eirmod insolens interpretaris
							nam. Pro at nostrud percipit definitiones, eu tale porro cum. Sea
							ne accusata voluptatibus. Ne cum falli dolor voluptua, duo ei
							sonet choro facilisis, labores officiis torquatos cum ei.</p>

						<br>

						<p>Cum altera mandamus in, mea verear disputationi et. Vel
							regione discere ut, legere expetenda ut eos. In nam nibh invenire
							similique. Atqui mollis ea his, ius graecis accommodare te. No
							eam tota nostrum cotidieque. Est cu nibh clita. Sed an nominavi
							maiestatis, et duo corrumpit constituto, duo id rebum lucilius.
							Te eam iisque deseruisse, ipsum euismod his at. Eu putent habemus
							voluptua sit, sit cu rationibus scripserit, modus voluptaria ex
							per. Aeque dicam consulatu eu his, probatus neglegentur
							disputationi sit et. Ei nec ludus epicuri petentium, vis appetere
							maluisset ad. Et hinc exerci utinam cum. Sonet saperet nominavi
							est at, vel eu sumo tritani. Cum ex minim legere.</p>
						<br>
						<p>Eos cu utroque inermis invenire, eu pri alterum antiopam.
							Nisl erroribus definitiones nec an, ne mutat scripserit est. Eros
							veri ad pri. An soleat maluisset per. Has eu idque similique, et
							blandit scriptorem necessitatibus mea. Vis quaeque ocurreret ea.</p>
					</div>

				</div>

				<div class="tab-pane" id="custum">

					<div class="text-content">
						<p>Beautiful green skirt featuring crossed fabric overlays at
							front and back. Zip/hook closure at side, fully lined. By Finders
							Keepers.</p>
						<br>
						<p>* Polyester/Elastane; Lining: Polyester</p>
						<p>* 26"/66 waist</p>
						<p>* 17.5"/44.5cm length</p>
						<p>* Model is wearing size small</p>
						<p>* Measurements taken from size small</p>
						<p>* Dry clean only</p>
						<p>* Imported</p>
						<p>* Can’t live without: Love</p>
						<p>* Tell us a secret: I never go anywhere in public without
							mascara.</p>
					</div>

				</div>

			</div>

		</div>

	</div>
</section>