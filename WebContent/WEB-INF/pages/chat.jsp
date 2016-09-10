<!-- modal mck window start -->
<div id="mck-side-panel">
	<div id="mck-sidebox" class="modal mck-sidebox fade">
		<div class="modal-dialog modal-sm right bg-white md-box-s">
			<div class="mck-sidebox-content">
				<div class="modal-header mck-box-top">
					<button type="button" class="box-close close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<button type="button"
						class="mck-minimize-icon box-close close icon">
						<span aria-hidden="true">&minus;</span>
					</button>
					<h4 class="modal-title mck-box-title truncate"
						id="mck-conversation-title">Conversations</h4>
				</div>
<div class="modal-body mck-box-md ">
					<div id="mck-message-cell" class="mck-message-cell">
						<div id="mck-top-btn-panel"
							class="mck-row mck-top-btn-panel n-vis">
							<button type="button" id="mck-show-more"
								class="mck-show-more btn-light btn btn-default move-left"
								title="Show More">
								<span>Show More</span>
							</button>
							<button type="button" id="mck-delete-button"
								class="mck-delete-button btn-light btn btn-default move-right"
								title="Delete">
								<span>Delete</span>
							</button>
</div>
						<div class="mck-message-inner"></div>
						<div class="mck-loading">
							<img class="mck-loading-image" src="res/images/loading.gif">
						</div>
						<div id="mck-show-more-icon" class="mck-show-more-icon n-vis">
							<h3>No more messages</h3>
						</div>
</div>
				</div>
				<div class="modal-footer mck-box-ft">
					<div class="modal-form">
<p id="mck-msg-error" class="mck-sidebox-error n-vis"></p>
						<div id="mck-msg-response" class="mck-box-response n-vis">
							<div id="mck-response-text" class="response-text"></div>
</div>
						<form id="mck-msg-form" class="vertical">
							<div class="form-group">
								<label class="sr-only placeholder-text control-label"
									for="mt-ms-to">To:</label> <input class="form-cntrl"
									id="mck-msg-to" name="mt-ms-to" placeholder="To" required>
							</div>
<div class="form-group">
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
													class="box-close close mck-remove-file" data-dismiss="div"
													aria-hidden="true">x</button>
											</span>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group last last-child">
								<button type="submit" id="mck-msg-sbmt"
									class="btn btn-blue move-left" title="Send">
									<span>Send</span>
								</button>

								<label id="mck-file-up"
									class="fileinput-button file-upload move-right"
									title="Attach File">
									<button type="button" class="btn btn-light" title="Attach File">
										<img src="res/images/ic_action_attachment.png"
											alt="Attach file" />
									</button> <input type="file" name="files[]">
								</label>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>

	</div>
	<div id="mck-sidebox-launcher" class="mck-sidebox-launcher">
		<a href="#" class="mobicomkit-launcher mck-button-launcher"></a>
		<div id="mck-msg-preview" class="mck-msg-preview mobicomkit-launcher">
			<div class="mck-row">
				<div class="blk-lg-3 mck-preview-icon"></div>

				<div class="blk-lg-9">
					<div class="mck-row truncate">
						<strong class="mck-preview-cont-name"></strong>

					</div>
					<div class="mck-row mck-preview-content"></div>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- modal mck window end Custom CSS and JS link Mobicomkit -->
<!-- start -->
<link href="res/css/mck/jquery.fileupload.css" rel="stylesheet">
<link href="res/css/mck/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="res/css/emojify/emoji-1.0.css" rel="stylesheet">
<link href="res/css/mck/mck-custom.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="res/css/mck/app/mck-sidebox-1.0.css" rel="stylesheet">
<script src="res/js/mck/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="res/js/mck/jquery.tmpl.min.js"></script>
<!-- END -->

<script type="text/javascript" src="res/js/mck/mck-modal.js"></script>
<script type="text/javascript" src="res/js/mck/jquery.linkify.min.js"></script>
<script type="text/javascript" src="res/js/mck/jquery.ui.widget.js"></script>

<script type="text/javascript" src="res/js/mck/jquery.fancybox.js"></script>
<script type="text/javascript"
	src="http://mobi-com.appspot.com/_ah/channel/jsapi"></script>
<script type="text/javascript" src="res/js/emojify/emoji-1.0.js"></script>

<script type="text/javascript" src="res/js/mck/jquery.fileupload.js"></script>
<script type="text/javascript" src="res/js/mck/load-image.js"></script>
<script type="text/javascript" src="res/js/mck/load-image-meta.js"></script>
<script type="text/javascript"
	src="res/js/mck/jquery.fileupload-process.js"></script>
<script type="text/javascript"
	src="res/js/mck/jquery.fileupload-image.js"></script>
<script type="text/javascript"
	src="res/js/mck/jquery.fileupload-validate.js"></script>
<script type="text/javascript" src="res/js/mck/app/mck-sidebox-1.0.js"></script>
<script type="text/javascript">
//var userId="";
			function random() {
				var randomGuest="Guest-";
				var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

				for( var i=0; i < 5; i++ )
					randomGuest += possible.charAt(Math.floor(Math.random() * possible.length));

				return(randomGuest.toString());
			}

 $(document).ready(function () {
                var mobiComKitSideBox = new MobiComKitSidebox();
                mobiComKitSideBox.load();

            });
			
 function readMessage(userId) {
                console.log('random: '+userId);
            }
			
 function displayName(userId) {                 
                 //userId=random();
				 
				 console.log('display name: ' + userId);
                 return ("Guest");
            }
			
 function MobiComKitSidebox() {
				
				
				var mckClientId = random();
				console.log('mckClientId: ' + mckClientId);
                var mckClientAppId = "mobicomkit-sample-app";

                this.load = function () {
                    $.fn.mobicomkit({userId: mckClientId, appId: mckClientAppId, readConversation: readMessage, contactDisplayName: displayName});
                };

            }
            
 function mckLoadScript(url, callback) {
            	var body = document.getElementsByTagName('body')[0];
            	var script = document.createElement('script');
            	script.type = 'text/javascript';
            	script.src = url;
            	if (callback) {
            		script.onreadystatechange = callback;
            		script.onload = callback;
            	}
            	body.appendChild(script);
            }
            mckLoadScript('https://applozic.appspot.com/sidebox.app?appId=applozic-sample-app&userId=devashish&desktopNotification=true&mode=support&supportId=tryit');
        </script>
<!-- end mobicomkit -->
