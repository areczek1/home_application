<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/modalalert.css" />
<title><s:message code="profilEdit.pageName"/></title>

<script type="text/javascript">
	function leave() {
		window.location = '${pageContext.request.contextPath}/logout';
	}
	setTimeout("leave()", 3000);
</script>

</head>
<body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<script type="text/javascript">

	$(window).load(function(){

		function fade() {
			$('.popupunder').fadeIn().delay(5000).fadeOut();
		}
		fade();
	});
</script>
<c:if test = "${not empty message}">
	<div class="popupunder alert alert-success fade in"><button type="button" class="close close-sm" data-dismiss="alert"><i class="glyphicon glyphicon-remove"></i></button><strong>Sukces : </strong> <c:out value="${message }" /></div>
</c:if>
</body>
</html>