/*----------------------------------
# Contact us form 
-----------------------------------*/

jQuery.loadScript = function(url, callback) {
	jQuery.ajax({
		url : url,
		dataType : 'script',
		success : callback,
		async : true
	});
}

$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});

function contactUs() {
	$("#thanks-message").text("");
	var user_name = $("#contactus_form input[name=name]").val();
	var email_feedback = $("#contactus_form input[name=email]").val();
	var user_message = $("#contactus_form textarea[name=txtMessage]").val();
	if (user_name.length < 2) {
		// console.log("bad username");
		$("#contactus_form input[name=name]").val('');
		$("#contactus_form input[name=name]").focus();
		$("#usernameerror").text("[Name must contain atleast two characters]");
		return false;
	} else if (!validateEmail(email_feedback)) {
		$("#usernameerror").text("");
		// console.log("bad email");
		$("#contactus_form input[name=email]").val('');
		$("#contactus_form input[name=email]").focus();
		$("#emailerror").text("[Enter valid email id]");
		return false;
	} else if (user_message.length < 2 || user_message.length > 400) {
		$("#usernameerror").text("");
		$("#emailerror").text("");
		// console.log("bad message");
		$("contactus_form textarea[name=txtMessage]").val('');
		$("contactus_form textarea[name=txtMessage]").focus();
		$("#messageerror")
				.text(
						"[Message must contain atleast two characters and less than 400 characters]");
		return false;
	} else {

		$("#usernameerror").text("");
		$("#emailerror").text("");
		$("#messageerror").text("");

		var dataobj = {
			"name" : user_name,
			"email" : email_feedback,
			"message" : user_message
		};

		// console.log(dataobj);
		$
				.ajax({
					type : "GET",
					url : "feedbackSubmit?Feedback="
							+ escape(JSON.stringify(dataobj)),
					data : dataobj,
					cache : false,
					success : function(result) {
						$("#contactus_form input[name=name]").val('');
						$("#contactus_form input[name=email]").val('');
						$("#contactus_form textarea[name=txtMessage]").val('');
						// console.log(result);
						if (JSON.parse(result).code == "7") {
							$
									.toaster({
										priority : 'success',
										title : '',
										message : 'Thank you!!! We Just Received Your Message,We will get back to you soon'
									});

						} else {
							$
									.toaster({
										priority : 'warning',
										title : '',
										message : 'Sorry!! Our Bad, please fill details again'
									});

						}

					},
					error : function(result) {
						$.toaster({
							priority : 'warning',
							title : '',
							message : 'Oops!!! Something went wrong,try again'
						});
					}
				});
	}
}

function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL
			.split('&'), sParameterName, i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

function notifyOutOfStockProduct() {

	var productId = $("#addinwishlist").attr("name");
	var categoryId = $("#addtocart a").attr("name");

	var notificationDetail = {
		"productId" : productId,
		"categoryId" : categoryId
	};
	$.ajax({
		type : "POST",
		url : "notifyMe",
		data : notificationDetail,
		cache : false,
		success : function(result) {
			if (result == 1) {
			}
		},
		error : function(result) {
		}
	});
}

function checkContact(event) {
	if (event.keyCode === 13) {
		// alert("Enter was pressed was presses");
		contactUs();
	}

}
/*----------------------------------
 # Subscriber Start
 -----------------------------------*/

function subscribers() {

	var subscribersEmail = $("#subscriber-form input[name=subscriberemail]")
			.val();
	// console.log(subscribersEmail);

	if (!validateEmail(subscribersEmail)) {

		$.toaster({
			priority : 'warning',
			title : '',
			message : 'Please enter a valid email id'
		});
		return false;
	}
	$.ajax({
		type : "POST",
		url : "subscriberSubmit?subscribersEmail=" + subscribersEmail,
		data : subscribersEmail,
		cache : true,
		success : function(result) {
			$("#subscriber-form input[name=subscriberemail]").val("");
			if (result == 1) {
				$.toaster({
					priority : 'success',
					title : '',
					message : 'Thank you for subscribing with us'
				});
			} else if (result == -7) {
				$.toaster({
					priority : 'warning',
					title : '',
					message : 'Oops!!! You Entered Wrong Email Address'
				});

			} else if (result == 0) {
				$.toaster({
					priority : 'warning',
					title : '',
					message : 'You are already subscribed with us'
				});
			} else if (result == -1) {
				$.toaster({
					priority : 'error',
					title : '',
					message : 'OOPS SORRY something went wrong'
				});
			}

		},
		error : function(result) {
			$("#subscriber-form input[name=subscriberemail]").val("");
			$.toaster({
				priority : 'warning',
				title : '',
				message : 'Oops!!! Something went wrong,try again'
			});
		}
	});
}
/*----------------------------------
 # Subscriber End
 -----------------------------------*/

/*----------------------------------
 # Apply Coupon starts
 -----------------------------------*/

