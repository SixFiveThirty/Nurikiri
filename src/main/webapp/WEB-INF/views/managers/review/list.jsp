<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>

<!-- <script>
//리뷰 기본 URL 상수 - 전역 상수
/* const REVIEW_URL = '/api/managers/${param.rno}/review/'; */

$(document).ready(async function() {
	$('.remove').click(function() {
		if (!confirm('정말 삭제할까요?'))
			return;
		document.forms.removeForm.submit();
	});
	
	let rno = 0;
	let table = document.getElementById('listTable');
	let rowList = table.rows;
	
	for(i=1; i<rowList.length; i++) {	//thread 부분 제외.
		let row = rowList[i];
		let tdsNum = row.childElementCount; //자식요소 갯수 구하기
		rno = row.cells[0].innerHTML;
	}
	
	let writer = '${member.username}'; //작성자(로그인 유저)
	
	const REVIEW_URL = '/api/store/{sno}/review'; //전역상수(리뷰 기본 URL 상수임.)
	
	loadReviews(sno, writer);
});
</script> -->
<<<<<<< HEAD
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/store/review/list_test.jsp
>>>>>>> 2390e88bb2a189b42a6d89f68b492e6b06ba812b
<style>
.column-1 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.gi {
	display: flex;
}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>

<div class="container">

	<h1 style="text-align: center">리뷰 관리</h1>
	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">

		<!-- <div class="row"> -->

		<div class="col-lg-12 col-xl-9 m-lr-auto m-b-50">
			<div class="gi">
				<%@ include file="search_bar.jsp"%>
			</div>

			<div>
				<div class="wrap-table-shopping-cart">

					<table class="table-shopping-cart">

						<tr class="table_head">
							<th class="column-1">NO</th>
							<th class="column-1">가맹점 번호</th>
							<th class="column-1">가맹점 상호명</th>
							<th class="column-1">리뷰 내용</th>
							<th class="column-1">작성자</th>
							<th class="column-1">작성일자</th>
						</tr>

						<c:forEach var="review" items="${list}">
								<tr class="table_row">
									<td class="column-1">${review.rno}</td>
									<td class="column-1">${review.sno}</td>
									<td class="column-1">${review.title}</td>
									<td class="column-1">${review.content}</td>
									<td class="column-1">${review.writer}</td>
									<td class="column-1"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}" /></td>
								</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</form>
<<<<<<< HEAD
=======
========




<div class="container">
	<h1 class="my-5" style="text-align: center">리뷰 관리</h1><br><br>
		<div class="mx-5">
		<%@include file="../review/search_bar.jsp"%>
		
		<table class="table table-striped table-hover" id="listTable">
			<thead>
				<tr>
					<th style="text-align: center; width: 60px;">No</th>
					<th style="text-align: center; width: 150px;">가맹점 번호</th>
					<th style="text-align: center;">리뷰 내용</th>
					<th style="text-align: center; width: 100px;">작성자</th>
					<th style="text-align: center; width: 150px;">작성일자</th>
					<!-- <th style="text-align: center; width: 100px;">리뷰 삭제</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${list}">
					<tr>
						<td style="text-align: center; width: 60px;">${review.rno}</td>
						<td style="text-align: center; width: 150px;">${review.sno}</td>
						<td style="text-align: center;"><a href="get?rno=${review.rno}"> ${review.content} </a></td>
						<td style="text-align: center; width: 150px;">${review.writer}</td>
						<td style="text-align: center; width: 100px;"><fmt:formatDate
								pattern="yyyy.MM.dd" value="${review.regDate}" /></td>
						<%-- <td><button type="button" class="btn btn-danger remove" style="width: 100px" onclick="location.href='remove&sno=${review.sno}'">삭제</button> --%>
						<!-- <td><button type="button" class="btn btn-danger remove" style="width: 100px" onclick="delete()">삭제</button> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
>>>>>>>> 2390e88bb2a189b42a6d89f68b492e6b06ba812b:src/main/webapp/WEB-INF/views/managers/review/list.jsp
>>>>>>> 2390e88bb2a189b42a6d89f68b492e6b06ba812b
</div>

<%-- <form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="hidden" name="sno" value="${review.sno}" /> 
	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${cri.amount}" /> 
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form> --%>

<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>