<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form method='post'
		action="https://secure.paytm.in/oltp-web/processTransaction" name='f1'>


		<table border='1'>
			<tbody>
				<c:forEach items="${map}" var="entry">

					<input type='hidden' name='${entry.key}'
						value='${entry.value}'>
				</c:forEach>
			</tbody>
		</table>
		<script type='text/javascript'>
			document.f1.submit();
		</script>

	</form>
</body>
</html>