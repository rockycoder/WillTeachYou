$(document)
			.ready(
					function() {

						var DrawEye = function(eyecontainer, pupil, eyeposx,
								eyeposy, eyer) {
							$("#mouseeyes")
									.append(
											"<div id='" + eyecontainer + "'><div id='" + pupil + "'></div></div>")

							eyecontainer = "#" + eyecontainer;
							pupil = "#" + pupil;

							$(eyecontainer).css({
								left : eyeposx,
								top : eyeposy
							});
							$(pupil).css({
								width : eyer * 0.4,
								height : eyer * 0.4
							});
							$(eyecontainer).css({
								width : eyer,
								height : eyer
							});
							$(pupil).css({
								position : 'relative',
								background : '#000000',
								'border-radius' : '50%'
							});
							$(eyecontainer).css({
								position : 'absolute',
								background : '#FFFFFF',
								overflow : 'hidden',
								'border-radius' : '50%'
							});

							// Initialise core variables
							var r = $(pupil).width() / 2;
							var center = {
								x : $(eyecontainer).width() / 2 - r,
								y : $(eyecontainer).height() / 2 - r
							};
							var distanceThreshold = $(eyecontainer).width() / 2
									- r;
							var mouseX = center.x, mouseY = center.y;

							// Listen for mouse movement
							$(window).mousemove(
									function(e) {
										var d = {
											x : e.pageX - r - eyeposx
													- center.x,
											y : e.pageY - r - eyeposy
													- center.y
										};
										var distance = Math.sqrt(d.x * d.x
												+ d.y * d.y);
										if (distance < distanceThreshold) {
											mouseX = e.pageX - eyeposx - r;
											mouseY = e.pageY - eyeposy - r;
										} else {
											mouseX = d.x / distance
													* distanceThreshold
													+ center.x;
											mouseY = d.y / distance
													* distanceThreshold
													+ center.y;
										}
									});

							// Update pupil location
							var pupil = $(pupil);
							var xp = center.x, yp = center.y;
							var loop = setInterval(function() {
								// change 1 to alter damping/momentum - higher is slower
								xp += (mouseX - xp) / 1;
								yp += (mouseY - yp) / 1;
								pupil.css({
									left : xp,
									top : yp
								});
							}, 1);
						};

						var eye = new DrawEye("eye1", "pupil1", 35, 29, 15);
						var eye = new DrawEye("eye2", "pupil2", 51, 24, 22);
						var prevText = null;
						var nextText = null;

						$('.bubble').hover(

						function() {
							prevText = $(this).text();
							$(this).text(nextText);

						}, function() {

							$(this).text(prevText);
						}

						);

					});

	// BEGIN Script for Text Animation

	jQuery(document)
			.ready(
					function($) {
						//set animation timing
						var animationDelay = 2500,
						//loading bar effect
						barAnimationDelay = 3800, barWaiting = barAnimationDelay - 3000, //3000 is the duration of the transition on the loading bar - set in the scss/css file
						//letters effect
						lettersDelay = 50,
						//type effect
						typeLettersDelay = 150, selectionDuration = 500, typeAnimationDelay = selectionDuration + 800,
						//clip effect 
						revealDuration = 600, revealAnimationDelay = 1500;

						initHeadline();

						function initHeadline() {
							//insert <i> element for each letter of a changing word
							singleLetters($('.cd-headline.letters').find('b'));
							//initialise headline animation
							animateHeadline($('.cd-headline'));
						}

						function singleLetters($words) {
							$words.each(function() {
								var word = $(this), letters = word.text()
										.split(''), selected = word
										.hasClass('is-visible');
								for (i in letters) {
									if (word.parents('.rotate-2').length > 0)
										letters[i] = '<em>' + letters[i]
												+ '</em>';
									letters[i] = (selected) ? '<i class="in">'
											+ letters[i] + '</i>' : '<i>'
											+ letters[i] + '</i>';
								}
								var newLetters = letters.join('');
								word.html(newLetters);
							});
						}

						function animateHeadline($headlines) {
							var duration = animationDelay;
							$headlines.each(function() {
								var headline = $(this);
								//trigger animation
								setTimeout(
										function() {
											hideWord(headline.find(
													'.is-visible').eq(0))
										}, duration);
							});
						}

						function hideWord($word) {
							var nextWord = takeNext($word);
							changeLaptopBackground(nextWord[0].className);
							if ($word.parents('.cd-headline').hasClass(
									'letters')) {
								var bool = ($word.children('i').length >= nextWord
										.children('i').length) ? true : false;
								hideLetter($word.find('i').eq(0), $word, bool,
										lettersDelay);
								showLetter(nextWord.find('i').eq(0), nextWord,
										bool, lettersDelay);

							} else {
								switchWord($word, nextWord);
								setTimeout(function() {
									hideWord(nextWord)
								}, animationDelay);
							}
						}

						function hideLetter($letter, $word, $bool, $duration) {
							$letter.removeClass('in').addClass('out');

							if (!$letter.is(':last-child')) {
								setTimeout(function() {
									hideLetter($letter.next(), $word, $bool,
											$duration);
								}, $duration);
							} else if ($bool) {
								setTimeout(function() {
									hideWord(takeNext($word))
								}, animationDelay);
							}

							if ($letter.is(':last-child')
									&& $('html').hasClass('no-csstransitions')) {
								var nextWord = takeNext($word);
								switchWord($word, nextWord);
							}
						}

						function showLetter($letter, $word, $bool, $duration) {
							$letter.addClass('in').removeClass('out');

							if (!$letter.is(':last-child')) {
								setTimeout(function() {
									showLetter($letter.next(), $word, $bool,
											$duration);
								}, $duration);
							} else {
								if (!$bool) {
									setTimeout(function() {
										hideWord($word)
									}, animationDelay)
								}
							}
						}

						function takeNext($word) {
							return (!$word.is(':last-child')) ? $word.next()
									: $word.parent().children().eq(0);
						}

						function takePrev($word) {
							return (!$word.is(':first-child')) ? $word.prev()
									: $word.parent().children().last();
						}

						function switchWord($oldWord, $newWord) {
							$oldWord.removeClass('is-visible').addClass(
									'is-hidden');
							$newWord.removeClass('is-hidden').addClass(
									'is-visible');
						}

					});

	$(document).ready(function() {
		$('.btn-circle').click(function() {
			var scrollTo = $('.our-process-wrapper').offset().top;

			$('html,body').animate({
				scrollTop : scrollTo
			}, 1000);

		});

	});

	function changeLaptopBackground(classname) {

		switch (classname) {

		case "is-visible one":
			// $('.screen').css('background', '#fff url(http://gracespace.org.uk/wp-content/uploads/2012/01/explore-logo-300x114.gif) no-repeat');
			$('.screen').attr('class', 'screen bg-explore');
			$('.screen-head').css('background', '#e74c3c');
			break;

		case "two":
			// $('.screen').css('background', '#fff url(http://www.sparkawards.com/wp-content/uploads/2014/03/Experience3-72.jpg) no-repeat');
			$('.screen').attr('class', 'screen bg-experience');
			$('.screen-head').css('background', '#27ae60');
			break;

		case "three":
			// $('.screen').css('background', '#fff url(http://www.mihaiapostol.net/wp-content/uploads/2014/11/you-decide.jpg) no-repeat');
			$('.screen').attr('class', 'screen bg-decide');
			$('.screen-head').css('background', '#3d9ddd');
			break;

		}

	}

	// anchor tag scroll

	$(document).ready(function() {
		$('.header.container a[href^="#"]').bind('click.smoothscroll', function(e) {
			e.preventDefault();

			var target = this.hash, $target = $(target);

			$('html, body').stop().animate({
				'scrollTop' : $target.offset().top - 40
			}, 900, 'swing', function() {
				window.location.hash = target;
			});
		});
	});

	