$(document)
		.ready(
				function() {

					$("#apply-coupon")
							.click(
									function() {
										var couponCode = $("#apply-coupon-text")
												.val().toLowerCase();
										if (couponCode == null
												|| couponCode == undefined
												|| couponCode == '') {
											alert("Enter Coupon Code First");
										} else {
											startLoading();

											$
													.ajax({
														type : "POST",
														url : "applyCouponCode?couponCode="
																+ couponCode,
														data : couponCode,
														cache : false,
														success : function(
																result) {
															var discountResponse;
															if (result != null
																	&& result != undefined
																	&& result != '') {
																if (result == 'checkOutLogin') {
																	window.location = result;
																	stopLoading();
																} else if (result == 'wrong-coupon') {
																	stopLoading();
																	alert("wrong-coupon code");

																} else {
																	discountResponse = JSON
																			.parse(result);
																	persistCouponAppliedValues(discountResponse);
																	$(
																			"#total-amount")
																			.text(
																					discountResponse.beforeDiscountAmount);
																	$(
																			"#discount-amount")
																			.text(
																					discountResponse.discountAmount);

																	if (discountResponse.afterDiscountAmount < 100) {
																		var amount = parseFloat($
																				.trim(discountResponse.afterDiscountAmount))
																				+ parseFloat($
																						.trim(discountResponse.deliveryAmount));
																		$(
																				"#final-amount")
																				.text(
																						amount);
																		$(
																				"#cart-head span")
																				.text(
																						amount);
																	} else {
																		$(
																				"#final-amount")
																				.text(
																						discountResponse.afterDiscountAmount);
																		$(
																				"#cart-head span")
																				.text(
																						discountResponse.afterDiscountAmount);

																	}

																	$(
																			"#delivery-amount")
																			.text(
																					discountResponse.deliveryAmount);
																	stopLoading();
																}

															}
															stopLoading();
														},
														error : function(result) {
															stopLoading();

														}
													});

										}


									});

					$("#removeCoupon").click(
							function() {

								var couponCode = $("#apply-coupon-text").val()
										.toLowerCase();
								if (couponCode != null
										&& couponCode != undefined
										&& couponCode != '') {

									$.ajax({
										type : "POST",
										url : "removeCoupon?couponCode="
												+ couponCode,
										data : couponCode,
										cache : false,
										success : function(result) {

											window.location = "cart";
										},
										error : function(result) {

										}
									});
								}

							});

				});

function startLoading() {
	$("#cart-table-content").css('display', 'none');
	$("#cart-loading").css('display', 'block');
}

function stopLoading() {
	$("#cart-table-content").css('display', 'block');
	$("#cart-loading").css('display', 'none');
}

function persistCouponAppliedValues(discountResponse) {

	try {
		if (typeof $.cookie('couponApplied') === 'undefined') {

		} else {
			$.cookie("couponApplied", null);
			$.removeCookie("couponApplied");
		}
		var couponApplied = $.cookie("couponApplied") || [];
		$.cookie("couponApplied", couponApplied);
		var isCouponApplied;
		if (discountResponse.couponName != null
				&& discountResponse.couponName != undefined
				&& discountResponse.couponName != '') {
			isCouponApplied = "yes";
		} else {
			isCouponApplied = "no";
		}
		var temp = {
			"isCouponApplied" : isCouponApplied,
			"couponName" : discountResponse.couponName,
			"discountedAmount" : discountResponse.afterDiscountAmount,
			"originalAmount" : discountResponse.beforeDiscountAmount,
			"couponAmount" : discountResponse.discountAmount

		};
		couponApplied.push(temp);
		$.cookie("couponApplied", couponApplied);

	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			persistCouponAppliedValues(discountResponse);
		});

	}

}

function removeCoupon() {

	try {
		if (typeof $.cookie('couponApplied') === 'undefined') {

		} else {
			$.cookie("couponApplied", null);
			$.removeCookie("couponApplied");
		}

	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			removeCoupon();
		});

	}

}

/*
 * private double beforeDiscountAmount; private double afterDiscountAmount;
 * private double discountAmount; private double deliveryAmount; private String
 * couponName;
 */

/*----------------------------------
 # Apply Coupon End
 -----------------------------------*/

/*----------------------------------
 # Email Validation
 -----------------------------------*/
function validateEmail(emailText) {
	var pattern = new RegExp(
			/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailText);
}

/*----------------------------------
 # Scroll Down Animation
 -----------------------------------*/
$(document).ready(function() {
	$('.page-scroll').click(function() {
		var scrollTo = $('.scrolldown').offset().top;

		$('html,body').animate({
			scrollTop : scrollTo
		}, 1000);

	});

	$('.navigation ul li').click(function() {

		var currElement = $(this);
		$('.navigation ul li').each(function() {

			$(this).removeClass('current-menu-parent');

		});
		currElement.addClass('current-menu-parent');
	});

});

