 <div class="navbar navbar-default" data-spy="affix" id="navbar">
    <div class="cont">
    <div class="col-md-3 col-xs-12 col-sm-12">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand holder navbar-left" href="#"><i aria-hidden="true">HomeManagement</i></a>
      </div>
      </div>
      <div class="col-md-9 col-xs-12 col-sm-12">
      <div class="collapse navbar-collapse holder nav-collapse" id="navbarSupportedContent">
        <ul class="nav nav-pills navbar-right align-items-center">

          <sec:authorize access="hasRole('ANONYMOUS')">
          <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span><s:message code="menu.login"/></a></li>
          <li><a href="/register"><span class="glyphicon glyphicon-user"></span><s:message code="menu.register"/></a></li>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <li>
             <a href="/"><span class="glyphicon glyphicon-home"></span><s:message code="menu.mainPage"/></a>
          </li>
          <sec:authorize access="hasRole('ROLE_USER')">
             <li><a href="/viewaward""><span class="glyphicon glyphicon-piggy-bank"></span><s:message code="menu.pickPrize"/></a></li>
             <li><a href="/members"><img src="/resources/images/users.png" id="itemImg"><s:message code="menu.members"/></a></li>
             <li><a href="/calendar"><span class="glyphicon glyphicon-calendar"></span><s:message code="menu.calendar"/></a></li>
             <li><a href="/mychosenaward" class="dropdown-item"><s:message code="menu.chosenaward"/></a></li>

          </sec:authorize>
          <sec:authorize access="hasRole('ROLE_PARENT')">
              <li class="dropdown">
               <a href="#" class="dropdown-item" data-toggle="dropdown"><span class="glyphicon glyphicon-piggy-bank"></span><s:message code="menu.prizes"/><span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="/addaward" class="dropdown-item"><s:message code="menu.addaward"/></a></li>
                  <li><a href="/viewaward" class="dropdown-item"><s:message code="menu.awardList"/></a></li>
                  <li><a href="/chosenaward" class="dropdown-item"><s:message code="menu.chosenaward"/></a></li>
                </ul>
              </li>
              <li><a href="/searchmembers/1"><img src="/resources/images/users.png" id="itemImg"><s:message code="menu.searchMembers"/></a></li>
              <li><a href="/calendar"><span class="glyphicon glyphicon-calendar"></span><s:message code="menu.calendar"/></a></li>
          </sec:authorize>

          <li><a href="/profil"><img src="/resources/images/user_circle.png" id="itemImg"><s:message code="menu.profil"/></a></li>
          </sec:authorize>
          <sec:authorize access="hasRole('ROLE_PARENT')">
          <li class="dropdown">
            <a href="#" class="dropdown-item" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span><s:message code="menu.adminPage"/><span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
             <li><a href="/addtask" class="dropdown-item"><s:message code="menu.addtask"/></a></li>
            </ul>
          </li>
          </sec:authorize>
           <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="dropdown">
                      <a href="#" class="dropdown-item" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span><s:message code="menu.adminPage"/><span class="caret"></span></a>
                      <ul class="dropdown-menu" role="menu">
                       <li><a href="/admin/users/1" class="dropdown-item"><s:message code="menu.users"/></a></li>
                      </ul>
                    </li>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span><s:message code="menu.logout"/></a></li>
          </sec:authorize>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
    </div>
  </div>
