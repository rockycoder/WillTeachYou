<%@ include file="headerfile.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title>Student</title>
<meta name="title" content="Will Teach You">

</head>
<body class="body-class">
	<!-- LOADING -->
	<div class="loading-container" id="loading">
		<div class="loading-inner">
			<div class="windows8">
				<div class="wBall" id="wBall_1">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_2">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_3">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_4">
					<div class="wInnerBall"></div>
				</div>
				<div class="wBall" id="wBall_5">
					<div class="wInnerBall"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END LOADING -->
	<%@ include file="navigation-module.jsp"%>
	<div class="wrap-page">

		<form id="form_1156262" class="appnitro" method="post" action="">
			<div class="form_description">
				<h2>Untitled Form</h2>
				<p>This is your form description. Click here to edit.</p>
			</div>
			<ul>

				<li id="li_1"><label class="description" for="element_1">Topics</label>
					<div>
						<select class="element select medium" id="element_1"
							name="element_1">
							<option value="" selected="selected"></option>


						</select>
					</div></li>
				<li id="li_2"><label class="description" for="element_2">Location</label>
					<div>
						<select class="element select medium" id="element_2"
							name="element_2">
							<option value="" selected="selected"></option>


						</select>
					</div></li>
				<li id="li_3"><label class="description" for="element_3">Time</label>
					<div>
						<select class="element select medium" id="element_3"
							name="element_3">
							<option value="" selected="selected"></option>


						</select>
					</div></li>

				<li class="buttons"><input type="hidden" name="form_id"
					value="1156262" /> <input id="saveForm" class="button_text"
					type="submit" name="submit" value="Submit" /></li>
			</ul>
		</form>

		<%@ include file="footer.jsp"%>
		<!-- END FOOTER -->
		<!-- SCROLL TOP -->
		<div id="scroll-top" class="_1">Scroll Top</div>
		<!-- END SCROLL TOP -->
	</div>
</body>
</html>