$(window).load(
		function() {
			// $(".megamenu col-5 menu-parent
			// listtext").attr("style","color:#d5375f !Important;");
			$(".megamenu col-5 menu-parent listtext").addClass(
					"menu-parent current-menu-parent listtext");
			$(".megamenu col-5 menu-parent listtext").removeClass(
					"megamenu col-5 menu-parent listtext");

			// $(".menu-parent current-menu-parent
			// listtext").attr("style","color:#252525 !Important;");
		});

function toolBarColor() {

};

/*
 * $(document).ready(function() { $(window).bind("beforeunload", function() {
 * $.removeCookie('chatUser'); $.removeCookie('basket'); }); });
 */
function checkMinimumBasketTotal(url) {
	try {
		if ($.cookie("basket")) {

			var cookie = $.cookie("basket");

			var total = 0;
			var count = 0;
			cookie.forEach(function(item) {
				if (item != null) {

					total = total + parseFloat($.trim(item.trialPrice));
					count++;
				}
			});

			if (total > 0) {
				window.location = url;
			} else {
				alert("For Check Out minimum amount should be more than 50 RS ")
				window.location = "#";

			}

		} else {
			alert("Please Add Something to the cart before CheckOut ");
			window.location = "#";
		}
	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			checkMinimumBasketTotal(url);
		});

	}

}

$(document).on('click', '#headerCheckOut', function() {
	checkMinimumBasketTotal('checkOutLogin');
});
$(document).on('click', '#headerCheckOutWithLogin', function() {
	checkMinimumBasketTotal('checkout');
});

$(document).on('click', '#checkoutConfirm', function() {
	checkMinimumBasketTotal('checkOutLogin');
});

$(document).on('click', '#checkoutConfirmWithLogin', function() {
	checkMinimumBasketTotal('checkout');
});

function navigateToStore() {
	alert("Thanks For Your Order");
	setTimeout(function() {
		window.location.href = "store";
	}, 10000);

}

$(document).on('click', '.table-cn tr td a', function() {

	startLoading();

	var deleteId = this.id;
	$('table tr#' + deleteId + '').remove();

	var obj = $.cookie("basket");
	itemToDelete = obj[deleteId];
	obj[deleteId] = null;
	$.cookie("basket", obj);
	updateMiniItemBasket();
	deleteFromServer(itemToDelete);
	stopLoading();

});

function deleteFromServer(item) {

	$.ajax({
		type : "POST",
		url : "deleteItem",
		data : item,
		cache : false,
		success : function(result) {
			if (result != null && result != '' && result != 'not-loggedin') {
				discountResponse = JSON.parse(result);
				persistCouponAppliedValues(discountResponse);
				$("#total-amount").text(discountResponse.beforeDiscountAmount);
				$("#discount-amount").text(discountResponse.discountAmount);

				if (discountResponse.afterDiscountAmount < 100) {
					var amount = parseFloat($
							.trim(discountResponse.afterDiscountAmount))
							+ parseFloat($
									.trim(discountResponse.deliveryAmount));
					$("#final-amount").text(amount);

				} else {
					$("#final-amount").text(
							discountResponse.afterDiscountAmount);

				}

				$("#delivery-amount").text(discountResponse.deliveryAmount);
				$("#apply-coupon-text").val(discountResponse.couponName);
			} else {
				$("#total-amount").text(0);
				$("#discount-amount").text(0);
				$("#final-amount").text(0);
				$("#delivery-amount").text(0);
				$("#apply-coupon-text").val(0);
			}
			stopLoading();
			updateMiniItemBasket();
		},
		error : function(result) {
			stopLoading();
		}
	});

}

function findAndRemove(array, property, value) {
	$.each(array, function(index, result) {
		if (result[property] == value) {
			array.splice(index, 1);
		}
	});

}

function checkEnter(event) {
	if (event.keyCode === 13) {
		// alert("Enter was pressed was presses");
		subscribers();
	}

}

/* Start for Wishlist */

function makeWish() {
	var product_find = $("#make_wish input[name=productfind]").val();
	var product_details = $("#make_wish input[name=producturl]").val();
	var product_buy = $("#make_wish input[name=productbuy]").val();
	if (product_find.length < 2) {
		$("#make_wish input[name=productfind]").val("");
		$("#make_wish input[name=productfind]").focus();
		$("#product_find").text("[Enter website name where you found product]");
		return false;
	} else if (product_details.length < 2) {
		$("#product_find").text("");
		$("#make_wish input[name=producturl]").val("");
		$("#make_wish input[name=producturl]").focus();
		$("#product_url").text("[Enter link or description of product]");
		return false;
	} else if (product_buy.length < 2) {
		$("#product_find").text("");
		$("#product_url").text("");
		$("#make_wish input[name=productbuy]").val("");
		$("#make_wish input[name=productbuy]").focus();
		$("#product_buy").text("[Enter yes, no or maybe]");
		return false;
	}
	$("#product_buy").text("");
	$("#make_wish input[name=productfind]").val("");
	$("#make_wish input[name=producturl]").val("");
	$("#make_wish input[name=productbuy]").val("");
	var wishJson = {
		"wishlistItem" : product_find,
		"wishlistItemURL" : product_details,
		"buyingNeed" : product_buy
	};
	$
			.ajax({
				type : "POST",
				url : "makeWish",
				data : wishJson,
				cache : false,
				success : function(result) {
					if (result == 1) {
						$
								.toaster({
									priority : 'success',
									title : '',
									message : 'We have recieved your wish and started working on it. We will let you know soon about it'
								});

					}
				},
				error : function(result) {
					$.toaster({
						priority : 'warning',
						title : '',
						message : 'Oops!!! Something went wrong,try again'
					});
				}
			});
}
/* End for Wishlist */

