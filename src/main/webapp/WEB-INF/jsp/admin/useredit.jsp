<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&amp;subset=latin-ext" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/useredit.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:700&display=swap" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title><s:message code="profilEdit.pageName"/></title>
</head>
<body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/resources/javascript/login.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<div style="margin-top:50px;" class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="/resources/images/logo.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <sf:form class="form-signin" id="usersForm" action="${pageContext.request.contextPath}/admin/updateuser/${user.id}" modelAttribute="user" enctype="multipart/form-data" method="POST">
            <sf:hidden path="id" value="${user.id}"/>
                <span id="reauth-email" class="reauth-email">Edycja Profilu </span>
                <sf:input type="text" path="name" size="28" id="name" readonly="true" class="form-control"/>
                <sf:input type="text" path="lastName" size="28" id="lastName" readonly="true" class="form-control"/>
                <sf:input type="email" path="email" size="28" id="email" readonly="true" class="form-control"/>
                <sf:select path="nrRoli" items="${roleMap}" class="form-control" id="exampleFormControlSelect1"/>
                <sf:select path="active" items="${activityMap}" class="form-control" id="exampleFormControlSelect1"/>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit"><s:message code="button.save"/></button>
                <button class="btn btn-lg btn-primary btn-block btn-signin" onclick="window.location.href='${pageContext.request.contextPath}/admin/users/1'"/><s:message code="button.cancel"/></button>
            </sf:form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>

