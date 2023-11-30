<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>


<center><h2 class="title">공지사항</h2></center>
<center><div class="desc">
<p class="txt">누리끼리의 소식을 안내해 드립니다.</p>
</div></center>
			


<%@include file="../board/search_bar.jsp"%>






<div class="mx-5">
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 80px">No</th>
			<th>제목</th>
			<th style="width: 120px">등록일</th>
			<th style="width: 125px">작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td><a class="move" href="${cri.getLinkWithBno('get', board.bno)}">${board.title}</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.regDate}" /></td>
				<td>${board.writer}</td>
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
</div>


	                                            

<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>