/* script start for star rating */
var __slice = [].slice;

(function($, window) {
	var Starrr;
	Starrr = (function() {
		Starrr.prototype.defaults = {
			rating : void 0,
			numStars : 5,
			change : function(e, value) {
			}
		};

		function Starrr($el, options) {
			var i, _, _ref, _this = this;

			this.options = $.extend({}, this.defaults, options);
			this.$el = $el;
			_ref = this.defaults;
			for (i in _ref) {
				_ = _ref[i];
				if (this.$el.data(i) != null) {
					this.options[i] = this.$el.data(i);
				}
			}
			this.createStars();
			this.syncRating();
			this.$el.on('mouseover.starrr', 'i', function(e) {
				return _this.syncRating(_this.$el.find('i').index(
						e.currentTarget) + 1);
			});
			this.$el.on('mouseout.starrr', function() {
				return _this.syncRating();
			});
			this.$el.on('click.starrr', 'i', function(e) {
				return _this.setRating(_this.$el.find('i').index(
						e.currentTarget) + 1);
			});
			this.$el.on('starrr:change', this.options.change);
		}

		Starrr.prototype.createStars = function() {
			var _i, _ref, _results;

			_results = [];
			for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref
					: _i >= _ref; 1 <= _ref ? _i++ : _i--) {
				_results.push(this.$el.append("<i class='fa fa-star-o'></i>"));
			}
			return _results;
		};

		Starrr.prototype.setRating = function(rating) {
			if (this.options.rating === rating) {
				rating = void 0;
			}
			this.options.rating = rating;
			this.syncRating();
			return this.$el.trigger('starrr:change', rating);
		};

		Starrr.prototype.syncRating = function(rating) {
			var i, _i, _j, _ref;

			rating || (rating = this.options.rating);
			if (rating) {
				for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref
						: _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
					this.$el.find('i').eq(i).removeClass('fa-star-o').addClass(
							'fa-star');
				}
			}
			if (rating && rating < 5) {
				for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j
						: --_j) {
					this.$el.find('i').eq(i).removeClass('fa-star').addClass(
							'fa-star-o');
				}
			}
			if (!rating) {
				return this.$el.find('i').removeClass('fa-star').addClass(
						'fa-star-o');
			}
		};

		return Starrr;

	})();
	return $.fn.extend({
		starrr : function() {
			var args, option;

			option = arguments[0], args = 2 <= arguments.length ? __slice.call(
					arguments, 1) : [];
			return this.each(function() {
				var data;

				data = $(this).data('star-rating');
				if (!data) {
					$(this).data('star-rating',
							(data = new Starrr($(this), option)));
				}
				if (typeof option === 'string') {
					return data[option].apply(data, args);
				}
			});
		}
	});
})(window.jQuery, window);

$(function() {
	return $(".starrr").starrr();
});

$(document).ready(function() {

	$('#stars').on('starrr:change', function(e, value) {
		$('#count').html(value);
	});

	$('#stars-existing').on('starrr:change', function(e, value) {
		$('#count-existing').html(value);
	});
});

$(document).ready(function() {

	updateMiniItemBasket();

	// alert(itemPrice.totalPrice);
	/*
	 * $(window).bind("beforeunload", function() {
	 * $.removeCookie('basketMiniDetail'); $.removeCookie('itemDetail'); });
	 */
});

/* script Ends for star rating */
function getCookie(name) {
	var re = new RegExp(name + "=([^;]+)");
	var value = re.exec(document.cookie);
	var jsonString = (value != null) ? unescape(value[1]) : null;
	// jsonString.replace('\t','');
	return jsonString;
}
/*--------  wishlist--------------------*/

function clearCookies() {
	$.removeCookie('basket');
}

function addItemToServerCart(itemDetail) {
	$.ajax({
		type : "POST",
		url : "addToBasket",
		data : itemDetail,
		cache : false,
		success : function(result) {
			var basketDetail;
			var basket = $.cookie("basket") || [];
			if (isItemAlreadyPresent(itemDetail) != 'present') {
				basket.push(itemDetail);
				$.cookie("basket", basket);
				var totalCount = parseInt($("#cart-head label").text(), 10);
				totalCount++;
				var totalPrice = parseFloat($("#cart-head span").text(), 10);
				totalPrice += parseFloat($("#price span").text(), 10)
				basketDetail = {
					"totalCount" : totalCount,
					"totalPrice" : totalPrice
				};
				$.toaster({
					priority : 'success',
					title : '',
					message : 'Item is added to the Cart'
				});
			} else {
				$.toaster({
					priority : 'success',
					title : '',
					message : 'Item is already present in the cart'
				});
			}

			$("#cart-head span").text(basketDetail.totalPrice);
			$("#cart-head label").text(basketDetail.totalCount);
			$(".overlay").hide();
			$.unblockUI();
		},
		error : function(result) {
			$(".overlay").hide();
			$.unblockUI();
			return "error";
		}
	});

}

