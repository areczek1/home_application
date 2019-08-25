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
    <link rel="stylesheet" type="text/css" href="/resources/css/edittask.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <title><s:message code="profilEdit.pageName"/></title>
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
<c:if test = "${not empty message_edittask}">
    <div class="popupunder alert alert-success fade in"><button type="button" class="close close-sm" data-dismiss="alert"><i class="glyphicon glyphicon-remove"></i></button><strong>Sukces : </strong> Rejestracja przebiegła pomyślnie, ale Twoje konto nie jest jeszcze aktywne. Na podany email wysłany został link aktywacyjny.</div>
</c:if>
<div class="container-fluid stylish-form">
    <div class="row mar20">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="inner-section">
                <div class="mar20 form">
                    <sf:form class="form" action="/updatetask/${task.id}" id="taskform" modelAttribute="task" enctype="multipart/form-data" method="POST">
                    <h2 class="font_white text-center h2form">Edycja zadania</h2>
                    <ul class="ulform">
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
                        <sf:input type="text" name="name" path="name" id="name" size="28" class="form-control input-lg" placeholder="Nazwa zadania..." />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                        <sf:input type="text" name="description" path="description" id="description" size="28" class="form-control input-lg" placeholder="Opis zadania.."/>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                        <sf:input  type="text" name="comment" path="comment" id="comment" size="28" class="form-control input-lg" placeholder="Ilość punktów.."/>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                        <sf:input  type="number" name="countYang" path="countYang" id="countYang" size="28" class="form-control input-lg"  placeholder="Uwagi do zadania.."/>
                    </div>
                    <div class='input-group date' id='datetimepicker1'>
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar "></i>
                                </span>
                        <sf:input type="text" path="dueDateText" name="dueDateText" class="form-control" placeholder="Dodaj datę i godzinę.."/>
                    </div>
                    <script>
                        $(function () {
                            $('#datetimepicker1').datetimepicker();
                        });
                    </script>
                    <div class="footer text-center">
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