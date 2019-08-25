<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&amp;subset=latin-ext" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/menuapp.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>

<title><s:message code="menu.register"/></title>
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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/resources/javascript/login.js"></script>
<%@include file="/WEB-INF/incl/menu.app"%>
<div style="margin-top:50px;" class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="/resources/images/logo.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="adduser" modelAttribute="user" enctype="multipart/form-data" method="POST">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="name" name="name" path="name" class="form-control" placeholder="Imię" required>
                <input type="text" id="lastName" name="lastName" path="lastName" class="form-control" placeholder="Nazwisko" required>
                <input type="email" id="email" name="email" class="form-control" placeholder="Adres email" required autofocus>
                <input type="password" id="password" name ="password" path ="password" class="form-control" placeholder="Hasło" required>
                <div class="wrapper">
                    <div class="currency">
                <select class="selectpicker" path="nrRoli" name="nrRoli" id="nrRoli" data-style="btn-info" style="width: 100%">
                        <option value="0">Dziecko</option>
                        <option value="1">Rodzic</option>
                </select>
                    </div>
                </div>
                <div class="wrapper2">
                    <div class="currency2">
                <select id="id_select2_example" class="form-control" path="path" name="path" style="width: 180px;">
                    <option value="/resources/images/avatars/boy_1.png"data-img_src="/resources/images/avatars/boy_1.png"></option>
                    <option value="/resources/images/avatars/girl_1.png"data-img_src="/resources/images/avatars/girl_1.png"></option>
                    <option value="/resources/images/avatars/boy_2.png"data-img_src="/resources/images/avatars/boy_2.png"></option>
                    <option value="/resources/images/avatars/girl_2.png"data-img_src="/resources/images/avatars/girl_2.png"></option>
                    <option value="/resources/images/avatars/boy_3.png"data-img_src="/resources/images/avatars/boy_3.png"></option>
                    <option value="/resources/images/avatars/girl_3.png"data-img_src="/resources/images/avatars/girl_3.png"></option>
                    <option value="/resources/images/avatars/boy_4.png"data-img_src="/resources/images/avatars/boy_4.png"></option>
                    <option value="/resources/images/avatars/girl_4.png"data-img_src="/resources/images/avatars/girl_4.png"></option>
                    <option value="/resources/images/avatars/boy_5.png"data-img_src="/resources/images/avatars/boy_5.png"></option>
                    <option value="/resources/images/avatars/girl_5.png"data-img_src="/resources/images/avatars/girl_5.png"></option>
                    <option value="/resources/images/avatars/boy_6.png"data-img_src="/resources/images/avatars/boy_6.png"></option>
                </select>
                    </div>
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
                            template = $("<div><img src=\"" + img_src + "\" style=\"margin-left:20px;margin-top:5px;width:90px;height:90px;\"/><p style=\"color:black; font-weight: 400;font-size:12pt;text-align:center;\">" + text + "</p></div>");
                            return template;
                        }
                    }
                    var options = {
                        'templateSelection': custom_template,
                        'templateResult': custom_template };

                    $('#id_select2_example').select2(options);
                    $('.select2-container--default .select2-selection--single').css({ 'height': '120px','margin-bottom':'10px' });
                    //# sourceURL=pen.js
                </script>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Zarejestruj się</button>
                <button class="btn btn-lg btn-primary btn-block btn-signin" onclick="window.location.href='${pageContext.request.contextPath}/'"/>Zrezygnuj</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->

</body>
</html>
