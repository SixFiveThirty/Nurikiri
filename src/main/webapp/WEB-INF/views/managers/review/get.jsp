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

<style>
.top-div {
	display: flex;
	width: 100%;
}

.card {
	border-color: #c3cad1;
}

.card:nth-child(1) {
	flex-grow: 1;
	height: 300px;
}

.card:nth-child(2) {
	flex-grow: 1.5;
	height: 300px;
}
/* .btn-details {width: 300px;} */
.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}
</style>

<div class="container">
	<h3>리뷰 1</h3>
	<div class="top-div mt-5">
		<div class="card">
			<img src="..." class="card-img-top" alt="..." />
		</div>
	</div>
	<div class="mid-div mt-5">
		<div class="card">
			<p>내용</p>
		</div>
	</div>
	<div class="foot-div mt-5">
		<button type="button" class="btn btn-danger remove mr-5" style="width: 200px" onclick="location.href='modify'">삭제</button>
		<button type="button" class="btn btn-light" style="width: 200px" onclick="location.href='list'">목록</button>
	</div>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="rno" value="${review.rno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%@ include file="../../layouts/footer.jsp"%>