function updateMiniItemBasket() {

	try {

		var tryk = $.cookie("basket");
		var obj;

		if (tryk != undefined && tryk != null && tryk != '') {
			if ($.isArray(tryk)) {
				obj = tryk;
			} else {
				obj = JSON.parse(tryk);
			}
			// console.log(tryk);
			var total = 0;
			var count = 0;
			obj
					.forEach(function(item) {
						if (item != null) {

							var objCoupon = $.cookie("couponApplied");
							var couponCookie;

							if (objCoupon != undefined && objCoupon != null
									&& objCoupon != '') {
								if ($.isArray(objCoupon)) {
									couponCookie = objCoupon;
								} else {
									couponCookie = JSON.parse(objCoupon);
								}
								if (couponCookie[0].isCouponApplied == "yes") {
									total = couponCookie[0].discountedAmount;
								} else {
									total = total
											+ parseFloat($
													.trim(item.trialPrice));
								}

							} else {
								total = total
										+ parseFloat($.trim(item.trialPrice));
							}

							count++;
						}
					});
			if (total < 100 && total > 0) {
				total = total + 30;
			}

			$("#cart-head span").text(total);
			$("#cart-head label").text(count);
		} else if (tryk == null || tryk == '') {
			$("#cart-head span").text(0);
			$("#cart-head label").text(0);
		}

	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			updateMiniItemBasket();
		});

	}

}

function updateCartValues() {

	try {
		var obj;

		var tryk = $.cookie("basket");

		if (tryk != undefined && tryk != null && tryk != '') {
			if ($.isArray(tryk)) {
				obj = tryk;
			} else {
				obj = JSON.parse(tryk);
			}

			// console.log(tryk);
			var total = 0;
			var count = 0;
			obj.forEach(function(item) {
				if (item != null) {

					var couponCookie = $.cookie("couponApplied");
					if (typeof $.cookie('couponApplied') === 'undefined'
							|| couponCookie[0].isCouponApplied == "no") {
						total = total + parseFloat($.trim(item.trialPrice));
					} else {

						if (couponCookie[0].isCouponApplied != "no") {
							total = couponCookie[0].discountedAmount;
						}

					}

					count++;
				}
			});

			if (total < 100 && total > 0) {
				total = total + 30;
			}

			$("#cart-head span").text(total);
			$("#cart-head label").text(count);
		}

		var couponCookie = $.cookie("couponApplied");
		if (couponCookie != undefined && couponCookie != null
				&& couponCookie != ''
				&& couponCookie[0].isCouponApplied == "yes") {

			$("#total-amount").text(couponCookie[0].originalAmount);
			$("#discount-amount").text(couponCookie[0].couponAmount);

			$("#apply-coupon-text").val(couponCookie[0].couponName);

			if (parseFloat($.trim(couponCookie[0].discountedAmount)) < 100) {
				$("#delivery-amount").text(30);
			} else {
				$("#delivery-amount").text(0);
			}

			$("#final-amount").text(
					parseFloat($.trim(couponCookie[0].discountedAmount))
							+ parseFloat($.trim($("#delivery-amount").text())));

		} else {
			var nextTotal = 0;
			var count = 0;
			var finalAmount = 0;
			obj
					.forEach(function(item) {
						if (item != null) {

							nextTotal = nextTotal
									+ parseFloat($.trim(item.trialPrice));

							count++;
						}
					});
			if (nextTotal < 100 && nextTotal > 0) {
				$("#delivery-amount").text(30);
				finalAmount = nextTotal + 30;
			} else {
				finalAmount = total;
			}
			$("#total-amount").text(nextTotal);
			$("#final-amount").text(finalAmount);

		}

	} catch (err) {

		loadScript('res/js/library/jquery-cookie-file.js', function() {
			updateCartValues();
		});
	}

}

function isItemAlreadyPresent(itemDetail) {

	try {
		if (itemDetail != null) {
			var obj = $.cookie("basket");
			var status = 'not-present';
			if (obj != undefined) {
				obj.forEach(function(item) {
					if (item != null && itemDetail != null) {

						if (item.categoryId == itemDetail.categoryId
								&& item.productId == itemDetail.productId) {
							status = 'present';
							return false;

						}
					}
				});
			}
		}

		return status;
	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			isItemAlreadyPresent(itemDetail);
		});

	}

}

