<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.app.pojo.Customers"%>
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
						if ($.cookie("chatUser")) {
							userName = $.cookie("chatUser");
							console.log(userName);
						} else {
							console.log(userName);
							userName = makeid();
							$.cookie("chatUser", userName);
						}
						(function(d, m) {
							var s, h;
							s = document.createElement("script");
							s.type = "text/javascript";
							s.async = true;
							s.src = "https://apps.applozic.com/sidebox.app";
							h = document.getElementsByTagName('head')[0];
							h.appendChild(s);
							window.applozic = m;
							m.init = function(t) {
								m._globals = t;
							}
						})(document, window.applozic || {});
						//console.log(userName);
						var mckClientId = userName, mckClientAppId = "trykaro7118dc4e4ba35dbfd91122b35", mckMode = "support", mckSupportId = "trykaro";
						window.applozic.init({
							userId : mckClientId,
							appId : mckClientAppId,
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