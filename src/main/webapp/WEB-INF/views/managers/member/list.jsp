<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../layouts/header.jsp"%>

<h1 class="page-header">
	<i class="fas fa-list"></i> 게시글 목록
</h1>

<%@ include file="../../common/search_bar.jsp"%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 130px">유저 ID</th>
			<th style="width: 130px">유저 닉네임</th>
			<th>유저권한</th>
			<th style="width: 130px">가입날짜</th>
			<th style="width: 130px">회원정보 수정</th>
			<th style="width: 130px">회원정보 삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="member" items="${list}">
			<tr>
				<td>${member.username}</td>
				<td>${member.name}</td>
				<td>${member.authList}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${member.regDate}" /></td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
	</tbody>


	<%@ include file="../../common/pagination.jsp"%>

	<%@ include file="../../layouts/footer.jsp"%>

</table>