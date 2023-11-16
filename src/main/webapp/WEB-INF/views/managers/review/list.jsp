<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script>
	const COMMENT_URL = '/api/managers/review/${param.rno}/comment/'; //전역상수(댓글 기본 URL 상수임.)
	const REPLY_URL = '/api/managers/review/${param.rno}/reply/';
	
$(document).ready(async function() {
		$('.remove').click(function() {
			if (!confirm('정말 삭제할까요?'))
				return;
			document.forms.removeForm.submit();
		});
		
		// 삭제 버튼 클릭
		$('.comment-list').on('click', '.comment-delete-btn', deleteComment);
		
		$('.comment-list').on('click', '.reply-add-show-btn', function(e) {
			showReplyAdd($(this), writer);
		});
		
		$('.comment-list').on('click', '.reply-add-btn', function(e) {
			addReply($(this), writer);
		});
		
});
</script>

<h1 style="text-align: center">리뷰 관리</h1>

<div class="container">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="text-align: center; width: 60px;">No</th>
				<th style="text-align: center;">리뷰 내용</th>
				<th style="text-align: center; width: 100px;">작성자</th>
				<th style="text-align: center; width: 150px;">작성일자</th>
				<th style="text-align: center; width: 100px;">리뷰 삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="review" items="${list}">
				<tr>
					<td style="text-align: center; width: 60px;">${review.rno}</td>
					<td style="text-align: center;"><a href="get?rno=${review.rno}"> ${review.content} </a></td>
					<td style="text-align: center; width: 150px;">${review.writer}</td>
					<td style="text-align: center; width: 100px;"><fmt:formatDate pattern="yyyy.MM.dd" value="${review.regDate}" /></td>
					<td><button type="button" class="btn btn-danger remove" style="width: 100px">삭제</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="rno" value="${review.rno}" /> <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input type="hidden" name="amount" value="${cri.amount}" /> <input type="hidden" name="type" value="${cri.type}" /> <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>