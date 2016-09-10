<%@ include file="headerfile.jsp"%>
<title>TryKaro Store</title>
</head>
<script type="text/javascript">
$(function () 
{     $.ajax({
		type:"GET",
		url:"getPopularProduct",
        success: function(result){
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
 
var itemDetail = window.localStorage.getItem("productInformation");

var retrievedObject = localStorage.getItem('productInformation');

console.log('retrievedObject: ', JSON.parse(retrievedObject));
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

		<!-- BREAKCRUMB -->
		<section class="breakcrumb bg-grey">
			<div class="container listtext">
				<h3 class="pull-left">Your Wishlist</h3>
				<ul class="nav-breakcrumb  pull-right">
					<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
					<li><a href="store">Store</a></li>
					<li><a href="wishlist">My Wishlist</a></li>
				</ul>

			</div>
		</section>
		<!-- END BREAKCRUMB -->
		
	<!-- SHOP CART -->
		<section class="shop-cart">
			<div class="container">
             <!-- TABLE CART -->
				<div class="table-cn ">
					<table class="table table-cart listtext">
						<thead>
							<tr>
								<th>Items</th>
								
								<th>Trial Price</th>
								<th>Original Price</th>
								<th>Delete</th>
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
								
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="res/img/icon-delete.png" alt=""></a>
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
								
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-sub text-center">
									£250.49
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="res/img/icon-delete.png" alt=""></a>
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
								
								<td class="td-sub text-center">
									£220.50
								</td>
								<td class="td-sub text-center">
									£220.50
								</td>
								<td class="td-remove text-center">
									<a href="#"><img src="res/img/icon-delete.png" alt=""></a>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr class="tr-f">
								<td class="td-item">
									
								</td>
								<td></td>
								<td class="td-sub text-center">
									Rs557.98
								</td>
								<td class="td-sub text-center">
									Rs557.98
								</td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- END TABLE CART -->
				
				<!-- CART BUTTON -->
				<div class="shop-button clearfix listtext" style="background-color:white;">
					<a href="#" class="btn btn-13 pull-left">Update Wishlist</a>
					<a href="#" class="btn btn-13 pull-right">Process to Checkout</a>
				</div>
				<!-- END CART BUTTON -->
			</div>
		</section>
		<!-- END SHOP CART -->		

	

		

		<!-- FOOTER -->
		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->

		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->

	</div>
</body>
</html>