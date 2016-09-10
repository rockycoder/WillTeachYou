<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.app.pojo.Customers"%>
<div id="mck-side-panel">
	<div id="mck-sidebox" class="mck-sidebox fade">
		<div class="mck-modal-dialog modal-sm right bg-white md-box-s">
			<div id="mck-sidebox-content" class="mck-sidebox-content">
				<div class="mck-box-top">
					<button type="button" class="box-close mck-close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!--  <button type="button" class="mck-minimize-icon box-close mck-close icon"><span aria-hidden="true">&minus;</span></button> -->
					<h4 class="modal-title mck-box-title truncate"
						id="mck-conversation-title">Conversations</h4>
				</div>

				<div class="mck-box-md">

					<div id="mck-message-cell" class="mck-message-cell">
						<div id="mck-top-btn-panel"
							class="mck-row mck-top-btn-panel n-vis">
							<button type="button" id="mck-show-more"
								class="mck-show-more mck-btn-light mck-btn mck-btn-default move-left"
								title="Show More">
								<span>Show More</span>
							</button>
							<button type="button" id="mck-delete-button"
								class="mck-delete-button mck-btn-light mck-btn mck-btn-default move-right"
								title="Delete">
								<span>Delete</span>
							</button>

						</div>
						<div class="mck-message-inner"></div>
						<div id="mck-contact-loading" class="mck-loading">
							<img class="mck-loading-image"
								src="res/advanced/images/loading.gif">
						</div>
						<div id="mck-show-more-icon" class="mck-show-more-icon n-vis">
							<h3>No more messages</h3>
						</div>
					</div>
				</div>
				<div class="mck-box-ft">
					<div class="modal-form n-vis">

						<p id="mck-msg-error" class="mck-sidebox-error n-vis"></p>
						<div id="mck-msg-response" class="mck-box-response n-vis">
							<div id="mck-response-text" class="response-text"></div>

						</div>
						<form id="mck-msg-form" class="vertical">
							<div class="mck-form-group">
								<label class="sr-only placeholder-text control-label"
									for="mck-msg-to">To:</label> <input class="form-cntrl"
									id="mck-msg-to" name="mck-msg-to" placeholder="To" required>
							</div>

							<div class="mck-form-group">
								<label class="sr-only placeholder-text control-label"
									for="mck-textbox">Message</label>
								<div id="mck-textbox-container" class="mck-textbox-container">
									<div id="mck-text-box" contenteditable="true"
										class="mck-text-box text required"></div>
									<div id="mck-file-box" class="mck-file-box row-fluid n-vis">
										<div class="mck-file-expr">
											<span class="mck-file-content blk-lg-8"><span
												class="mck-file-lb"></span>&nbsp;<span class="mck-file-sz"></span></span>
											<span class="progress progress-striped active blk-lg-3"
												role="progressbar" aria-valuemin="0" aria-valuemax="100"
												aria-valuenow="0"><span
												class="progress-bar progress-bar-success bar"></span></span> <span
												class="move-right">
												<button type="button"
													class="box-close mck-close mck-remove-file"
													data-dismiss="div" aria-hidden="true">x</button>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="mck-form-group last last-child">
								<button type="submit" id="mck-msg-sbmt"
									class="mck-btn mck-btn-blue move-left" title="Send">
									<span>Send</span>
								</button>

								<label id="mck-file-up"
									class="fileinput-button file-upload move-right"
									title="Attach File">
									<button type="button" class="mck-btn mck-btn-light"
										title="Attach File">
										<img src="res/advanced/images/ic_action_attachment.png"
											alt="Attach file" />
									</button> <input type="file" name="files[]">
								</label>
							</div>
							<div class="mck-form-group mck-running-on n-vis">
								<a href="http://www.applozic.com" target="_blank">Running on
									<strong>Applozic</strong>
								</a>
							</div>
						</form>
					</div>
					<div class="mck-add-new mck-test-center">
						<button type="submit" id="mck-msg-new"
							class="mck-btn mck-btn-blue" title="new message">
							<span>New Message</span>
						</button>
					</div>
				</div>
			</div>
			<div id="mck-sidebox-search" class="mck-sidebox-content n-vis">
				<div class="mck-box-top">
					<div class="modal-title mck-box-title truncate"
						id="mck-conversation-title">
						<div class="mck-tab-link blk-lg-4">
							<a href="#" role="link" class="mck-conversation-tab-link"><img
								src="res/advanced/images/ic_action_backward.png" alt="Back"></a>
						</div>
						<div class="mck-input-group blk-lg-8">
							<input type="text" id="mck-search" placeholder="Enter user id"
								autofocus /> <span class="mck-search-icon"><a href="#"
								role="link" class="mck-tab-search"><img
									src="res/advanced/images/ic_action_search.png" alt="search"></a></span>
						</div>
					</div>
				</div>
				<div class="mck-box-md">
					<div id="mck-search-cell" class="mck-message-cell">
						<div class="mck-message-inner">
							<ul id="mck-search-list"
								class="mck-search-list mck-contact-list nav nav-tabs nav-stacked"></ul>
							<div id="mck-search-loading" class="mck-loading">
								<img class="mck-loading-image"
									src="res/advanced/images/loading.gif">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="res/advanced/js/minified/applozic-min.js"></script>
<script type="text/javascript"
	src="https://applozic.appspot.com/_ah/channel/jsapi"></script>
<script type="text/javascript" src="res/advanced/emojify/emoji-1.0.js"></script>


<script type="text/javascript">
	if (typeof $original !== 'undefined') {
		$ = $original;
		jQuery = $original;
	} else {
		$ = $applozic;
		jQuery = $applozic;
	}
</script>
<script type="text/javascript">
	function makeid() {
		var text = "";
		var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		for (var i = 0; i < 5; i++)
			text += possible
					.charAt(Math.floor(Math.random() * possible.length));

		return text;
	}
	//var $applozic = jQuery.noConflict(true);
	var userNames = {
		"trykaro" : 'CHAT NOW'
	};
	var contacts = {
		"contacts" : [ {
			"userId" : "trykaro",
			"displayName" : "CHAT NOW",
			"photoLink" : "http://applozic.appspot.com/resources/images/NoPicture.gif"
		} ]
	};
	$(document)
			.ready(
					function() {
						var userName;
						if($.cookie("chatUser"))
							{
							userName=$.cookie("chatUser");
							console.log(userName);
							}
						else{
							console.log(userName);
						userName = makeid();
						$.cookie("chatUser",userName);
						}

						//console.log(userName);
						var mckClientId = userName, mckClientAppId = "trykaro7118dc4e4ba35dbfd91122b35", mckMode = "support", mckSupportId = "trykaro";
						$applozic.fn.applozic({
							userId : mckClientId,
							appId : mckClientAppId,
							ojq : $original,
							readConversation : function(userId) {
								//Todo: write your logic 
								console.log(userId);
							},
							contactDisplayName : function(userId) {
								//Todo: replace this with users display name
								return userNames[userId];
							},
							contactDisplayImage : function(userId) {
								//Todo: replace this with users display image src
								//return "http://applozic.appspot.com/resources/images/NoPicture.gif";
								return "";
							},
							desktopNotification : true,
							mode : 'support',
							supportId : 'trykaro'
						});

						// Load contacts by passing json in format shown in var 'contacts' and uncomment the below function. 
						// $applozic.fn.applozic('loadContacts', contacts);

					});
</script>