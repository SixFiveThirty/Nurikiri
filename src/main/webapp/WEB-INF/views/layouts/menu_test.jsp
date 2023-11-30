<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Menu desktop -->
<div class="menu-desktop">
	<ul class="main-menu">
		<li><a href="/board/list">공지사항</a></li>
		<li class="label1" data-label1="hot"><a href="/store/list">가맹점찾기</a></li>
		<li><a href="/introduction/get">서비스소개</a></li>
		<li><a href="/managers/managers_list">관리자</a></li>
	</ul>
</div>