function createListOfOrders() {
	var data = jQuery.parseJSON($.cookie('basket'));
	var list = [];
	if (data != null && data != undefined && data != '') {
		jQuery.each(data, function(i, item) {
			if (item != null) {
				var temp = {
					"productId" : item.productId,
					"categoryId" : item.categoryId,
					"color" : item.color,
					"customerid" : item.customerid
				};
				list.push(temp);
			}
		});

	}

	return list;
}

function syncCartWithServer() {
	var list = createListOfOrders();
	$.ajax({
		type : "POST",
		url : "sycCartWithServer",
		data : list,
		cache : false,
		success : function(result) {
			var basket = $.cookie("basket") || [];
			if (result != null && result != undefined) {

				var list = JSON.parse(result);
				list.each(function(id, item) {
					basket.push(createItemDetail(item));
				});

				$.cookie("basket", basket);
				$.toaster({
					priority : 'success',
					title : '',
					message : 'Item Added'
				});

			} else {
				$.toaster({
					priority : 'success',
					title : '',
					message : 'Item is already present'
				});
			}

			updateMiniItemBasket();

		},
		error : function(result) {
			return "error";
		}
	});
}

function createItemDetail(obj) {
	var itemDetail = {
		"customerid" : obj.customerid,
		"productId" : obj.productId,
		"categoryId" : obj.categoryId,
		"productName" : obj.productName,
		"trialPrice" : obj.trialPrice,
		"actualPrice" : obj.actualPrice,
		"imageUrl" : obj.imageUrl,
		"color" : obj.color
	};

	return itemDetail;
}

function addToCart() {

	try {
		$(this).attr("disabled", "disabled");

		var itemDetail = {
			"customerid" : 1,
			"productId" : $("#addtocart a").attr('id'),
			"categoryId" : $("#addtocart a").attr('name'),
			"productName" : $(".container #productName").text(),
			"trialPrice" : $("#price span").text(),
			"actualPrice" : $(".price-box span.pricetext").text(),
			"imageUrl" : $(".view-block ul li").first().attr("data-src"),
			"color" : $(".thumbnail-lipstick li").first().find("img").attr(
					"alt")
		};
		var basket = $.cookie("basket") || [];
		$.cookie("basket", basket);
		removeCoupon();
		try {
			var serverResponse = addItemToServerCart(itemDetail);
		} catch (err) {
			loadScript('res/js/library/jquery-cookie-file.js', function() {
				addItemToServerCart(itemDetail);
			});

		}

	} catch (err) {
		loadScript('res/js/library/jquery-cookie-file.js', function() {
			addToCart();
		});

	}

}

