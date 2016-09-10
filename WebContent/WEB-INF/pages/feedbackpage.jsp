
<div class="popup" data-popup="popup-1">
	<div class="modal-dialog">
		<a id="reviewPopupClose" class="popup-close" data-popup-close="popup-1" href="#">x</a>
		<div class="modal-content" id="feedback-model-window">
			<div class="modal-header heading _two text-left" id="feedback-header">
				<h2 class="modal-title modalheader" id="myModalLabel">
					<b>Write a review and let us know what you feel</b>
				</h2>
			</div>
			<div class="modal-body" id="feedback-body">
				<p class="modalcontent">
					<b>Note: All fields are mandatory</b> <sup></sup>
				</p>
				<div class="form login modalform" id="reviewtitle">
					<br> <input title="Review title" name=reviewtitle
						id=reviewtitle type="text" class="input-text" autocomplete="off"
						placeholder="Review Title" /> <input title="Reviewlike"
						name=reviewlike id=reviewlike type="text" class="input-text"
						autocomplete="off" placeholder="What you liked about product?" />
					<input title="Reviewdontlike" name=reviewdontlike id=reviewdontlike
						type="text" class="input-text" autocomplete="off"
						placeholder="What you didn't liked about product?" />
					<textarea name="txtMessage"
						class="form-control noradius widder-input" id=review
						placeholder="Your Review" name=review id=reviewmessage></textarea>
					<h3 class="modalheader">How Much Will You Rate It?</h3>
					<div class="row lead">
						<div id="stars" class="starrr" style="color: #d5375f;"></div>
					</div>
				</div>
				<div id="reviewerror" class="errormessage modalcontent"></div>
			</div>
			<div class="modal-footer" id="feedback-footer">
				<button type="button" id="reviewsubmit"
					class="btn btn-13 btn-submit text-uppercase modalbutton"
					onclick="parent_enable()">Submit Review</button>
			</div>
			<div class="modelLoading" id="forgot-password-loading"
				style="display: none;">
				<img style="padding-left: 36%; position: inherit;"
					src="res/img/gif/recover-password.gif"
					id="recover-password-loading">
			</div>
		</div>

	</div>
</div>