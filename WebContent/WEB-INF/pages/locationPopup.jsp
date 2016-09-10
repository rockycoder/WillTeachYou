<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
	<c:when test="${presence=='first'}">
		<div class="popup-wrapper" id="popup" data-popup="popup-1"
			style="z-index: 24; overflow: auto;">
			<div class="popup-container">
				<!-- Popup Contents, just modify with your own -->
				<div style="text-align: center;">
					<a href="<%=request.getContextPath()%>/index" class="logotext"
						style="color: black; padding-top: 6px; padding-bottom: 6px; margin-left: 17px;"><img
						class="logoimage" src="res/img/logo.png" alt="trykaro logo" /></a> <span
						style="text-align: center; font-size: 30px; padding-left: 25px; color: black; display: block; text-decoration: none !important; font-family: 'Orbitron', sans-serif !important;">
						TryKaro</span> <span
						style="text-align: center; font-size: 21px; padding-left: 25px; color: black; display: block; text-decoration: none !important; font-family: 'Orbitron', sans-serif !important;">Your
						Experience Store </span>

					<h3 style="text-align: center;">Currently Operational In
						Bengaluru Only</h3>
				</div>
				<div style="padding-bottom: 20px; padding-top: 20px;">
					<div class="col-sm-4"></div>
					<div class="col-sm-8"></div>
				</div>
				<div style="text-align: center;">
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<div class="add-to-cart" id="popupButton"
							style="padding-left: 20px;">
							<a data-popup-close="popup-1" href="#"
								class="btn btn-3 text-uppercase"> <i></i> <span
								style="font-size: 20px;">Start Trying</span>
							</a>
						</div>
					</div>
					<div class="col-sm-3">
						<!-- <div class="add-to-cart" id="popupButton"
							style="padding-left: 20px;">
							<a data-popup-close="popup-1" href="#"
								class="btn btn-3 text-uppercase"> <i></i> <span
								style="font-size: 20px;">Skip & Explore</span>
							</a>
						</div> -->
					</div>
					<div class="col-sm-3"></div>
				</div>
				<a class="popup-close" data-popup-close="popup-1" href="#">x</a>
				<!-- <a class="popup-close" href="#popup">X</a> -->
			</div>
		</div>
	</c:when>
	<c:otherwise>

	</c:otherwise>

</c:choose>
