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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/addtask.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/modalalert.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title><s:message code="addtask.pageName"/></title>
</head>
<body style="color:white;">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<script src="https://use.fontawesome.com/1dec14be15.js"></script>

<script type="text/javascript">

    $(window).load(function(){

        function fade() {
            $('.popupunder').fadeIn().delay(5000).fadeOut();
        }
        fade();
    });
</script>
<c:if test = "${not empty message_task}">
    <div class="popupunder alert alert-success fade in"><button type="button" class="close close-sm" data-dismiss="alert"><i class="glyphicon glyphicon-remove"></i></button><strong>Sukces : </strong> Pomyślnie dodano zadanie. Pojawiło się na stronie głównej.</div>
</c:if>
<div class="container-fluid stylish-form">
    <div class="row mar20">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="inner-section">
                <div class="mar20 form">
                <sf:form class="form-signin" action="addnewtask" role="form" modelAttribute="task" enctype="multipart/form-data" method="POST">
                        <h2 class="font_white text-center h2form">Dodawanie zadania</h2>
                        <ul class="ulform">
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-list fa-3x" style="color:black"></i>
                            </li>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-sign-language fa-3x" style="color:black"></i>
                            </li>
                            <li class="icon-holder dsp-flex" style="color:black">
                                <i class="fa fa-desktop fa-3x"></i>
                            </li>
                        </ul>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <input type="text" class="form-control" name="name" path="name" id="name" placeholder="Nazwa zadania.." pattern=".{3,}" required title="Wprowadź co najmniej 3 znaki">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <input type="text" class="form-control" name="description" path="description" id="description" placeholder="Opis zadania.." pattern=".{5,}" required title="Wprowadź co najmniej 5 znaków">

                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <input type="number" min="0" class="form-control" name="countYang" path="countYang" id="countYang" required="required" placeholder="Ilość punktów.." required>

                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <input type="text" class="form-control" name="comment" path="comment" id="comment" placeholder="Uwagi do zadania.." pattern=".{8,}" required title="Wprowadź co najmniej 8 znaków">

                        </div>
                    <div class='input-group date' id='datetimepicker1'>
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar "></i>
                                </span>
                        <input type="text" path="dueDateText" name="dueDateText" class="form-control" placeholder="Dodaj datę i godzinę.." pattern=".{19,}" required title="Wpisz datę w formacie 00/00/0000 00:00 AM">
                    </div>
                    <script>
                        $(function () {
                            $('#datetimepicker1').datetimepicker();
                        });
                    </script>
                        <div class="footer text-center">
                            <input type="submit" class="btn btn-neutral btn-round btn-lg left" value="<s:message code="button.addtask"/>">
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