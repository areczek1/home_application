<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
       <link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
       <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title><s:message code="logowanie.pageName" /></title>
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
            <form class="form-signin" action="/login" method="POST">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="email" name="email" class="form-control" placeholder="Adres email" required autofocus>

                <input type="password" id="password" name ="password" class="form-control" placeholder="Hasło" required>
                <span style="text-align:center; display: inline-block;">
                <c:if test="${not empty param.error}">
                    <font color="red"><s:message code="error.logowanie"/></font>
                </c:if>
                </span>
                <div id="remember" class="checkbox">
                    <input type="checkbox" tabindex="3" value="rememberme" id="rememberme">Zapamiętaj mnie
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Zaloguj się</button>
            </form><!-- /form -->
            <div class="row">
            <div class="col-md-6">Nie masz konta?</div>
                <div class="col-md-6"><a href="/register" class="forgot-password">Zarejestruj się</a></div>
            </div>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>
