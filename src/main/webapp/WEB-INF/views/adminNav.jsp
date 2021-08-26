<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar header-navbar pcoded-header">

    <div class="navbar-wrapper">
        <div class="navbar-logo">
        	<a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
        		<i class="ti-menu"></i>
       		</a>
       		UFO
        </div>
        <div class="navbar-container container-fluid">
            <ul class="nav-left">
            <li>
                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a>
                </div>
            </li>
            </ul>
            
            <ul class="nav-right">
            <li class="header-notification" >
         
                <a href="#!" class="waves-effect waves-light">

                    <i class="ti-bell"></i>
                    <c:if test="${!empty returnList or !empty lateList}">
                    <span class="badge bg-c-red"></span>
                    </c:if>
                </a>
                <ul class="show-notification" style="overflow:auto; overflow-y: scroll; max-height: 500px;">
                <li>
                    <h6 style="font-weight: bold;">반납 요청</h6>
                    <hr>
                </li>
                    
                <c:choose>

					<c:when test="${empty returnList}"> 
						<li>반납 요청 건이 존재하지 않습니다.<br></li>
						
					</c:when>
				
					<c:when test="${!empty returnList}">
					<c:forEach var="ret" items="${returnList}">
                		<li class="waves-effect waves-light" onclick="location.href='/admin/rent/rentDetail/${ret.r_id }'">
                    	<div class="media">
                        <div class="media-body">
                        <h5 class="notification-user">${ret.r_mid}</h5>
                        <p class="notification-msg">${ret.r_pid}&nbsp;${ret.p_name}<label class="label label-warning">반납 요청</label></p>
                        </div>
                    	</div>
                		</li>
                	</c:forEach>
					</c:when>
	
				</c:choose>


                 <li>
                    <h6 style="font-weight: bold;">연체 알림</h6>
                    <hr>
                </li>
                <c:choose>
                <c:when test="${empty lateList}"> 
						<li>연체 건이 존재하지 않습니다.<br></li>
						<br>
						
					</c:when>
					
					<c:when test="${!empty lateList}">
					<c:forEach var="late" items="${lateList}">
                <li class="waves-effect waves-light" onclick="location.href='/admin/rent/rentDetail/${late.r_id }'">
                    <div class="media">
                        <div class="media-body">
                            <h5 class="notification-user">${late.r_mid}</h5>
                            <p class="notification-msg">${late.r_pid}&nbsp;${late.p_name}<label class="label label-danger">연 체  중</label></p>
                            <fmt:parseDate var="tempToday" value="${late.r_sdate}" pattern="yyyy-MM-dd"/>
  						<fmt:parseNumber var="sdate" value="${tempToday.time / (1000*60*60*24)}" integerOnly="true"/>
   						<c:set var="now" value="<%=new java.util.Date()%>" />
    					<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
                            <span class="notification-time">${(sdate+3)-today}일 째 연체 중</span>
                        </div>
                    </div>
                </li>
                </c:forEach>
					</c:when>
	
				</c:choose>
                
                </ul>
            </li>
            <li>
             <a class="waves-effect waves-light" onclick="location.href='/admin/rent/Findreturnlate'">
			<i class="fa fa-refresh reload-card"></i>
                </a>
            </li>
            <li id="logout" class="user-profile header-notification"><a href="/adminLogout">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>

