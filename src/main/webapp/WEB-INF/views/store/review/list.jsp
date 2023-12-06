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
<h1 class="my-5" style="text-align: center">리뷰 관리</h1>

<div class="container">
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