(function ($) {


    var mobiComKit = new MobiComKit();

    var default_options = {
        icons: {},
        defaults: {
            baseUrl: "http://mobi-com.appspot.com",
            launcher: "mobicomkit-launcher"
        }
    };


    $.fn.mobicomkit = function (options) {
        options = $.extend({}, default_options.defaults, options);
        mobiComKit.init(options);
    };

}(jQuery));

function MobiComKit() {

    this.init = function (options) {
        new Mobicomkit_Message(options);

    };

    var MCK_BASE_URL;
    var MCK_TOKEN;
    var APPLICATION_ID;
    var USER_NUMBER;
    var USER_COUNTRY_CODE;
    var USER_DEVICE_KEY;
    var AUTH_CODE;
    var MCK_LAUNCHER;
    var MCK_CALLBACK;
    var MCK_GETUSERNAME;
    var MCK_USER_TIMEZONEOFFSET;
    var FILE_METAS = "";
    var ELEMENT_NODE = 1;
    var IS_MCK_NOTIFICATION = false;
    var TEXT_NODE = 3;
    var TAGS_BLOCK = ['p', 'div', 'pre', 'form'];
    var CONTACT_MAP = new Array();
    var MckUtils = new MckUtils();
    var mckMessageService = new MckMessageService();
    var mckFileService = new MckFileService();
    var mckMessageLayout = new MckMessageLayout();
    var mckContactUtils = new MckContactUtils();
    var mckDateUtils = new MckDateUtils();
    var mckNotificationService = new MckNotificationService();
    var $mck_text_box;

    var Mobicomkit_Message = function (options) {
        var _this = this;
        MCK_LAUNCHER = options.launcher;
        mckMessageService.init(options);
        mckFileService.init();

        $mck_text_box = $("#mck-text-box");
        _this.options = options;
        _this.userId = options.userId;
        _this.appId = options.appId;
        _this.baseUrl = options.baseUrl;
        _this.launcher = options.launcher;
        _this.callback = options.readConversation;
        _this.getUserName = options.contactDisplayName;
        APPLICATION_ID = options.appId;
        MCK_BASE_URL = options.baseUrl;
        MCK_CALLBACK = options.readConversation;
        MCK_GETUSERNAME = options.contactDisplayName;


        MckUtils.initializeApp(options);
    };

    function MckUtils() {
        var _this = this;
        var INITIALIZE_APP_URL = "/tab/initialize.page";

        _this.initializeApp = function initializeApp(options) {

            var data = "applicationId=" + options.appId + "&userId=" + options.userId;
            $.getJSON(MCK_BASE_URL + INITIALIZE_APP_URL + "?" + data, function (result, status) {
                if (result === "INVALID_APPID") {
                    alert("Oops! looks like incorrect application id.");
                } else if (typeof result.token !== undefined) {
                    MCK_TOKEN = result.token;
                    USER_NUMBER = result.contactNumber;
                    USER_COUNTRY_CODE = result.countryCode;
                    USER_DEVICE_KEY = result.deviceKeyString;
                    MCK_USER_TIMEZONEOFFSET = result.timeZoneOffset;
                    AUTH_CODE = btoa(result.userId + ":" + result.deviceKeyString);
                    $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
                        if (!options.beforeSend) {
                            options.beforeSend = function (jqXHR) {
                                jqXHR.setRequestHeader("UserId-Enabled", true);
                                jqXHR.setRequestHeader("Authorization", "Basic " + AUTH_CODE);
                                jqXHR.setRequestHeader("Application-Key", APPLICATION_ID);
                            };
                        }
                    });
                    $(".mobicomkit-launcher").each(function () {
                        if (!$(this).hasClass("mck-msg-preview")) {
                            $(this).show();
                        }
                    });
                    //$("." + MCK_LAUNCHER).removeClass("hide");
                    MckInitializeChannel(MCK_TOKEN);

                } else {
                    alert("Unable to initiate app");
                }
            });

            $(document).on("click", ".mck-remove-file", function () {
                $("#mck-file-box .mck-file-lb").html("");
                $("#mck-file-box .mck-file-sz").html("");
                $("#mck-ms-sbmt").attr('disabled', false);
                $("#mck-file-box").removeClass('vis').addClass('n-vis');
                $mck_text_box.removeClass('mck-text-wf');
                $mck_text_box.attr("required", "");
                $("#mck-textbox-container").removeClass('mck-textbox-container-wf');

                if (FILE_METAS !== "") {
                    mckFileService.deleteFileMeta(FILE_METAS);
                    FILE_METAS = "";
                }
            });

            $(document).on("click", ".fancybox", function (e) {
                var href = $(this).find('img').data('imgurl');
                $(this).fancybox({
                    openEffect: 'none',
                    closeEffect: 'none',
                    'padding': 0,
                    'href': href,
                    'type': 'image'
                });
            });

        };

        _this.randomId = function () {
            return Math.random().toString(36).substring(7);
        };

        _this.textVal = function () {
            var lines = [];
            var line = [];

            var flush = function () {
                lines.push(line.join(''));
                line = [];
            };

            var sanitizeNode = function (node) {
                if (node.nodeType === TEXT_NODE) {
                    line.push(node.nodeValue);
                } else if (node.nodeType === ELEMENT_NODE) {
                    var tagName = node.tagName.toLowerCase();
                    var isBlock = TAGS_BLOCK.indexOf(tagName) !== -1;

                    if (isBlock && line.length) {
                        flush();
                    }

                    if (tagName === 'img') {
                        var alt = node.getAttribute('alt') || '';
                        if (alt) {
                            line.push(alt);
                        }
                        return;
                    } else if (tagName === 'br') {
                        flush();
                    }

                    var children = node.childNodes;
                    for (var i = 0; i < children.length; i++) {
                        sanitizeNode(children[i]);
                    }

                    if (isBlock && line.length) {
                        flush();
                    }
                }
            };

            var children = $mck_text_box[0].childNodes;
            for (var i = 0; i < children.length; i++) {
                sanitizeNode(children[i]);
            }

            if (line.length) {
                flush();
            }

            return lines.join('\n');
        };
    }

    function MckMessageService() {
        var _this = this;
        var ADD_MESSAGE_URL = "/rest/ws/mobicomkit/v1/message/add";
        var MESSAGE_LIST_URL = "/rest/ws/mobicomkit/v1/message/list";
        var $mck_msg_to = $("#mck-msg-to");
        var $mck_sidebox = $("#mck-sidebox");
        var $mck_msg_form = $("#mck-msg-form");
        var $mck_msg_sbmt = $("#mck-msg-sbmt");
        var $mck_msg_error = $("#mck-msg-error");
        var $mck_delete_button = $("#mck-delete-button");
        var $mck_show_more = $("#mck-show-more");
        var $mck_msg_response = $("#mck-msg-response");
        var $mck_response_text = $("#mck_response_text");
        var $mck_top_btn_panel = $("#mck-top-btn-panel");
        var $mck_textbox_container = $("#mck-textbox-container");
        var $mck_conversation_title = $("#mck-conversation-title");
        var $mck_msg_inner = $("#mck-message-cell .mck-message-inner");
        var $mck_loading = $(".mck-loading");
        var $mck_text_box = $("#mck-text-box");
        var $mck_minimize_icon = $(".mck-minimize-icon");
        var $mck_show_more_icon = $("#mck-show-more-icon");
        var $mck_sidebox_content = $(".mck-sidebox-content");
        var $messageModalLink;



        $(".mck-minimize-icon").click(function () {
            $(".modal-body,.modal-footer").animate({
                height: "toggle"
            });

            if ($(".mck-sidebox-content").hasClass("minimized")) {
                $(".mck-sidebox-content").css('height', '100%');
                $(".mck-sidebox-content").removeClass("minimized");
            } else {
                $(".mck-sidebox-content").css('height', '0%');
                $(".mck-sidebox-content").addClass("minimized");
            }

        });

        _this.init = function init(options) {
            sessionStorage.removeItem("mckMessageArray");
            $messageModalLink = $("." + MCK_LAUNCHER);
            $messageModalLink.on("click", function (e) {
                if ($(this).hasClass('mck-msg-preview')) {
                    $(this).hide();
                }
                $mck_msg_error.html("");
                $mck_msg_error.removeClass('vis').addClass('n-vis');
                $mck_response_text.html("");
                $mck_msg_response.removeClass('vis').addClass('n-vis');
                $mck_msg_form[0].reset();
                $mck_msg_inner.html("");
                mckMessageService.loadMessageList($(this).data("mck-id"));
                mckMessageLayout.openConversation();
            });

            $mck_text_box.keydown(function (event) {
                if (event.keyCode == 13 && (event.shiftKey || event.ctrlKey)) {
                    event.preventDefault();
                    if (window.getSelection) {
                        var selection = window.getSelection(),
                                range = selection.getRangeAt(0),
                                br = document.createElement("br"),
                                textNode = document.createTextNode("\u00a0"); //Passing " " directly will not end up being shown correctly
                        range.deleteContents();//required or not?
                        range.insertNode(br);
                        range.collapse(false);
                        range.insertNode(textNode);
                        range.selectNodeContents(textNode);

                        selection.removeAllRanges();
                        selection.addRange(range);
                        return false;
                    }

                } else if (event.keyCode === 13) {
                    event.preventDefault();
                    $mck_msg_form.submit();
                }
            });
            $(document).on("click", ".mck-delete-button", function (e) {
                var userId = $("#mck-msg-to").val();
                if (typeof userId !== 'undefined') {
                    if (confirm("Are you sure want to delete all the conversation!")) {
                        $.ajax({type: "get",
                            url: MCK_BASE_URL + "/rest/ws/mobicomkit/v1/message/delete/conversation.task",
                            global: false,
                            data: "userId=" + userId,
                            success: function (result) {
                                $mck_msg_inner.html("");
                                $("#mck-message-cell").removeClass('n-vis').addClass('vis');
                            },
                            error: function (result) {
                            }
                        });
                    }
                    else {
                        return;
                    }
                }
            });

            $(document).on("click", ".mck-conversation-tab-link, .mck-contact-list ." + MCK_LAUNCHER, function (e) {
                $mck_msg_error.html("");
                $mck_msg_error.removeClass('vis').addClass('n-vis');
                $mck_response_text.html("");
                $mck_msg_response.removeClass('vis').addClass('n-vis');
                $mck_msg_form[0].reset();
                $mck_msg_inner.html("");
                $mck_loading.removeClass('vis').addClass('n-vis');
                mckMessageService.loadMessageList($(this).data("mck-id"));
                mckMessageLayout.openConversation();
            });

            $(document).on("click", ".mck-show-more", function (e) {
                mckMessageService.loadMoreMessages();
            });

            $mck_msg_form.submit(function (e) {
                if (!USER_DEVICE_KEY) {
                    alert("Unable to initiate app. Please reload page.");
                    return;
                }
                var message = $.trim(MckUtils.textVal());

                if (message.length === 0 && !FILE_METAS) {
                    $mck_textbox_container.addClass("text-req");
                    return false;
                }
                var messagePxy = {
                    'to': $mck_msg_to.val(),
                    'contactIds': $mck_msg_to.val(),
                    'deviceKeyString': USER_DEVICE_KEY,
                    'type': 5,
                    'message': message,
                    'sendToDevice': true
                };
                if (FILE_METAS) {
                    messagePxy.fileMetaKeyStrings = FILE_METAS;
                }
                $mck_msg_sbmt.attr('disabled', true);
                $mck_msg_sbmt.html('Sending...');
                $mck_msg_error.removeClass('vis').addClass('n-vis');
                $mck_msg_error.html("");
                $mck_response_text.html("");
                $mck_msg_response.removeClass('vis').addClass('n-vis');
                return _this.sendMessage(messagePxy);

            });
            $("#mck-msg-form input").on('click', function () {
                $(this).val("");
                $mck_msg_error.removeClass('vis').addClass('n-vis');
                $mck_msg_response.removeClass('vis').addClass('n-vis');
            });
            $("#mck-text-box").on('click', function () {
                $mck_textbox_container.removeClass('text-req');
            });
        };

        _this.sendMessage = function sendMessage(messagePxy) {
            var randomId = MckUtils.randomId();
            var message = {
                'to': messagePxy.to,
                'contactIds': messagePxy.contactIds,
                'deviceKeyString': messagePxy.deviceKeyString,
                'type': 5,
                'message': messagePxy.message,
                'sendToDevice': true,
                'createdAtTime': new Date().getTime(),
                'keyString': randomId,
                'storeOnDevice': true,
                'sent': false,
                'shared': false,
                'read': true

            };
            if (!FILE_METAS) {
                var contactIds = message.contactIds;

                if (contactIds.lastIndexOf(",") == contactIds.length - 1) {
                    contactIds = contactIds.substring(0, contactIds.length - 1);
                }
                var contactIdsArray = contactIds.split(",");
                for (var i = 0; i < contactIdsArray.length; i++) {
                    var contact = mckMessageLayout.getContact(contactIdsArray[i]);
                    if (typeof contact !== 'undefined') {
                        var userId = $("#mck-message-cell .mck-message-inner").data('mck-id');
                        if (typeof userId !== 'undefined' && userId === contact.displayName) {
                            mckMessageLayout.addMessage(message, true);
                        }
                    }
                }
                $mck_msg_sbmt.attr('disabled', false);
                $mck_msg_sbmt.html('Send');
                var $mck_msg_div = $("#mck-message-cell .mck-message-inner div[name='message']." + randomId);
                mckMessageLayout.clearMessageField();
            }

            $("." + randomId + " .mck-message-status").removeClass('mck-icon-ok-circle').addClass('mck-icon-time');
            $.ajax({
                type: "POST",
                url: MCK_BASE_URL + ADD_MESSAGE_URL,
                global: false,
                data: JSON.stringify(messagePxy),
                contentType: 'application/json',
                headers: {"UserId-Enabled": true, 'Authorization': "Basic " + AUTH_CODE,
                    'Application-Key': APPLICATION_ID},
                success: function (data, status, xhr) {
                    if (data === 'error') {
                        $mck_msg_error.html("Unable to process your request. Please try again");
                        $mck_msg_error.removeClass('n-vis').addClass('vis');
                        $mck_msg_div.remove();
                    } else {
                        if (!FILE_METAS) {
                            $mck_msg_div.removeClass(randomId).addClass(data);
                            $mck_msg_div.data('msgkeystring', data);
                            $("." + data + " .mck-message-status").removeClass('mck-icon-time').addClass('mck-icon-ok-circle').attr('title', 'sent');

                        } else {
                            $mck_msg_sbmt.attr('disabled', false);
                            $mck_msg_sbmt.html('Send');
                            mckMessageLayout.clearMessageField();
                        }
                    }
                    FILE_METAS = "";
                },
                error: function (xhr, desc, err) {
                    $mck_msg_error.html('Unable to process your request. Please try again.');
                    $mck_msg_error.removeClass('n-vis').addClass('vis');

                    if (!FILE_METAS) {
                        $mck_msg_div.remove();
                    }

                    $mck_msg_sbmt.attr('disabled', false);
                    $mck_msg_sbmt.html('Send');
                    mckMessageLayout.clearMessageField();
                }

            });
            return false;
        };

        _this.loadMessageList = function loadMessageList(userId) {
            var userIdParam = "";
            var individual = true;
            var pageSize = 10;
            if (typeof userId !== "undefined") {
                userIdParam = "&userId=" + userId;
                $mck_msg_to.val(userId);
                $mck_show_more.data('userId', userId);
                $mck_msg_to.parent('.form-group').removeClass('vis').addClass('n-vis');
                $mck_delete_button.removeClass('n-vis').addClass('vis');
                var displayName = "";
                if (typeof (MCK_GETUSERNAME) === "function") {
                    displayName = MCK_GETUSERNAME(userId);
                }
                if (!displayName) {
                    displayName = userId;
                }
                $mck_conversation_title.html('<a href="#" role="link" class="mck-conversation-tab-link"><img src="' + MCK_BASE_URL + '/resources/sidebox/images/ic_action_backward.png" alt="Back"></a>&nbsp ' + displayName);
            } else {
                individual = false;
                pageSize = 50;
                var msgData = new Object();
                $mck_conversation_title.html('Conversations');
                $mck_msg_inner.data('mck-id', "");
                $mck_msg_inner.removeClass('mck-msg-w-panel');
                $mck_top_btn_panel.removeClass('vis').addClass('n-vis');
                $mck_delete_button.removeClass('vis').addClass('n-vis');
                $mck_msg_to.parent('.form-group').removeClass('n-vis').addClass('vis');
                if (typeof (Storage) !== "undefined") {
                    var mckMessageArray = JSON.parse(sessionStorage.getItem('mckMessageArray'));
                    if (mckMessageArray !== null) {
                        msgData.message = mckMessageArray;
                        mckMessageLayout.addContactsFromMessageList(msgData);
                        return;
                    }
                }
            }

            $mck_msg_inner.html("");
            $mck_loading.removeClass('n-vis').addClass('vis');
            $.ajax({
                url: MCK_BASE_URL + MESSAGE_LIST_URL + "?startIndex=0&pageSize=" + pageSize + userIdParam,
                type: 'get',
                global: false,
                success: function (data, status) {
                    $mck_loading.removeClass('vis').addClass('n-vis');
                    if (data + '' === "null" || typeof data.message === "undefined" || data.message.length === 0) {
                        if (individual) {
                            $mck_msg_inner.data('mck-id', userId);
                            $mck_msg_inner.removeClass('mck-msg-w-panel');
                            $mck_top_btn_panel.removeClass('vis').addClass('n-vis');
                            $mck_msg_inner.html('<div class="mck-no-data-text mck-text-muted">No messages yet!</div>');
                        } else {
                            $mck_msg_inner.html('<div class="mck-no-data-text mck-text-muted">No conversations yet!</div>');
                        }
                    } else {
                        if (individual) {
                            $mck_msg_inner.data('mck-id', userId);
                            mckMessageLayout.processMessageList(data);
                            $mck_top_btn_panel.removeClass('n-vis').addClass('vis');
                            $mck_msg_inner.addClass('mck-msg-w-panel');
                            if (typeof (MCK_CALLBACK) === "function") {
                                MCK_CALLBACK(userId);
                            }
                        } else {
                            $mck_msg_inner.data('mck-id', "");
                            mckMessageLayout.addContactsFromMessageList(data);
                            sessionStorage.setItem('mckMessageArray', JSON.stringify(data.message));

                        }
                    }

                }, error: function (xhr, desc, err) {
                    $mck_loading.removeClass('vis').addClass('n-vis');
                    alert('Unable to process your request.');
                }
            });
        };

        _this.loadMoreMessages = function loadMoreMessages() {
            var userId = $mck_show_more.data("userId");
            if (typeof userId !== "undefined") {
                $mck_show_more.attr("disabled", true);
                var data = "userId=" + userId + "&startIndex=0&pageSize=30&endTime=" + $mck_show_more.data('datetime');
                $mck_show_more_icon.removeClass('vis').addClass('n-vis');
                $mck_loading.removeClass('n-vis').addClass('vis');

                $.ajax({
                    url: MCK_BASE_URL + MESSAGE_LIST_URL,
                    data: data,
                    global: false,
                    type: 'get',
                    success: function (data, status) {
                        if (data + '' === "null" || typeof data.message === "undefined" || data.message.length === 0) {
                            $mck_loading.removeClass('vis').addClass('n-vis');
                            $mck_show_more_icon.removeClass('n-vis').addClass('vis');
                            $mck_show_more_icon.fadeOut(3000, function (e) {
                                $mck_show_more_icon.removeClass('vis').addClass('n-vis');
                            });
                        }

                        mckMessageLayout.processMessageList(data);
                        $mck_show_more.attr("disabled", false);
                    },
                    error: function (xhr, desc, err) {
                        $mck_show_more.attr("disabled", false);
                        alert('Unable to process your request. Please try refreshing the page.');
                    }
                });

            }
        };
    }

    function MckContactUtils() {
        var _this = this;
        _this.getContactId = function (contact) {
            var contactId = contact.contactId;
            return _this.formatContactId(contactId);
        };

        _this.formatContactId = function (contactId) {
            if (contactId.indexOf("+") === 0) {
                contactId = contactId.substring(1);
            }
            return contactId.replace(/\@/g, "AT").replace(/\./g, "DOT").replace(/\*/g, "STAR").replace(/\#/g, "HASH");
        };
    }

    function MckMessageLayout() {

        var FILE_PREVIEW_URL = "/rest/ws/file/shared/";
        var USER_ICON_URL = "images/ic_action_user.png";
        var _this = this;
        var $mck_msg_sbmt = $("#mck-msg-sbmt");
        var $mck_sidebox = $("#mck-sidebox");
        var $mck_msg_to = $("#mck-msg-to");

        var $mck_msg_inner = $("#mck-message-cell .mck-message-inner");
        var $mck_textbox_container = $("#mck-textbox-container");

        var markup = '<div name="message" data-msgdelivered="${msgDeliveredExpr}" data-msgsent="${msgSentExpr}" data-msgtype="${msgTypeExpr}"  data-msgtime="${msgCreatedAtTime}" data-msgcontent="${replyIdExpr}" data-msgkeystring="${msgKeyExpr}" data-contact="${contactIdsExpr}" class="row-fluid mck-m-b ${msgKeyExpr}"><div class="clear"><div class="blk-lg-12"><div class="${msgFloatExpr} mck-msg-box ${msgClassExpr}">' +
                '<div class="mck-msg-text mck-msg-content"></div>' +
                '<div class="mck-file-text mck-msg-text notranslate blk-lg-12 attachment n-vis" data-filemetakeystring="${fileMetaKeyExpr}" data-filename="${fileNameExpr}" data-filesize="${fileSizeExpr}">{{html fileExpr}}</div>' +
                '</div></div>' +
                '<div class="${msgFloatExpr}-muted mck-text-light mck-text-muted text-xs m-t-xs">${createdAtTimeExpr} <i class="${statusIconExpr} mck-message-status"></i></div>' +
                '</div></div>';
        var contactbox = '<li id="li-${contHtmlExpr}" class="${contIdExpr}" data-msg-time="${msgCreatedAtTimeExpr}">' +
                '<a class="${mckLauncherExpr}" href="#" data-mck-id="${contIdExpr}">' +
                '<div class="mck-row" title="${contNameExpr}">' +
                '<div class="blk-lg-3">{{html contImgExpr}}</div>' +
                '<div class="blk-lg-9">' +
                '<div class="mck-row">' +
                '<div class="blk-lg-8 mck-cont-name truncate"><strong>${contNameExpr}</strong></div>' +
                '<span class="mck-text-muted move-right mck-cont-msg-date">${msgCreatedDateExpr}</span>' +
                '</div>' +
                '<div class="mck-cont-msg-wrapper blk-lg-12">${msgTextExpr}</div>' +
                '</div>' +
                '</div></a></li>';
        $.template("messageTemplate", markup);
        $.template("contactTemplate", contactbox);

        _this.openConversation = function openConversation() {
            if ($mck_sidebox.css('display') === 'none') {
                $('.modal').modal('hide');
                $mck_sidebox.modal();
            }
            $mck_msg_to.focus();
        };

        _this.processMessageList = function processMessageList(data) {
            var showMoreDateTime;
            if (typeof data.message.length === "undefined") {
                mckMessageLayout.addMessage(data.message, false);
                showMoreDateTime = data.createdAtTime;

            } else {
                $.each(data.message, function (i, data) {
                    if (!(typeof data.to === "undefined")) {
                        mckMessageLayout.addMessage(data, false);
                        showMoreDateTime = data.createdAtTime;
                    }
                });
            }
            $("#mck-show-more").data('datetime', showMoreDateTime);
        };

        _this.addTooltip = function addTooltip(msgKeyString) {
            $("." + msgKeyString + " .mck-icon-time").attr('title', 'pending');
            $("." + msgKeyString + " .btn-trash").attr('title', 'delete');
            $("." + msgKeyString + " .mck-icon-ok-circle").attr('title', 'sent');
            $("." + msgKeyString + " .btn-forward").attr('title', 'forward message');
            $("." + msgKeyString + " .mck-icon-delivered").attr('title', 'delivered');
            $("." + msgKeyString + " .msgtype-outbox-cr").attr('title', 'sent via Carrier');
            $("." + msgKeyString + " .msgtype-outbox-mck").attr('title', 'sent');
            $("." + msgKeyString + " .msgtype-inbox-cr").attr('title', 'received via Carrier');
            $("." + msgKeyString + " .msgtype-inbox-mck").attr('title', 'recieved');
        };
        _this.getIcon = function getIcon(msgType) {
            if (msgType == 1 || msgType == 3) {
                return '<i class="icon-reply msgtype-outbox msgtype-outbox-cr via-cr"></i> ';
            }

            if (msgType == 5) {
                return '<i class="icon-reply msgtype-outbox msgtype-outbox-mck via-mck"></i> ';
            }

            if (msgType == 0) {
                return '<i class="icon-mail-forward msgtype-inbox msgtype-inbox-cr via-cr"></i> ';
            }

            if (msgType == 4) {
                return '<i class="icon-mail-forward msgtype-inbox msgtype-inbox-mck via-mck"></i> ';
            }

            if (msgType == 6) {
                return '<i class = "icon-phone call_incoming"></i> ';
            }

            if (msgType == 7) {
                return '<i class = "icon-phone call_outgoing"></i> '
            }

            return "";
        };

        _this.getContact = function getContact(contactId) {
            return CONTACT_MAP[contactId];
        };

        _this.addMessage = function addMessage(msg, append) {
            if (msg.type == 6 || msg.type == 7) {
                return;
            }
            var individual = true;
            if ($("#mck-message-cell ." + msg.keyString).length > 0) {
                return;
            }
            if ($("#mck-message-cell .mck-no-data-text").length > 0) {
                $(".mck-no-data-text").remove();
            }
            var messageClass = "";
            var floatWhere = "msg-right";
            var statusIcon = "mck-icon-time";
            var contactExpr = "vis";
            if (msg.type == 0 || msg.type == 4 || msg.type == 6) {
                floatWhere = "msg-left";
            }
            statusIcon = mckMessageLayout.getStatusIconName(msg);
            var replyId = msg.keyString;
            var replyMessageParameters = "'" + msg.deviceKeyString + "'," + "'" + msg.to + "'" + ",'" + msg.contactIds + "'" + ",'" + replyId + "'";
            var contactIds = msg.contactIds;
            var toNumbers = msg.to;
            if (contactIds.lastIndexOf(",") == contactIds.length - 1) {
                contactIds = contactIds.substring(0, contactIds.length - 1);
            }

            if (toNumbers.lastIndexOf(",") == toNumbers.length - 1) {
                toNumbers = toNumbers.substring(0, toNumbers.length - 1);
            }

            var contactIdsArray = contactIds.split(",");
            var tos = toNumbers.split(",");
            var contactNames = '';
            var s = new Set();
            if (contactIdsArray.length > 0 && contactIdsArray[0]) {
                for (var i = 0; i < contactIdsArray.length; i++) {
                    var contact;
                    if (typeof contact === 'undefined') {
                        var contactId = contactIdsArray[i];
                        mckMessageLayout.createContact(contactId);
                    }

                    if (typeof contact !== 'undefined') {
                        var name = contact.displayName;
                        var rel = contact.rel;
                        rel = typeof rel === 'undefined' || rel.length == 0 ? "" : ' [' + rel + ']';
                        var contactNumber = "";
                        if (individual == false) {
                            contactNumber = tos[i];
                        }
                        messageClass += " " + contact.htmlId;
                        if (individual == false) {
                            contactNumber += rel;
                            contactNames = contactNames + ' ' + name + '<br/>';
                        } else {
                            contactExpr = "n-vis";
                        }
                        s.add(tos[i]);
                    }
                }
            }
            var msgFeatExpr = "n-vis";

            var fileName = "";
            var fileSize = "";
            var frwdMsgExpr = msg.message;
            if (typeof msg.fileMetas !== "undefined") {
                if (typeof msg.fileMetas.length === "undefined") {
                    fileName = msg.fileMetas.name;
                    fileSize = msg.fileMetas.size;
                } else {
                    fileName = msg.fileMetas[0].name;
                    fileSize = msg.fileMetas[0].size;
                }
            }
            var msgList = [
                {
                    msgKeyExpr: msg.keyString,
                    msgDeliveredExpr: msg.delivered,
                    msgSentExpr: msg.sent,
                    msgCreatedAtTime: msg.createdAtTime,
                    msgTypeExpr: msg.type,
                    msgSourceExpr: msg.source,
                    statusIconExpr: statusIcon,
                    contactExpr: contactExpr,
                    contactIdsExpr: contactIds,
                    msgFloatExpr: floatWhere,
                    contactNamesExpr: contactNames,
                    replyIdExpr: replyId,
                    createdAtTimeExpr: mckDateUtils.getDate(msg.createdAtTime),
                    msgFeatExpr: msgFeatExpr,
                    replyMessageParametersExpr: replyMessageParameters,
                    msgClassExpr: messageClass,
                    msgExpr: frwdMsgExpr,
                    selfDestructTimeExpr: msg.timeToLive,
                    fileMetaKeyExpr: msg.fileMetaKeyStrings,
                    fileExpr: _this.getImagePath(msg),
                    fileNameExpr: fileName,
                    fileSizeExpr: fileSize
                }
            ];
            append ? $.tmpl("messageTemplate", msgList).appendTo("#mck-message-cell .mck-message-inner") : $.tmpl("messageTemplate", msgList).prependTo("#mck-message-cell .mck-message-inner");
            var msg_text = msg.message.replace(/\n/g, '<br/>');
            var emoji_template = emoji.replace_unified(msg_text);
            emoji_template = emoji.replace_colons(emoji_template);
            var $textMessage = $("." + replyId + " .mck-msg-content");
            $textMessage.html(emoji_template);
            if (msg.type == 6 || msg.type == 7) {
                $textMessage.html(mckMessageLayout.getIcon(msg.type) + $textMessage.html());
                (msg.type == 6) ? $textMessage.addClass("call_incoming") : $textMessage.addClass('call_outgoing');
            }
            $textMessage.linkify({
                target: '_blank'
            });
            if (msg.fileMetaKeyStrings) {
                $("." + replyId + " .mck-file-text" + " a").trigger('click');
                $("." + replyId + " .mck-file-text").removeClass('n-vis').addClass('vis');
                if ($textMessage.html() == "") {
                    $textMessage.removeClass('vis').addClass('n-vis');
                }
            }

            $mck_msg_inner.animate({scrollTop: $mck_msg_inner.prop("scrollHeight")}, 0);

            this.addTooltip(msg.keyString);
        };

        _this.getDisplayNameFromMessage = function getDisplayNameFromMessage(message) {
            var contact = this.getContact('' + message.contactIds.split(",")[0]);
            var name = "";
            if (typeof contact === "undefined") {
                name = message.to;
            } else {
                name = typeof contact.displayName === "undefined" ? contact.value : contact.displayName;
            }
            return name;
        };

        _this.getImagePath = function getImagePath(msg) {
            if (msg.fileMetaKeyStrings && typeof msg.fileMetas !== "undefined") {
                if (typeof msg.fileMetas.length === "undefined") {
                    if (msg.fileMetas.contentType.indexOf("image") != -1) {
                        if (msg.fileMetas.contentType.indexOf("svg") != -1) {
                            return '<a href="#" role="link" class="file-preview-link fancybox-media fancybox"><img src="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '" area-hidden="true" data-imgurl="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '"></img></a>';
                        } else {
                            return '<a href="#" role="link" class="file-preview-link fancybox-media fancybox"><img src="' + msg.fileMetas.thumbnailUrl + '" area-hidden="true" data-imgurl="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '"></img></a>';
                        }

                    } else {
                        return '<a href="' + MCK_BASE_URL + FILE_PREVIEW_URL + '"' + msg.fileMetaKeyStrings + '" role="link" class="file-preview-link" target="_blank"><span class="file-detail"><div class="file-name"><i class="icon-paperclip"></i>&nbsp;' + msg.fileMetas.name + '</div>&nbsp;<div class="file-size">' + mckFileService.getFilePreviewSize(msg.fileMetas.size) + '</div></span></a>';
                    }
                } else {
                    if (msg.fileMetas[0].contentType.indexOf("image") != -1) {
                        if (msg.fileMetas[0].contentType.indexOf("svg") != -1) {
                            return '<a href="#" role="link" class="file-preview-link fancybox-media fancybox"><img src="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '" area-hidden="true" data-imgurl="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '"></img></a>';
                        } else {
                            return '<a href="#" role="link" class="file-preview-link fancybox-media fancybox"><img src="' + msg.fileMetas[0].thumbnailUrl + '" area-hidden="true" data-imgurl="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '"></img></a>';
                        }

                    } else {
                        return '<a href="' + MCK_BASE_URL + FILE_PREVIEW_URL + msg.fileMetaKeyStrings + '" role="link" class="file-preview-link" target="_blank"><span class="file-detail"><div class="file-name"><i class="icon-paperclip"></i>&nbsp;' + msg.fileMetas[0].name + '</div>&nbsp;<div class="file-size">' + mckFileService.getFilePreviewSize(msg.fileMetas[0].size) + '</div></span></a>';
                    }
                }

            }
            return "";
        };

        _this.getContactImageLink = function getContactImageLink(contact) {
            if (contact.photoLink === "") {
                return this.getContactImageByAlphabet(contact.displayName);
            } else {
                return  '<img src="' + MCK_BASE_URL + '/contact.image?photoLink=' + contact.photoLink + '"/>';
            }

        };

        _this.getContactImageByAlphabet = function getContactImageByAlphabet(name) {
            if (typeof name === 'undefined' || name === "") {
                return '<div class="mck-alpha-contact-image mck-alpha-user"><span class="mck-contact-icon"><img src="' + USER_ICON_URL + '" alt=""></span></div>';
            }
            var first_alpha = name.charAt(0);
            var letters = /^[a-zA-Z]+$/;
            if (first_alpha.match(letters)) {
                first_alpha = first_alpha.toUpperCase();
                return '<div class="mck-alpha-contact-image alpha_' + first_alpha + '"><span class="mck-contact-icon">' + first_alpha + '</span></div>';
            } else {
                return '<div class="mck-alpha-contact-image alpha_user"><span class="mck-contact-icon"><img src="' + USER_ICON_URL + '" alt=""></span></div>';
            }
        };

        _this.addContactsFromMessageList = function addContactsFromMessageList(data) {
            if (data + '' === "null") {
                return;
            } else {
                $("#mck-message-cell .mck-message-inner").html('<ul id="mck-contact-list" class=" mck-contact-list nav nav-tabs nav-stacked"></ul>');
                if (typeof data.message.length === "undefined") {
                    this.addContactsFromMessage(data.message);
                } else {
                    $.each(data.message, function (i, data) {
                        if (!(typeof data.to === "undefined")) {
                            mckMessageLayout.addContactsFromMessage(data, false);
                        }
                    });
                }
            }
        };

        _this.createContact = function createContact(contactId) {

            var contact = {
                'contactId': contactId,
                'htmlId': mckContactUtils.formatContactId(contactId),
                'displayName': contactId,
                'name': contactId + " <" + contactId + ">" + " [" + "Main" + "]",
                'value': contactId,
                'rel': '',
                'photoLink': '',
                'email': '',
                'unsaved': true,
                'appVersion': null
            };
            CONTACT_MAP[contactId] = contact;
            return contact;
        };

        _this.addContactsFromMessage = function addContactsFromMessage(message, update) {
            var data = message;
            var contactIds = data.contactIds;
            if (contactIds.lastIndexOf(",") == contactIds.length - 1) {
                contactIds = contactIds.substring(0, contactIds.length - 1);
            }

            var contactIdsArray = contactIds.split(",");
            if (contactIdsArray.length > 0 && contactIdsArray[0]) {
                for (var i = 0; i < contactIdsArray.length; i++) {
                    var contact = _this.getContact('' + contactIdsArray[i]);
                    if (typeof contact === 'undefined') {
                        var contactId = contactIdsArray[i];
                        contact = mckMessageLayout.createContact(contactId);
                    }
                    this.updateRecentConversationList(contact, data, update);
                }
            }
        };
        _this.updateRecentConversationList = function updateRecentConversationList(contact, msg, update) {
            if ($("#li-" + contact.htmlId).length > 0) {
                var $mck_msg_part = $("#li-" + contact.htmlId + " .mck-cont-msg-wrapper");
                if (($mck_msg_part.is(":empty") || update) && msg !== undefined) {
                    this.updateContact(contact, msg);
                }
            } else {
                this.addContact(contact, msg);
            }
        };
        _this.removeContact = function removeContact(contact) {
            $("#li-" + contact.htmlId).remove();
        };
        _this.updateContact = function updateContact(contact, msg) {
            var emoji_template = emoji.replace_unified(msg.message.substring(0, 15));
            emoji_template = emoji.replace_colons(emoji_template);
            $("#li-" + contact.htmlId + " .mck-cont-msg-date").html(typeof msg.createdAtTime === 'undefined' ? "" : mckDateUtils.getTimeOrDate(msg ? msg.createdAtTime : "", true));
            $("#li-" + contact.htmlId + " .mck-cont-msg-wrapper").html(msg ? emoji_template : "");
            var latestCreatedAtTime = $('#mck-contact-list li:nth-child(1)').data('msg-time');
            var $contactElem = $("#li-" + contact.htmlId);
            $contactElem.data('msg-time', msg ? msg.createdAtTime : "");
            if ((typeof latestCreatedAtTime === "undefined" || (msg ? msg.createdAtTime : "") >= latestCreatedAtTime) && $("#mck-contact-list li").index($contactElem) != 0) {
                $('#mck-contact-list li:nth-child(1)').before($contactElem);
            }

        };

        _this.addContact = function addContact(contact, msg) {
            var imgsrctag = this.getContactImageLink(contact);
            if (typeof msg !== 'undefined') {
                var emoji_template = emoji.replace_unified(msg.message.substring(0, 15));
                emoji_template = emoji.replace_colons(emoji_template);
            }
            var displayName = "";
            if (typeof (MCK_GETUSERNAME) === "function") {
                displayName = MCK_GETUSERNAME(contact.value);
            }
            if (!displayName) {
                displayName = contact.displayName;
            }
            var contactList = [
                {
                    contHtmlExpr: contact.htmlId,
                    contIdExpr: contact.value,
                    msgCreatedAtTimeExpr: msg.createdAtTime,
                    mckLauncherExpr: MCK_LAUNCHER,
                    contImgExpr: imgsrctag,
                    contNameExpr: displayName,
                    msgCreatedDateExpr: msg ? mckDateUtils.getTimeOrDate(msg.createdAtTime, true) : "",
                    msgTextExpr: msg ? emoji_template : ""

                }
            ];
            var latestCreatedAtTime = $('#mck-contact-list li:nth-child(1)').data('msg-time');
            if (typeof latestCreatedAtTime === "undefined" || (msg ? msg.createdAtTime : "") > latestCreatedAtTime) {
                $.tmpl("contactTemplate", contactList).prependTo("#mck-contact-list");
            } else {
                $.tmpl("contactTemplate", contactList).appendTo("#mck-contact-list");
            }
        };

        _this.getStatusIcon = function getStatusIcon(msg) {
            return '<i class="' + this.getStatusIconName(msg) + ' move-right ' + msg.keyString + '_status status-icon"></i>';
        };
        _this.getStatusIconName = function getStatusIconName(msg) {
            if (msg.type == 7 || msg.type == 6) {
                return "";
            }

            if (msg.delivered == "true" || msg.delivered == true) {
                return 'mck-icon-delivered';
            }

            if (msg.type == 3 || (msg.type == 1 && msg.source == 0) || ((msg.sent == "true" || msg.sent == true) && msg.type != 0 && msg.type != 4)) {
                return 'mck-icon-ok-circle';
            }


            if (msg.type == 5 || (msg.type == 1 && (msg.source == 1 || msg.source == 2))) {
                //return 'mck-icon-time';
                return 'mck-icon-ok-circle';
            }
            return "";
        };

        _this.clearMessageField = function clearMessageField() {
            $mck_text_box.html("");
            $mck_msg_sbmt.attr('disabled', false);
            $("#mck-file-box").removeClass('vis').addClass('n-vis');
            $mck_text_box.removeClass('mck-text-wf');
            $mck_textbox_container.removeClass('text-req');
            $mck_textbox_container.removeClass('mck-textbox-container-wf');
            $mck_text_box.attr("required", "");
        };

        _this.removeConversationThread = function removeConversationThread(userId) {
            sessionStorage.removeItem("mckMessageArray");
            var contact = mckMessageLayout.getContact(userId);
            var currentTabId = $("#mck-message-cell .mck-message-inner").data('mck-id');
            if (typeof currentTabId === 'undefined') {
                if (typeof contact !== 'undefined') {
                    $("#li-" + contact.htmlId).remove();
                } else {
                    userId = mckContactUtils.formatContactId(userId);
                    $("#li-" + userId).remove();
                }
            }
        };


    }

    function MckFileService() {
        var _this = this;
        var FILE_UPLOAD_URL = "/rest/ws/file/url";
        var FILE_DELETE_URL = "/rest/ws/file/delete/file/meta";
        var FILE_PREVIEW_URL = "/rest/ws/file/shared/";
        var $file_upload;
        var $file_name;
        var $file_size;
        var $file_remove;
        var $file_progress;
        var $file_progressbar;
        var $textbox_container;
        var $file_box;
        var $mck_msg_sbmt;
        _this.init = function init() {
            $file_upload = $("#mck-file-up");
            $file_name = $(".mck-file-lb");
            $file_size = $(".mck-file-sz");
            $file_box = $("#mck-file-box");
            $file_progress = $("#mck-file-box .progress");
            $file_progressbar = $("#mck-file-box .progress .bar");
            $textbox_container = $("#mck-textbox-container");
            $file_remove = $("#mck-file-box .remove-file");
            $mck_msg_sbmt = $("#mck-ms-sbmt");

            $file_upload.fileupload({
                previewMaxWidth: 100,
                previewMaxHeight: 100,
                previewCrop: true,
                submit: function (e, data) {
                    var $this = $(this);
                    if (FILE_METAS !== "") {
                        mckFileService.deleteFileMeta(FILE_METAS);
                        FILE_METAS = "";
                    }
                    $mck_text_box.addClass('mck-text-wf');
                    $textbox_container.addClass('mck-textbox-container-wf');
                    $file_name.html('<a href="#">' + data.files[0].name + '</a>');
                    $file_size.html("(" + parseInt(data.files[0].size / 1024) + " KB)");
                    $file_progressbar.css('width', '0%');
                    $file_progress.removeClass('n-vis').addClass('vis');
                    $file_remove.attr("disabled", true);
                    $file_box.removeClass('n-vis').addClass('vis');
                    if (data.files[0].name === $("#mck-file-box .mck-file-lb a").html()) {

                        $mck_msg_sbmt.attr('disabled', true);
                        $.ajax
                                ({
                                    type: "GET",
                                    url: MCK_BASE_URL + FILE_UPLOAD_URL,
                                    global: false,
                                    data: "data=" + new Date().getTime(),
                                    crosDomain: true,
                                    headers: {"UserId-Enabled": true, 'Authorization': "Basic " + AUTH_CODE,
                                        'Application-Key': APPLICATION_ID},
                                    success: function (result, status, xhr) {
                                        data.url = result;
                                        $this.fileupload('send', data);
                                    },
                                    error: function (xhr, desc, err) {

                                    }
                                });
                    }
                    return false;
                },
                progressall: function (e, data) {

                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $file_progressbar.css(
                            'width',
                            progress + '%'
                            );
                },
                success: function (result, textStatus, jqXHR) {
                    var fileExpr = mckFileService.getFilePreviewPath(result, $("#mck-file-box .mck-file-lb a").html());
                    $file_remove.attr("disabled", false);
                    $file_name.html(fileExpr);
                    $file_progress.removeClass('vis').addClass('n-vis');

                    $mck_text_box.removeAttr('required');
                    $mck_msg_sbmt.attr('disabled', false);
                    FILE_METAS = "";
                    if (typeof result.fileMeta.length === "undefined") {
                        FILE_METAS = result.fileMeta.keyString;
                    } else {
                        $.each(result.fileMeta, function (i, fileMeta) {
                            FILE_METAS += fileMeta.keyString + ",";
                        });
                    }
                    return false;
                }, error: function (xhr, desc, err) {
                    FILE_METAS = "";
                    $(".mck-remove-file").trigger('click');
                }
            });
        };
        _this.deleteFileMeta = function deleteFileMeta(fileMetaKeyString) {
            $.ajax({
                url: MCK_BASE_URL + FILE_DELETE_URL,
                data: 'fileMetaKeyString=' + fileMetaKeyString,
                global: false,
                type: 'get',
                success: function (data, status) {
                }, error: function (xhr, desc, err) {
                }
            });
        };
        _this.getFilePreviewPath = function getFilePreviewPath(fileMetaKeyString, fileName) {
            var name = (fileName) ? fileName : "file_attached";
            if (fileMetaKeyString) {
                return '<a href="' + FILE_PREVIEW_URL + fileMetaKeyString + '" target="_blank">' + name + '</a>';
            }
            return "";
        };
        _this.getFilePreviewSize = function getFilePreviewSize(fileSize) {
            if (fileSize) {
                return "(" + parseInt(fileSize / 1024) + " KB)";
            }
            return "";
        };
    }


    function MckNotificationService() {
        var $mck_sidebox = $("#mck-sidebox");
        var $mck_msg_preview = $("#mck-msg-preview");
        var $mck_sidebox_launcher = $("#mck-sidebox-launcher");
        var $mck_preview_icon =$("#mck-msg-preview .mck-preview-icon");
        var $mck_preview_content = $("#mck-msg-preview .mck-preview-content");
        var $mck_preview_name = $("#mck-msg-preview .mck-preview-cont-name");
        var notificationTimeout = 60;
        var _this = this;
        _this.getChannelToken = function getChannelToken() {
            $.ajax({
                url: MCK_BASE_URL + '/rest/ws/channel/getToken',
                type: 'get',
                global: false,
                headers: {"UserId-Enabled": true, 'Authorization': "Basic " + AUTH_CODE,
                    'Application-Key': APPLICATION_ID},
                success: function (data, status) {
                    if (data === "error") {
                        alert("Unable to process your request. Please try refreshing the page.");
                    } else {
                        MckInitializeChannel(data);
                    }

                }, error: function (xhr, desc, err) {
                }
            });
        };

        _this.notifyUser = function notifyUser(message) {
            var notificationTimeout = 60;
            if (message.type === 7) {
                return;
            }

            if (!IS_MCK_NOTIFICATION) {
                mckNotificationService.showNewMessageNotification(message);
                return;
            } else {
                var name = mckMessageLayout.getDisplayNameFromMessage(message);
                if ($.browser.chrome) {
                    var c_version = parseInt(window.navigator.appVersion.match(/Chrome\/(\d+)\./)[1], 10);
                    if (c_version >= 35) {
                        if (!Notification) {
                            return;
                        }
                        if (Notification.permission !== "granted") {
                            Notification.requestPermission();
                        }
                        var notification = new Notification(name, {
                            body: message
                        });
                        notification.onclick = function (x) {
                            window.focus();
                            this.close();
                        };
                        setTimeout(function () {
                            notification.close();
                        }, notificationTimeout * 1000);
                    } else {
                        if (typeof window.webkitNotifications === "undefined") {
                            mckNotificationService.showNewMessageNotification(message);
                            return;
                        }
                        if (window.webkitNotifications.checkPermission() === 0) {
                            var notification = window.webkitNotifications.createNotification(name, message);
                            mckNotificationService.showNotification(notification);
                        }
                    }
                } else {
                    if (typeof window.webkitNotifications === "undefined") {
                        mckNotificationService.showNewMessageNotification(message);
                        return;
                    }
                    if (window.webkitNotifications.checkPermission() === 0) {
                        var notification = window.webkitNotifications.createNotification("/favicon.ico", name, message);
                        mckNotificationService.showNotification(notification);
                    }
                }
            }

        };

        _this.showNewMessageNotification = function showNewMessageNotification(message) {

            if ($mck_sidebox.css('display') === 'none') {
                var contact = mckMessageLayout.getContact('' + message.contactIds.split(",")[0]);
                if (typeof contact === 'undefined') {
                    contact = mckMessageLayout.createContact('' + message.contactIds.split(",")[0]);
                }
                var imgsrctag = mckMessageLayout.getContactImageLink(contact);
                if (typeof message !== 'undefined') {
                    var emoji_template = emoji.replace_unified(message.message);
                    emoji_template = emoji.replace_colons(emoji_template);
                }
                var msg = message ? emoji_template : "";


                $mck_preview_content.html(msg);
                $mck_preview_name.html(contact.displayName);
                $mck_preview_icon.html(imgsrctag);
                $mck_msg_preview.data('mck-id', contact.displayName);
                $mck_sidebox_launcher.addClass('mck-sidebox-launcher-with-preview');

            }
            $mck_msg_preview.show();
            setTimeout(function () {
                $mck_msg_preview.fadeOut(3000);
                $mck_sidebox_launcher.removeClass('mck-sidebox-launcher-with-preview');
            }, 10000);
        };

        _this.showNotification = function showNotification(notification) {
            if ($.browser.chrome) {
                notification.onclick = function (x) {
                    window.focus();
                    this.cancel();
                };
            }
            notification.show();
            setTimeout(function () {
                notification.cancel();
            }, notificationTimeout * 1000);
        };

    }

    function MckInitializeChannel(token) {
        channel = new goog.appengine.Channel(token);
        socket = channel.open();
        socket.onopen = onOpened;
        socket.onmessage = onMessage;
        socket.onerror = onError;
        socket.onclose = onClose;
    }

    onError = function () {
        mckNotificationService.getChannelToken();
    };
    onOpened = function () {
        connected = true;
    };
    onClose = function () {
        connected = false;
    };
    onMessage = function (response) {
        var data = response.data;
        var resp = JSON.parse(data);
        var messageType = resp.type;
        if (messageType === "DELETE_SMS_CONTACT") {
            var userId = resp.message;
            if (typeof userId !== 'undefined') {
                mckMessageLayout.removeConversationThread(userId);
            }
        } else if (messageType === "SMS_DELIVERED_UPDATE") {
            $("." + resp.message.split(",")[0] + " .mck-message-status").removeClass('mck-icon-time').removeClass('mck-icon-ok-circle').addClass('mck-icon-delivered');
        } else if (messageType.indexOf("SMS") != -1) {
            var message = JSON.parse(resp.message);
            var mckMessageArray = new Array();
            //  mckMessageLayout.openConversation();

            var mckContactListLength = $("#mck-contact-list").length;
            var userId = $("#mck-message-cell .mck-message-inner").data('mck-id');

            if (mckContactListLength === 0 && (typeof userId === "undefined" || userId == "")) {
                var data = new Object();
                var messageArray = new Array();
                messageArray.push(message);
                data.message = messageArray;
                mckMessageLayout.addContactsFromMessageList(data);
            }

            if (mckContactListLength > 0) {
                mckMessageLayout.addContactsFromMessage(message, true);
                if (messageType === "SMS_RECEIVED" && resp.notifyUser) {
                    mckNotificationService.notifyUser(message);
                }
            } else {
                if (messageType === "SMS_RECEIVED") {
                    var contactId = message.contactIds.replace(",", "");
                    var contact = mckMessageLayout.getContact(contactId);
                    if (typeof contact !== 'undefined') {

                        var userId = $("#mck-message-cell .mck-message-inner").data('mck-id');
                        if (typeof userId !== 'undefined' && userId === contact.displayName) {

                            mckMessageLayout.addMessage(message, true);
                            //Todo: use contactNumber instead of contactId for Google Contacts API.


                        }
                        if (resp.notifyUser) {
                            mckNotificationService.notifyUser(message);
                        }
                    }
                } else if (messageType === "SMS_SENDING") {
                    if ((message.type !== 5 || message.source !== 1 || message.fileMetaKeyStrings)) {

                        var contactIds = message.contactIds;

                        if (contactIds.lastIndexOf(",") == contactIds.length - 1) {
                            contactIds = contactIds.substring(0, contactIds.length - 1);
                        }
                        var contactIdsArray = contactIds.split(",");
                        for (var i = 0; i < contactIdsArray.length; i++) {
                            var contact = mckMessageLayout.getContact(contactIdsArray[i]);
                            if (typeof contact !== 'undefined') {
                                var userId = $("#mck-message-cell .mck-message-inner").data('mck-id');
                                if (typeof userId !== 'undefined' && userId === contact.displayName) {
                                    mckMessageLayout.addMessage(message, true);
                                    if (message.type == 3 || (message.type == 5 && message.fileMetaKeyStrings)) {
                                        $("." + message.keyString + " .mck-message-status").removeClass('mck-icon-time').addClass('mck-icon-ok-circle');
                                        mckMessageLayout.addTooltip(message.keyString);
                                    }
                                }
                            }
                        }
                    }
                } else if (messageType === "SMS_SENT_UPDATE" && message.type != 0 && message.type != 4) {
                    $("." + message.keyString + " .mck-message-status").removeClass('mck-icon-time').addClass('mck-icon-ok-circle');
                    mckMessageLayout.addTooltip(message.keyString);
                }
            }
            mckMessageArray.push(message);
            if (typeof (Storage) !== "undefined") {
                var mckLocalMessageArray = JSON.parse(sessionStorage.getItem('mckMessageArray'));
                if (mckLocalMessageArray != null) {
                    mckMessageArray = mckMessageArray.concat(mckLocalMessageArray);
                }
            }
            sessionStorage.setItem('mckMessageArray', JSON.stringify(mckMessageArray));
        }
    };


    function MckDateUtils() {
        var _this = this;
        var fullDateFormat = "mmm d, h:MM TT";
        var onlyDateFormat = "mmm d";
        var onlyTimeFormat = "h:MM TT"
        var mailDateFormat = "mmm d, yyyy"
        var months = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

        _this.getDate = function getDate(createdAtTime) {
            var date = new Date(parseInt(createdAtTime, 10));
            var localDate = new Date();
            var utcTime = parseInt(date.getTime() + (localDate.getTimezoneOffset() * 60000));
            date = new Date(parseInt(utcTime + parseInt(MCK_USER_TIMEZONEOFFSET, 10)));
            var currentDate = new Date();
            var utcCurrentTime = parseInt(currentDate.getTime() + (localDate.getTimezoneOffset() * 60000));
            currentDate = new Date(parseInt(utcCurrentTime + parseInt(MCK_USER_TIMEZONEOFFSET, 10)));
            return currentDate.getDate() !== date.getDate() ? dateFormat(date, fullDateFormat, false) : dateFormat(date, onlyTimeFormat, false);
        };

        _this.getTimeOrDate = function getTimeOrDate(createdAtTime, timeFormat) {
            var date = new Date(parseInt(createdAtTime, 10));
            var localDate = new Date();
            var utcTime = parseInt(date.getTime() + (localDate.getTimezoneOffset() * 60000));
            date = new Date(parseInt(utcTime + parseInt(MCK_USER_TIMEZONEOFFSET, 10)));
            var currentDate = new Date();
            var utcCurrentTime = parseInt(currentDate.getTime() + (localDate.getTimezoneOffset() * 60000));
            currentDate = new Date(parseInt(utcCurrentTime + parseInt(MCK_USER_TIMEZONEOFFSET, 10)));
            if (timeFormat) {
                return currentDate.getDate() !== date.getDate() ? dateFormat(date, onlyDateFormat, false) : dateFormat(date, onlyTimeFormat, false);
            } else {
                return dateFormat(date, fullDateFormat, false);
            }
        };


        _this.getSystemDate = function getSystemDate(time) {
            var date = new Date(parseInt(time, 10));
            return dateFormat(date, fullDateFormat, false);
        };

        var dateFormat = function () {
            var token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
                    timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
                    timezoneClip = /[^-+\dA-Z]/g,
                    pad = function (val, len) {
                        val = String(val);
                        len = len || 2;
                        while (val.length < len)
                            val = "0" + val;
                        return val;
                    };
            // Regexes and supporting functions are cached through closure
            return function (date, mask, utc) {
                var dF = dateFormat;
                // You can't provide utc if you skip other args (use the "UTC:" mask prefix)
                if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
                    mask = date;
                    date = undefined;
                }

                // Passing date through Date applies Date.parse, if necessary
                date = date ? new Date(date) : new Date;
                if (isNaN(date))
                    throw SyntaxError("invalid date");
                mask = String(mask);
                // mask = String(dF.masks[mask] || mask || dF.masks["default"]);

                // Allow setting the utc argument via the mask
                if (mask.slice(0, 4) == "UTC:") {
                    mask = mask.slice(4);
                    utc = true;
                }
                var _ = utc ? "getUTC" : "get",
                        d = date[_ + "Date"](),
                        D = date[_ + "Day"](),
                        m = date[_ + "Month"](),
                        y = date[_ + "FullYear"](),
                        H = date[_ + "Hours"](),
                        M = date[_ + "Minutes"](),
                        s = date[_ + "Seconds"](),
                        L = date[_ + "Milliseconds"](),
                        o = utc ? 0 : date.getTimezoneOffset(),
                        flags = {
                            d: d,
                            dd: pad(d),
                            ddd: dF.i18n.dayNames[D],
                            dddd: dF.i18n.dayNames[D + 7],
                            m: m + 1,
                            mm: pad(m + 1),
                            mmm: dF.i18n.monthNames[m],
                            mmmm: dF.i18n.monthNames[m + 12],
                            yy: String(y).slice(2),
                            yyyy: y,
                            h: H % 12 || 12,
                            hh: pad(H % 12 || 12),
                            H: H,
                            HH: pad(H),
                            M: M,
                            MM: pad(M),
                            s: s,
                            ss: pad(s),
                            l: pad(L, 3),
                            L: pad(L > 99 ? Math.round(L / 10) : L),
                            t: H < 12 ? "a" : "p",
                            tt: H < 12 ? "am" : "pm",
                            T: H < 12 ? "A" : "P",
                            TT: H < 12 ? "AM" : "PM",
                            Z: utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
                            o: (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
                            S: ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
                        };
                return mask.replace(token, function ($0) {
                    return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
                });
            };
        }();
        // Some common format strings
        dateFormat.masks = {
            "default": "mmm d, yyyy h:MM TT",
            fullDateFormat: "mmm d, yyyy h:MM TT",
            onlyDateFormat: "mmm d",
            onlyTimeFormat: "h:MM TT",
            mailDateFormat: "mmm d, yyyy",
            mediumDate: "mmm d, yyyy",
            longDate: "mmmm d, yyyy",
            fullDate: "dddd, mmmm d, yyyy",
            shortTime: "h:MM TT",
            mediumTime: "h:MM:ss TT",
            longTime: "h:MM:ss TT Z",
            isoDate: "yyyy-mm-dd",
            isoTime: "HH:MM:ss",
            isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
            isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
        };
        // Internationalization strings
        dateFormat.i18n = {
            dayNames: [
                "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
                "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
            ],
            monthNames: [
                "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
                "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
            ]
        };
    }

}
