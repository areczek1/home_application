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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/editprofile.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/modalalert.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title><s:message code="profilEdit.pageName"/></title>
</head>
<body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<script src="https://use.fontawesome.com/1dec14be15.js"></script>
<div class="container-fluid stylish-form">
    <div class="row mar20">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="inner-section">
                <sf:form class="form" id="usersForm" action="updateprofil" modelAttribute="user"
                         enctype="multipart/form-data" method="POST">
                    <div class="mar20 inside-form">
                        <h2 class="font_white text-center">Edycja profilu</h2>
                        <ul>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-facebook "></i>
                            </li>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-twitter "></i>
                            </li>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-instagram "></i>
                            </li>
                        </ul>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <sf:input path="name" name="name" id="name" type="text" size="28" class="form-control input-lg" placeholder="Imię..." />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <sf:input path="lastName" name="lastName" id="lastName" size="28" type="text" placeholder="Nazwisko..." class="form-control input-lg"/>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope "></i></span>
                            <sf:input path="email" name="email" id="email" size="28" type="email" class="form-control input-lg" placeholder="Email..."/>
                        </div>
                        <div class="footer text-center">
                            <input type="button" class="btn btn-neutral btn-round btn-lg" value="<s:message code="button.zmianaHasla"/>"
                            onclick="window.location.href='${pageContext.request.contextPath}/editpassword'"/>
                        </div>
                            <div class="passwordfooter text-center">
                            <input type="submit" class="btn btn-neutral btn-round btn-lg left" value="<s:message code="button.save"/>" />
                            <input type="button" class="btn btn-neutral btn-round btn-lg right" value="<s:message code="button.cancel"/>"
                                   onclick="window.location.href='${pageContext.request.contextPath}/'"/>
                        </div>
                    </div>
                </sf:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>