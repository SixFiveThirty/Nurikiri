<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>

<br><br><h1 class="ml-5 mb-5">
	 공지사항 목록
</h1>

<%@include file="../board/search_bar.jsp"%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 60px">No</th>
			<th>제목</th>
			<th style="width: 110px">작성자</th>
			<th style="width: 125px">등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td><a class="move" href="${cri.getLinkWithBno('get', board.bno)}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.regDate}" /></td>
			</tr>
		</c:forEach>
	</tbody>

</table>

<sec:authorize access="hasRole('MANAGER')">
<div class="text-right mr-3">
	<a href="register" class="btn btn-primary"> <i class="far fa-edit"></i>글쓰기
	</a>
</div>
</sec:authorize>


<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>