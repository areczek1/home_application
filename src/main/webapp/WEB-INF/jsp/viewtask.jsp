<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title><s:message code="viewTasks.pageName"/></title>

    <script type="text/javascript">
        function changeTrBg(row){
            row.style.backgroundColor = "#e6e6e6";
        }
        function defaultTrBg(row){
            row.style.backgroundColor = "white";
        }
    </script>
</head>
<body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/resources/javascript/login.js"></script>
<%@include file="/WEB-INF/incl/menu.app"%>
<c:set var="licznik" value="${recordStartCounter }"/>
<div align="center">
    <div style="margin-top:100px;" class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">

                <div class="panel panel-default panel-table">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-xs-6">
                                <h3  style="text-align:center;" class="panel-title">Lista zadań</h3>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-list">
                            <thead>
                            <tr>
                                <th class="hidden-xs">Id</th>
                                <th>Nazwa</th>
                                <th>Punkty</th>
                                <th>Stan</th>
                                <th>Data</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="u" items="${tasksList }">
                                <c:set var="licznik" value="${licznik+1}"/>
                                <tr>
                                    <td align="center">
                                        <a href="edittask/${task.id }" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span></a>
                                        <a class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
                                    </td>
                                    <td class="hidden-xs"><c:out value="${task.id }" /></td>
                                    <td><c:out value="${task.name }"/></td>
                                    <td><c:out value="${task.countYang }"/></td>
                                    <c:choose>
                                        <c:when test="${task.state = 1}">
                                            <td>Do zrobienia</td>
                                        </c:when>
                                        <c:when test="${task.state = 2}">
                                            <td>W trakcie</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Wykonane</td>
                                        </c:otherwise>
                                    </c:choose><c:out value="${task.state }"/></a></td>
                                    <td><c:out value="${task.dueDate}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>

                </div></div></div>
    </div>
    </div>
</body>
</html>