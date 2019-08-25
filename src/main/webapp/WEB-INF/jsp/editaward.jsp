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
    <link rel="stylesheet" type="text/css" href="/resources/css/editaward.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <title><s:message code="profilEdit.pageName"/></title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.css'>
    <script>
        window.console = window.console || function(t) {};

        function add(id)
        {
            var awardLink= '${paContext.request.contextPath}/updateaward/'+id;
            window.location.href=awardLink;
        }
    </script>
    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>
</head>
<body style="color:white;">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<%@include file="/WEB-INF/incl/menu.app" %>
<script src="https://use.fontawesome.com/1dec14be15.js"></script>
<div class="container-fluid stylish-form">
    <div class="row mar20">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="inner-section">
                <sf:form class="form-signin" action="/updateaward/${awards.id}" modelAttribute="awards" enctype="multipart/form-data" method="POST">
                    <div class="mar20 inside-form">
                        <h2 class="font_white text-center">Edycja nagrody</h2>

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
                            <sf:input type="text" name="name" path="name" id="name" size="28" class="form-control input-lg" placeholder="Nazwa nagrody..." />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <sf:input type="number" name="count" path="count" id="count" size="28" class="form-control input-lg" placeholder="Liczba punktów.."/>
                        </div>
                        <div class="input-group-select">
                            <span class="ikona">Edytuj ikonę: </span>
                            <select id="id_select2_example" path="path" name="path" style="width: 180px; margin-left:auto; margin-right:auto">
                                <option value="/resources/images/awards/bilety.png"data-img_src="/resources/images/awards/bilety.png">Bilety</option>
                                <option value="/resources/images/awards/burger.png"data-img_src="/resources/images/awards/burger.png">Burgery</option>
                                <option value="/resources/images/awards/cyrk.png"data-img_src="/resources/images/awards/cyrk.png">Rozrywka</option>
                                <option value="/resources/images/awards/gra.png"data-img_src="/resources/images/awards/gra.png">Gra</option>
                                <option value="/resources/images/awards/pilka.png"data-img_src="/resources/images/awards/pilka.png">Piłka</option>
                                <option value="/resources/images/awards/prezent.png"data-img_src="/resources/images/awards/prezent.png">Prezent</option>
                                <option value="/resources/images/awards/samolot.png"data-img_src="/resources/images/awards/samolot.png">Samolot</option>
                                <option value="/resources/images/awards/telefon.png"data-img_src="/resources/images/awards/telefon.png">Telefon</option>
                            </select>
                            <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
                            <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
                            <script src='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.js'></script>
                            <script id="rendered-js">
                                function custom_template(obj) {
                                    var data = $(obj.element).data();
                                    var text = $(obj.element).text();
                                    if (data && data['img_src']) {
                                        img_src = data['img_src'];
                                        template = $("<div><img src=\"" + img_src + "\" style=\"margin-left:35px;margin-top:5px;width:85px;height:85px;\"/><p style=\"color:black; font-weight: 400;font-size:12pt;text-align:center;\">" + text + "</p></div>");
                                        return template;
                                    }
                                }
                                var options = {
                                    'templateSelection': custom_template,
                                    'templateResult': custom_template };

                                $('#id_select2_example').select2(options);
                                $('.select2-container--default .select2-selection--single').css({ 'height': '120px' });
                                //# sourceURL=pen.js
                            </script>
                        </div>
                    <div class="footer text-center">
                        <input type="submit" class="btn btn-neutral btn-round btn-lg left" value="<s:message code="button.save"/>" />

                        <li><button type="button" class="btn btn-default" onclick="add(${awards.id})">Dodaj</button></li>

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