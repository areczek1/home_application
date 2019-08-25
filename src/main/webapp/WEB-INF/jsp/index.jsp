<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=" background: url(resources/images/main_page_background.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/index2.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/modalalert.css" />
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />');
            else $('head > link').filter(':first').replaceWith(defaultCSS);
        }
        $( document ).ready(function() {
            var iframe_height = parseInt($('html').height());
            window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
    <script type="text/javascript">
        var numberid;
        function startSerach(name, description, countYang, comment, id){document.getElementById("comment").innerHTML = comment;
        numberid =id;
        document.getElementById("name").innerHTML = name;
        document.getElementById("errorSearch").innerHTML = description;
        document.getElementById("yang").innerHTML = countYang;}

        function add()
        {
            var taskLink= '${pageContext.request.contextPath}/addtask'
            window.location.href=taskLink;
        }
        function editTask()
        {
            var taskLink= '${pageContext.request.contextPath}/edittask/'+ numberid
            window.location.href=taskLink;
        }
        function doIt()
        {
            var taskLink= '${paContext.request.contextPath}/doit/'+numberid
            window.location.href=taskLink;
        }
        function done()
        {
            var taskLink= '${paContext.request.contextPath}/done/'+numberid
            window.location.href=taskLink;
        }
        function delete_task()
        {
            var taskLink= '${paContext.request.contextPath}/deleted/'+numberid
            window.location.href=taskLink;
        }
        </script>
<title><s:message code="menu.mainPage"/></title>
</head>
<body onload="startSerach('${firstTask.name}','${firstTask.description}','${firstTask.countYang}', '${firstTask.comment}', '${firstTask.id}')">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/login.js"></script>
<script src="/resources/javascript/menuapp.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<script type="text/javascript">//<![CDATA[

$(window).load(function(){

    function fade() {
        $('.popupunder').fadeIn().delay(5000).fadeOut();
    }
    fade();
});

//]]></script>

<!------ Include the above in your HEAD tag ---------->
<c:if test = "${not empty message}">
        <div class="popupunder alert alert-success fade in"><button type="button" class="close close-sm" data-dismiss="alert"><i class="glyphicon glyphicon-remove"></i></button><strong>Sukces : </strong> Rejestracja przebiegła pomyślnie, ale Twoje konto nie jest jeszcze aktywne. Na podany email wysłany został link aktywacyjny.</div>
</c:if>
<div class="container">
    <div class="row" style="width:103%">
        <div class="col col-md-3 no-gutter" id="parent" style="white-space:nowrap;  background-color: #2962FF; width:22%">
            <ul class="nav nav-tabs nav-stacked nav-left text-center" role="tablist">
                <li role="presentation" class="active" id="pierwszy"><a class ="pierwszy" href=".dowykonania" aria-controls="home" role="tab" data-toggle="tab">Do wykonania</a></li>
                <li role="presentation"><a class="drugi" href=".wtrakcie" aria-controls="profile" role="tab" data-toggle="tab">W trakcie</a></li>
                <li role="presentation"><a class="trzeci" href=".wykonane" aria-controls="messages" role="tab" data-toggle="tab">Wykonane</a></li>
            </ul>
        </div>
        <div class="col col-md-4" style="white-space:nowrap; border-top:5px solid darkblue; border-bottom:5px solid darkblue;height:100%; width:39%">
            <div class="row tab-content">
                <div class="tab-pane task active in dowykonania">
                    <span>Zadania do wykonania</span>
                </div>
                <div class="tab-pane task fade wtrakcie">
                    <span>Zadania w trakcie</span>
                </div>
                <div class="tab-pane task fade wykonane">
                    <span>Zadania wykonane</span>
                </div>
                <div class="tab-pane dowykonania active in margin">
                    <ul class="nav nav-tabs nav-stacked nav-left text-left" style="margin-left:-15px; width:107%;">
                        <c:forEach var="task" items="${taskToDo }">
                            <li class="list-group-item col-sm-12" onclick="startSerach('${task.name}','${task.description}','${task.countYang}', '${task.comment}', '${task.id}')"><c:out value="${task.name }" /></li>
                            <c:set var="licznik" value="${licznik+1}"/>
                        </c:forEach>
                    </ul>
                </div>
                <div class="tab-pane wtrakcie fade margin">
                    <ul class="nav nav-tabs nav-stacked nav-left text-left" style="margin-left:-15px; width:107%;">
                        <c:forEach var="task" items="${taskInProgress }">
                            <li class="list-group-item col-sm-12" onclick="startSerach('${task.name}','${task.description}','${task.countYang}', '${task.comment}','${task.id}')"><c:out value="${task.name }" /></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="tab-pane wykonane fade margin">
                    <ul class="nav nav-tabs nav-stacked nav-left text-left" style="margin-left:-15px; width:107%;">
                        <c:forEach var="task" items="${taskDone }">
                            <li class="list-group-item col-sm-12" onclick="startSerach('${task.name}','${task.description}','${task.countYang}', '${task.comment}','${task.id}')"><c:out value="${task.name }" /></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col col-md-5" style="white-space:nowrap; height:100%; border:5px solid darkblue;width:39%;">
            <div class="row tab-content">
                    <div class="first tab-pane dowykonania active in">
                        <span id="name"></span>
                    </div>
                    <div class="second tab-pane dowykonania active in" style="margin-top:30px;">
                        <h4>Opis : <span id="errorSearch"></span></h4>
                    </div>
                        <div class="third tab-pane dowykonania active in" style="margin-top:30px;">
                            <h4>Punkty : <span id="yang"></span></h4>
                        </div>
                    <div class="fourth tab-pane dowykonania active in" style="margin-top:30px;">
                        <h4>Komentarz : <span id="comment"></span></h4>
                    </div>
            </div>
            <div class="row tab-content">
                <div class="col col-md-12 tab-pane dowykonania active in pull-bottom">
                    <ul class="list-inline pull-right">
                        <sec:authorize access="hasRole('ROLE_PARENT')">
                        <li><button type="button" class="btn btn-default" onclick="add()">Dodaj</button></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_USER')">
                        <li><button type="button" class="btn btn-default" onclick="doIt()">Wykonaj</button></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_PARENT')">
                        <li><button type="button" class="btn btn-default" data-toggle="modal" onclick="editTask()">Edytuj</button></li>
                        <li><button type="button" class="btn btn-primary " onclick="delete_task()">Usuń</button></li>
                        </sec:authorize>
                    </ul>
                </div>
            <div class="col col-md-12 tab-pane wtrakcie fade pull-bottom">
                <ul class="list-inline pull-right">
                    <sec:authorize access="hasRole('ROLE_PARENT')">
                    <li><button type="button" class="btn btn-default" onclick="add()">Dodaj</button></li>
                    <li><button type="button" class="btn btn-default" onclick="done()">Akceptuj</button></li>
                    <li><button type="button" class="btn btn-default" data-toggle="modal" onclick="">Edytuj</button></li>
                    <li><button type="button" class="btn btn-primary " onclick="delete_task()">Usuń</button></li>
                    </sec:authorize>
                </ul>
            </div>
            <div class="col col-md-12 tab-pane wykonane fade pull-bottom">
                <ul class="list-inline pull-right">
                    <sec:authorize access="hasRole('ROLE_PARENT')">
                    <li><button type="button" class="btn btn-default" onclick="add()">Dodaj</button></li>
                    <li><button type="button" class="btn btn-default" data-toggle="modal" onclick="">Edytuj</button></li>
                    <li><button type="button" class="btn btn-primary " onclick="delete_task()">Usuń</button></li>
                    </sec:authorize>
                </ul>
            </div>
            </div>
        </div>
        </div>
    </div>

</div>
</body>
</html>