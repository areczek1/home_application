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
    <title><s:message code="menu.viewaward"/></title>

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
<h1><s:message code="menu.nagrody"/></h1>
<c:set var="licznik" value="${recordStartCounter }"/>
<div align="center">
    <div style="margin-top:100px;" class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">

                <div class="panel panel-default panel-table">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-xs-6">
                                <h3  style="text-align:center;" class="panel-title">Lista nagród</h3>
                            </div>
                            <sec:authorize access="hasRole('ROLE_USER')">
                            <div class="col col-xs-6">
                                <h3  style="text-align:center;" class="panel-title">Punkty: <c:out value="${points }" /></h3>
                            </div>
                            </sec:authorize>

                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-list">
                            <thead>
                            <tr>
                                <th><em class="fa fa-cog"></em></th>
                                <th class="hidden-xs">Id</th>
                                <th>Ikona</th>
                                <th>Nazwa</th>
                                <th>Punkty</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="awards" items="${awardsList }">
                                <c:set var="licznik" value="${licznik+1}"/>
                                <tr>
                                    <td align="center">
                                        <sec:authorize access="hasRole('ROLE_PARENT')">
                                    <a href="editaward/${awards.id }" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span></a>
                                        <a class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
                                        </sec:authorize>
                                        <sec:authorize access="hasRole('ROLE_USER')">
                                        <a a href="/choiceaward/${awards.id }" class="btn btn-info"><span class="glyphicon glyphicon-ok-circle"></span></a>
                                        </sec:authorize>
                                    </td>
                                    <td class="hidden-xs"><c:out value="${awards.id }" /></a></td>
                                    <td><img height="50px" width="50px" src="<c:out value="${awards.path}"/>"/></td>
                                    <td><c:out value="${awards.name }" /></a></td>
                                    <td><c:out value="${awards.count }" /></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col col-xs-4"><table width="1000" border="0" cellpadding="6" cellspacing="0" bgcolor="#ffddcc">
                                <tr>
                                    <td width="300" align="left">
                                        <s:message code="info.page"/> ${currentPage} <s:message code="info.from"/> ${totalPages}
                                    </td>
                                    <td align="right">
                                        <c:if test="${currentPage > 1}">
                                            <input type="button"
                                                   onclick="window.location.href='${pageContext.request.contextPath}/viewaward/${currentPage - 1}'"
                                                   value="<s:message code="link.poprzedni"/>"/>&nbsp;&nbsp;
                                        </c:if>

                                        <c:if test="${currentPage < totalPages}">
                                            <input type="button"
                                                   onclick="window.location.href='${pageContext.request.contextPath}/viewaward/${currentPage + 1}'"
                                                   value="<s:message code="link.nastepny"/>"/>
                                        </c:if>

                                    </td>
                                </tr>
                            </table>
                            </div>
                        </div>
                    </div>

                </div></div></div>
    </div>
</div>
</body>
</html>