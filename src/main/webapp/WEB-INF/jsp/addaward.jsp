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
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/addaward.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/modalalert.css" />
    <title><s:message code="award.pageName"/></title>
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
<body style="color:white; background-color:white ">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
<c:if test = "${not empty message_award}">
    <div class="popupunder alert alert-success fade in"><button type="button" class="close close-sm" data-dismiss="alert"><i class="glyphicon glyphicon-remove"></i></button><strong>Sukces : </strong> Dodanie nagrody przebiegło pomyślnie. Możesz je edytować w zakładce nagrody.</div>
</c:if>
<div class="container-fluid stylish-form">
    <div class="row mar20">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="inner-section">
                <sf:form class="form-signin" action="addnewaward" modelAttribute="award" enctype="multipart/form-data" method="POST">
                    <div class="mar20 inside-form">
                        <h2 class="font_white text-center">Dodawanie nagrody</h2>
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
                            <input type="text" class="form-control" path="name"  name="name" placeholder="Nazwa nagrody..">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil "></i></span>
                            <input type="number" class="form-control" path="count" name="count" placeholder="Koszt nagrody..">
                        </div>
                        <div class="input-group-select">
                            <span class="ikona">Dodaj ikonę: </span>
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
                            <input type="submit" class="btn btn-neutral btn-round btn-lg left" value="<s:message code="button.addaward"/>"
                                   onclick="window.location.href='${pageContext.request.contextPath}/addaward'"/>
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