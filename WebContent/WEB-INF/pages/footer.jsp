<footer class="dark">
	<div class="container">
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<h2 class="title-f">Information</h2>
				<ul class="ul-f">
					<li><a href="<%=request.getContextPath()%>/aboutus">About
							Us</a></li>
					<!--<li><a href="#">Delivery Information</a></li>-->
					<li><a href="<%=request.getContextPath()%>/privacypolicy">Privacy
							Policy</a></li>
					<li><a href="http://blog.trykaro.com/">Blog</a></li>
					<li><a href="<%=request.getContextPath()%>/conditions">Terms
							&amp; Conditions</a></li>
					<li><a href="<%=request.getContextPath()%>/returnandrefund">Cancellation
							& Returns</a></li>

				</ul>
			</div>

			<div class="col-xs-6 col-md-3">
				<h2 class="title-f">Customer Care</h2>
				<ul class="ul-f">
					<li><a href="<%=request.getContextPath()%>/contactus">Contact
							Us</a></li>
					<li><a href="<%=request.getContextPath()%>/aboutus#faq">FAQ</a></li>


				</ul>
			</div>

			<div class="col-xs-6 col-md-3">
				<h2 class="title-f">Partners</h2>
				<ul class="ul-f">

					<li><a rel="nofollow" href=""
						target="_blank">XYZ</a></li>

					<li><a rel="nofollow" href=""
						target="_blank">APC</a> <!-- TaazaCoupons Text Link ENDS -->
					</li>
					<li><a rel="nofollow" href=""
						target="_blank">HCF</a></li>
					<li><a rel="nofollow" href=""
						target="_blank">KKK</a></li>

				</ul>
			</div>


			<div class="col-xs-6 col-md-3">
				<h2 class="title-f">Let's get in touch</h2>
				<p class="footertext">Get all sneak peeks direct to your inbox</p>
				<div class="letter-from" id="subscriber-form">
					<input type="text" name=subscriberemail id=subscriberemail
						onkeypress="checkEnter(event)" placeholder="Enter Email..."
						class="input-text" style="-webkit-text-fill-color: #ecf0f1;">
					<button class="letter-btn" onclick="subscribers()">
						<i class="fa fa-play"></i>
					</button>

				</div>
				<div class="follow-f">
					<h2 class="title-f">Follow us</h2>
					<div class="follow-sc">
						<a href="https://www.facebook.com/TryKaroPhirBuyKaro"
							target="_blank"><i class="fa  fa-facebook footericon"></i></a> <a
							href="https://twitter.com/TryKaro" target="_blank"><i
							class="fa fa-twitter footericon"></i></a> <a
							href="https://plus.google.com/u/0/113296435567587038826"
							target="_blank"><i class="fa fa-google footericon"></i></a> <a
							href="https://www.youtube.com/channel/UCOGackfTLyFlAIJCf1KEwsA"
							target="_blank"><i class="fa fa-youtube-play footericon"></i></a>

					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="footer-b">
		<div class="container">
			<div class="row">
				<p class=footertext>Copyright&copy; 2015 by Will Teach You
					- All Rights Reserved.</p>
				<!--  <div class="col-md-6 col-md-push-6 payment-icon">
					<a href="https://www.facebook.com/TryKaroPhirBuyKaro"><i class="fa  fa-facebook"></i></a> <a href="https://twitter.com/TryKaro"><i
						class="fa fa-twitter"></i></a> <a href="https://plus.google.com/u/0/113296435567587038826"><i class="fa fa-google"></i></a>
					<a href="https://www.youtube.com/channel/UCOGackfTLyFlAIJCf1KEwsA"><i class="fa fa-youtube-play"></i></a>

				</div>-->

				<!--  <div class="col-md-6 col-md-pull-6 copyright">
					<p>
						Copyright&copy; 2015 by <a href="#" title="Trykaro">TryKaro</a> -
						All Rights Reserved.
					</p>
				</div>-->
				<%@ include file="applozic.jsp"%>
			</div>
		</div>
	</div>
</footer>

