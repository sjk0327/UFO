<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse"
				href="#!"> <i class="ti-menu"></i>
			</a> UFO
		</div>
		<div class="navbar-container container-fluid">
			<ul class="nav-left">
				<li>
					<div class="sidebar_toggle">
						<a href="javascript:void(0)"><i class="ti-menu"></i></a>
					</div>
				</li>
			</ul>

			<ul class="nav-right">
				<li class="header-notification"><a href="#!"
					class="waves-effect waves-light"> <i class="ti-bell"></i> <c:if
							test="${!empty returnList}">
							<span class="badge bg-c-red"></span>
						</c:if>
				</a>
					<ul class="show-notification">
						<li>
							<h6>반납 요청 및 연체 알림</h6>

						</li>

						<c:forEach var="ret" items="${returnList}">
							<c:if test="${ret.r_state eq '반납 요청'}">
								<li class="waves-effect waves-light"
									onclick="location.href='/admin/rent/rentDetail/${ret.r_id }'">
									<div class="media">
										<div class="media-body">
											<h5 class="notification-user">${ret.r_mid}</h5>
											<p class="notification-msg">${ret.r_pid}&nbsp;${ret.p_name}<label
													class="label label-warning">반납 요청</label>
											</p>
											<span class="notification-time">30 minutes ago</span>
										</div>
									</div>
								</li>

							</c:if>
						</c:forEach>
						<c:forEach var="ret" items="${returnList}">
							<c:if test="${ret.r_state eq '대여중'}">
								<li class="waves-effect waves-light"
									onclick="location.href='/admin/rent/rentDetail/${ret.r_id }'">
									<div class="media">
										<div class="media-body">
											<h5 class="notification-user">${ret.r_mid}</h5>
											<p class="notification-msg">${ret.r_pid}&nbsp;${ret.p_name}<label
													class="label label-danger">연 체 중</label>
											</p>
											<span class="notification-time">30 minutes ago</span>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul></li>
				<li><a class="waves-effect waves-light"
					onclick="location.href='/admin/rent/Findreturnlate'"> <i
						class="fa fa-refresh reload-card"></i>
				</a></li>
				<li id="logout" class="user-profile header-notification"><a href="/adminLogout">로그아웃</a></li>
			</ul>
		</div>
	</div>
</nav>

