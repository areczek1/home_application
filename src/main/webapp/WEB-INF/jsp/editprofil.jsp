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
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.css'>
    <script>
        window.console = window.console || function(t) {};
    </script>
    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>
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
                                <i class="fa fa-pencil-square-o fa-3x"></i>
                            </li>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-lock fa-3x"></i>
                            </li>
                            <li class="icon-holder dsp-flex">
                                <i class="fa fa-file-image-o fa-3x"></i>
                            </li>
                        </ul>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <sf:input path="name" name="name" id="name" type="text" size="28" class="form-control" placeholder="Imię..."  minLength="3" required="required"/>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <sf:input path="lastName" name="lastName" id="lastName" size="28" type="text" placeholder="Nazwisko..." class="form-control" minLength="3" required="required"/>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope "></i></span>
                            <sf:input path="email" name="email" id="email" size="28" type="email" class="form-control" placeholder="Email..." required="required"/>
                        </div>
                        <div class="input-group input-group-select">
                            <span class="ikona">Zmień awatara: </span>
                                <select id="id_select2_example" data-minimum-results-for-search="Infinity" class="form-control" path="path" name="path" style="width: 180px;">
                                    <option value="/resources/images/avatars/boy_1.png"data-img_src="/resources/images/avatars/boy_1.png"></option>
                                    <option value="/resources/images/avatars/girl_1.png"data-img_src="/resources/images/avatars/girl_1/png"></option>
                                    <option value="/resources/images/avatars/boy_2.png"data-img_src="/resources/images/avatars/boy_2.png"></option>
                                    <option value="/resources/images/avatars/girl_2.png"data-img_src="/resources/images/avatars/girl_2.png"></option>
                                    <option value="/resources/images/avatars/boy_3.png"data-img_src="/resources/images/avatars/boy_3.png"></option>
                                    <option value="/resources/images/avatars/girl_3.png"data-img_src="/resources/images/avatars/girl_3.png"></option>
                                    <option value="/resources/images/avatars/boy_4.png"data-img_src="/resources/images/avatars/boy_4.png"></optitars/girl_1.png"></option>on>
                                    <option value="/resources/images/avatars/girl_4.png"data-img_src="/resources/images/avatars/girl_4.png"></option>
                                    <option value="/resources/images/avatars/boy_5.png"data-img_src="/resources/images/avatars/boy_5.png"></option>
                                    <option value="/resources/images/avatars/girl_5.png"data-img_src="/resources/images/avatars/girl_5.png"></option>
                                    <option value="/resources/images/avatars/boy_6.png"data-img_src="/resources/images/avatars/boy_6.png"></option>
                                </select>
                        </div>
                        <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.js'></script>
                        <script id="rendered-js">
                            function custom_template(obj) {
                                var data = $(obj.element).data();
                                var text = $(obj.element).text();
                                if (data && data['img_src']) {
                                    img_src = data['img_src'];
                                    template = $("<div><img src=\"" + img_src + "\" style=\"margin-left:30px;margin-top:5px;width:90px;height:90px;\"/><p style=\"color:black; font-weight: 400;font-size:12pt;text-align:center;\">" + text + "</p></div>");
                                    return template;
                                }
                            }
                            var options = {
                                'templateSelection': custom_template,
                                'templateResult': custom_template };

                            $('#id_select2_example').select2(options);
                            $('.select2-container--default .select2-selection--single').css({ 'height': '120px','margin-bottom':'10px', 'background-color' : '#324571' });
                            //# sourceURL=pen.js
                        </script>
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