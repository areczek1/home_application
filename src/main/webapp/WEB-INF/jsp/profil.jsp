<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=" background: url(resources/images/profil_bg.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;">>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/profil.css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title><s:message code="profil.userDane"/></title>
</head>
<body style=" background: url(resources/images/profil_bg.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/resources/javascript/login.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<div class="container" style=" background: url(resources/images/profil_bg.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;">
	<div class="row login_box">
	    <div class="col-md-12 col-xs-12" align="center">
            <div class="outter"><img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg" class="image-circle"/></div>
            <h2><c:out value="${user.name }"/> <c:out value="${user.lastName }"/></h2>
            <h3><c:out value="${user.email }"/><h3>
	    </div>
        <div class="col-md-6 col-xs-6 follow line" align="center">
            <h4>
                 <s:message code="profil.czyAktywny"/>
            </h4>
        </div>
        <div class="col-md-6 col-xs-6 follow line" align="center">
            <h4>
                 <c:choose>
                    				<c:when test="${user.active == 1 }">
                    					<s:message code="word.tak"/>
                    				</c:when>
                    				<c:otherwise>
                    					<s:message code="word.nie"/>
                    				</c:otherwise>
                    			</c:choose>
            </h4>
        </div>
        <div class="col-md-6 col-xs-6 follow line" align="center">
                    <h4>
                         <s:message code="profil.rola"/>
                    </h4>
                </div>
                <div class="col-md-6 col-xs-6 follow line" align="center">
                    <h4>
                         <c:choose>
                             			<c:when test="${user.nrRoli == 1 }">
                             				<s:message code="word.admin"/>
                             			</c:when>
                                         <c:when test="${user.nrRoli == 2 }">
                                             <s:message code="word.user"/>
                                         </c:when>
                             			<c:otherwise>
                             				<s:message code="word.parent"/>
                             			</c:otherwise>
                             		</c:choose>
                    </h4>
                </div>

        <div class="col-md-12 col-xs-12 login_control">

                <div align="center">
                     <button class="btn btn-orange" onclick="window.location.href='${pageContext.request.contextPath}/editprofil'"><s:message code="button.edycjaProfilu"/></button>
                </div>

        </div>



    </div>
</div>
</body>
</html>