$(document)
		.ready(
				function() {
					try {
						$.cookie.json = true;
					} catch (err) {
						loadScript('res/js/library/jquery-cookie-file.js',
								function() {
									$.cookie.json = true;
								});
					}

					$('#addtocart')
							.click(

									function() {

										try {
											addToCart();

										} catch (err) {
											loadScript(
													'res/js/library/jquery-cookie-file.js',
													function() {
														addToCart();
													});
										}
									});
					/*---- End Add to cart----*/
					$('.trialBag')
							.click(
									function() {
										var id = $(this).attr("id");
										var itemDetail;
										if (id == 'beautyBox1') {
											itemDetail = {
												"customerid" : 1,
												"productId" : 1,
												"categoryId" : 6,
												"productName" : "Beauty Box For Dry Skin",
												"actualPrice" : "N/A",
												"trialPrice" : 430,
												"imageUrl" : "res/img/product/bag/beauty/dry-skin-beauty-collection.png",
												"color" : ""

											};
										} else if (id == 'beautyBox2') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 2,
												"categoryId" : 6,
												"productName" : "Anti Tan Beauty Collection",
												"actualPrice" : "N/A",
												"trialPrice" : 500,
												"imageUrl" : "res/img/product/bag/beauty/anti-tan-beauty-box-vlcc.png",
												"color" : ""

											};
										} else if (id == 'beautyBox3') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 3,
												"categoryId" : 6,
												"productName" : "Party Beauty Collection",
												"actualPrice" : "N/A",
												"trialPrice" : 495,
												"imageUrl" : "res/img/product/bag/beauty/party-girl-beauty-box.png",
												"color" : ""

											};
										} else if (id == 'beautyBox4') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 4,
												"categoryId" : 6,
												"productName" : "Baby Care Collection Set",
												"actualPrice" : "N/A",
												"trialPrice" : 121,
												"imageUrl" : "res/img/product/bag/beauty/gift-set-for-baby-care.png",
												"color" : ""

											};
										} else if (id == 'dressBag1') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 5,
												"categoryId" : 6,
												"productName" : "Wedding Dress Bag Collection",
												"actualPrice" : "N/A",
												"trialPrice" : 3699,
												"imageUrl" : "res/img/product/bag/dress/dress-bag-ethnic-wedding-dress.png",
												"color" : ""

											};
										} else if (id == 'dressBag2') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 6,
												"categoryId" : 6,
												"productName" : "Date Night Dress Bag Collection",
												"actualPrice" : "N/A",
												"trialPrice" : 699,
												"imageUrl" : "res/img/product/bag/dress/date-night-dress-bag.png",
												"color" : ""

											};
										} else if (id == 'gadgetBox1') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 7,
												"categoryId" : 6,
												"productName" : "Music Box Edition",
												"actualPrice" : "N/A",
												"trialPrice" : 249,
												"imageUrl" : "res/img/product/bag/gadget/music-lover-gadget edition.png",
												"color" : ""

											};
										} else if (id == 'gadgetBox2') {

											itemDetail = {
												"customerid" : 1,
												"productId" : 8,
												"categoryId" : 6,
												"productName" : "Traveller Edition",
												"actualPrice" : "N/A",
												"trialPrice" : 249,
												"imageUrl" : "res/img/product/bag/gadget/traveller-edition-box.png",
												"color" : ""

											};
										} else {
											itemDetail = null;
										}

										var basket = $.cookie("basket") || [];
										$.cookie("basket", basket);
										removeCoupon();
										try {
											var serverResponse = addItemToServerCart(itemDetail);
										} catch (err) {
											$
													.loadScript(
															'res/js/library/jquery-cookie-file.js',
															function() {
																addItemToServerCart(itemDetail);
															});

										}

									});
					/*---end trial bag---*/

					$('#addinwishlist')
							.click(
									function() {
										/*
										 * var details={
										 * "productname":$("#product-name").text(),
										 * "productdetail":
										 * $("#description").text(), };
										 */

										var wishJson = {
											"wishlistItem" : "productid="
													+ $("#addinwishlist").attr(
															'name')
													+ "&categoryid="
													+ $("#addinwishlist a")
															.attr('name'),
											"wishlistItemURL" : $(
													"#addinwishlist").attr(
													'name'),
											"buyingNeed" : "Not Decided"
										};
										// console.log(wishJson);
										$
												.ajax({
													type : "POST",
													url : "makeWish",
													data : wishJson,
													cache : false,
													success : function(result) {
														if (result == 1) {
															$
																	.toaster({
																		priority : 'success',
																		title : '',
																		message : 'Your Item Is Added To Wishlist'
																	});

														}
													},
													error : function(result) {
														$
																.toaster({
																	priority : 'warning',
																	title : '',
																	message : 'Oops!!! Something Went Wrong,Try Again'
																});
													}
												});
									});

					$('#notifyOutOfStockProduct')
							.click(

									function() {

										try {
											notifyOutOfStockProduct();

										} catch (err) {
											loadScript(
													'res/js/library/jquery-cookie-file.js',
													function() {
														notifyOutOfStockProduct();
													});
										}
									});

					$('#reviewPopupClose').click(function() {
						$("#reviewerror").text("");
						$("#reviewtitle input[name=review]").val('');
						$("#reviewtitle input[name=reviewdontlike]").val('');
						$("#reviewtitle input[name=reviewlike]").val('');
						$("#reviewtitle input[name=reviewtitle]").val('');
						$("#reviewtitle textarea[name=txtMessage]").val('');
						var selected = $("#reviewtitle .starrr .fa-star")
						for (var i = 0; i < selected.length; i++) {
							$(selected[i]).removeClass('fa-star');
							$(selected[i]).addClass('fa-star-o');
						}
					});

					$('#reviewsubmit')
							.click(
									function() {
										var productId = $("#addinwishlist")
												.attr("name");
										var categoryId = $("#addtocart a")
												.attr("name");
										var review_title = $(
												"#reviewtitle input[name=reviewtitle]")
												.val();
										var review_like = $(
												"#reviewtitle input[name=reviewlike]")
												.val();
										var review_dislike = $(
												"#reviewtitle input[name=reviewdontlike]")
												.val();
										var review_message = $(
												"#reviewtitle textarea[name=txtMessage]")
												.val();
										if (review_title.length < 2
												|| review_title.length > 400) {
											$(
													"#reviewtitle input[name=reviewtitle]")
													.val('');
											$(
													"#reviewtitle input[name=reviewtitle]")
													.focus();
											$("#reviewerror")
													.text(
															" Review Title should contain atleast 2 characters");
											return false;
										} else if (review_like.length < 2
												|| review_like.length > 400) {
											$(
													"#reviewtitle input[name=reviewlike]")
													.val('');
											$(
													"#reviewtitle input[name=reviewlike]")
													.focus();
											$("#reviewerror")
													.text(
															" Tell us what you liked atleast 2 characters");
											return false;
										} else if (review_dislike.length < 2
												|| review_dislike.length > 400) {
											$(
													"#reviewtitle input[name=reviewdontlike]")
													.val('');
											$(
													"#reviewtitle input[name=reviewdontlike]")
													.focus();
											$("#reviewerror")
													.text(
															" Tell us what you didn't liked atleast 2 characters");
											return false;
										} else if (review_message.length < 2
												|| review_message.length > 400) {
											$("#reviewtitle input[name=review]")
													.val('');
											$("#reviewtitle input[name=review]")
													.focus();
											$("#reviewerror")
													.text(
															"Your Review should have atleast 2 characters");
											return false;
										}
										$("#reviewerror").text("");
										var rating = $("#reviewtitle .starrr .fa-star").length;

										var reviewDetail = {

											"title" : review_title,
											"liked" : review_like,
											"disliked" : review_dislike,
											"review" : review_message,
											"productId" : productId,
											"categoryId" : categoryId,
											"reviewsRating" : rating
										};

										$("#feedback-body").css('display',
												'none');
										$("#ffeedback-footer").css('display',
												'none');
										$("#forgot-password-loading").css(
												'display', 'block');

										$
												.ajax({
													type : "POST",
													url : "reviewSubmit",
													data : reviewDetail,
													cache : false,
													success : function(result) {
														if (result == 1) {
															$("#reviewerror")
																	.text(
																			" Thanks For Submitting Your Valuable Feedback");

															$(
																	"#reviewtitle input[name=review]")
																	.val('');
															$(
																	"#reviewtitle input[name=reviewdontlike]")
																	.val('');
															$(
																	"#reviewtitle input[name=reviewlike]")
																	.val('');
															$(
																	"#reviewtitle input[name=reviewtitle]")
																	.val('');

															$(
																	"#reviewtitle textarea[name=txtMessage]")
																	.val('');

															var selected = $("#reviewtitle .starrr .fa-star")
															for (var i = 0; i < selected.length; i++) {
																$(selected[i])
																		.removeClass(
																				'fa-star');
																$(selected[i])
																		.addClass(
																				'fa-star-o');
															}

														}
														$("#feedback-body")
																.css('display',
																		'block');
														$("#ffeedback-footer")
																.css('display',
																		'block');
														$(
																"#forgot-password-loading")
																.css('display',
																		'none');
													},
													error : function(result) {

														$("#feedback-body")
																.css('display',
																		'block');
														$("#ffeedback-footer")
																.css('display',
																		'block');
														$(
																"#forgot-password-loading")
																.css('display',
																		'none');
														$("#reviewerror")
																.text(
																		" Oops Something Went Wrong!!!");
													}
												});
									});

					$('#closebutton').click(function() {
						$("#forgotpasswordmessage").text("");
						$("#forgot_email input[name=email]").val('');

					});

					$('#closebutton1').click(function() {
						$("#forgotpasswordmessage").text("");
						$("#forgot_email input[name=email]").val('');

					});

					$('.thumbnail-lipstick .variant li ')
							.click(
									function() {

										var image = $("#hidden-span").text();

										image = image.replace('Image', $(this)
												.find('img').attr('alt'));
										$(".image-block img")
												.attr("src", image);
										$(".view-block li").attr("data-src",
												image);
										$('.thumbnail-lipstick .variant li ')
												.each(
														function(item) {
															item
																	.removeClass("thumbnail-border");

														});
										$(this).addClass("thumbnail-border");

									});

					/*
					 * $(".thumbnail-lipstick .variant li").first().addClass(
					 * "thumbnail-border");
					 */

					/*
					 * $('.pagination ul li') .click( function() {
					 * 
					 * if ($(this).attr("class") != 'pagination-prev' ||
					 * $(this).attr("class") != 'pagination-next') { var prevVal =
					 * parseInt($(this) .attr("id")) - 1; var nextVal =
					 * parseInt($(this) .attr("id")) + 1;
					 * 
					 * $('.pagination-next').attr("title", nextVal);
					 * $('.pagination-prev').attr("title", prevVal);
					 * 
					 * $('.pagination-prev a').attr( "href", "<%=request.getContextPath()%>/fashionapparel?pageNum=" +
					 * prevVal); $('.pagination-next a').attr( "href", "<%=request.getContextPath()%>/fashionapparel?pageNum=" +
					 * nextVal); } else { if ($(this).attr("class") !=
					 * 'pagination-next') { var nextVal = parseInt($(this)
					 * .attr("title")) + 1; $(this).attr("title", nextVal);
					 * $('.pagination-next a').attr( "href", "<%=request.getContextPath()%>/fashionapparel?pageNum=" +
					 * nextVal); } }
					 * 
					 * });
					 */

					/*
					 * $('.product-image .image-block img').mouseover(function() {
					 * $(this).css("cursor", "pointer"); $(this).animate({ width :
					 * "600px", height : "825px" }, 'slow'); });
					 * 
					 * $('.product-image .image-block img').mouseout(function() {
					 * $(this).animate({ width : "400px", height : "550px" },
					 * 'slow'); });
					 */

				});

/* start Modal popup JS */
$(function() {
	// ----- OPEN
	$('[data-popup-open]').on('click', function(e) {
		var targeted_popup_class = jQuery(this).attr('data-popup-open');
		$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
		e.preventDefault();
	});
	// ----- CLOSE
	$('[data-popup-close]').on('click', function(e) {
		var targeted_popup_class = jQuery(this).attr('data-popup-close');
		$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
		e.preventDefault();
	});
});
/* end JS Modal Popup */

/* changing main image using thumbnail */

