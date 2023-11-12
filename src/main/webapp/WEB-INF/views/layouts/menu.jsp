<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
#menulink {
	color: #000000;
	font-weight : bold;
}
</style>

<!-- <nav class="navbar navbar-expand-md bg-primary navbar-dark sticky-top"> -->
<nav class="navbar navbar-expand-md navbar-dark sticky-top">
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<!-- 좌측 메뉴 구성 -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link mx-2" id="menulink" href="#">
				공지사항
			</a></li>
			<li class="nav-item nav-link" id="menulink">|</li>
			<li class="nav-item"><a class="nav-link mx-2" id="menulink" href="/store/list">
				가맹점 찾기
			</a></li>
			<li class="nav-item nav-link" id="menulink">|</li>
			<li class="nav-item"><a class="nav-link mx-2" id="menulink" href="#">서비스 소개</a></li>
			<li class="nav-item nav-link" id="menulink">|</li>
			<li class="nav-item"><a class="nav-link mx-2" id="menulink" href="/recommend/editor/list">에디터</a></li>
			<li class="nav-item nav-link" id="menulink">|</li>
			<li class="nav-item"><a class="nav-link mx-2" id="menulink" href="/managers/managers_list">관리자</a></li>
		</ul>
		<!-- 우측 메뉴 -->
		<ul class="navbar-nav ml-auto">
			<%@ include file="../common/search_bar.jsp" %>
		</ul>
	</div>
</nav>