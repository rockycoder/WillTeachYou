<%@ include file="headerfile.jsp"%>
<title>Trykaro.Wishlist plus</title>
</head>
<body>
	<div class="page-wrapper">
		<%@ include file="navigation.jsp"%>
		<div class="wrap-page">
			<%@ include file="storenavbar.jsp"%>
			<section class="login-register ">
				<div class="container" id="downcontactus">
					<div class="row">
						<!-- Wishlist Plus Form -->
						<div class="col-md-6">
							<div class="heading _two text-left">
								<h2 style="color:#d5375f" >Make A Wish</h2>
							</div>
							<div id="make_wish" class="form login ">
							<label>Where did you find the product ? <sup>*</sup></label> 
							<span id="product_find" class="errormessage"></span> 
							<input type="text" name="productfind" class="input-text"> 
							<label>Give us product url/product details.<sup>*</sup> </label> 
							<span id="product_url" class="errormessage"></span> 
							<input type="text" name="producturl" class="input-text"> 
							<label>Are you looking to buy this product soon ?<sup>*</sup></label>
							<span id="product_buy" class="errormessage"></span>
							<input type="text" name="productbuy" class="input-text"> 
								<br />
								<button class="btn btn-13 btn-submit text-uppercase"
									id="makewishform" onclick="makeWish()">MAKE A WISH</button>
							</div>
						</div>
						<!-- Wishlist plus Form End -->
						<div class="col-md-6">
						<br/><br/>
						<div>
                        <h3 style="color: #d5375f">Not Found On Trykaro Store?</h3>
                        <p> 
 You can add items from any website to your Trykaro Wishlist Plus bag with just a few clicks,we will try to 
 get the products on store for trials for you.
                       </p>
                        </div>
                        <div>
                        <img src="res/img/makewish.jpg" alt="" />
                        </div>
                       </div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>