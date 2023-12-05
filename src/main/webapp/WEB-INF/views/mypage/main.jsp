<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>
<script src="/resources/js/rest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js">
	
</script>
<script src="/resources/js/comment.js"></script>
<script src="/resources/js/reply.js"></script>
<script>
$(document).ready(async function() {

	$('.getbook').click(function(){
		document.forms.removeForm.submit();
	});
});
</script>

<style>
.card {
	border-color: #c3cad1;
	width: 400px;
	margin: 0 auto;
}
</style>


<h1 style="text-align: center">${member.username}마이 페이지</h1>
<div class="container">

	<div class="top-div mt-5">

		<div class="card">
			<a href="/mypage/reviews" class="btn btn-light"> <i
				class="fa-solid fa-comment"></i> 리뷰 관리
			</a>
		</div>
		<br> <br>
		<div class="card">
			<a type="submit" href="/mypage/bookmarks" class="btn btn-light getbook"><i
				class="fa-solid fa-star"></i> 즐겨찾기 </a>
		</div>
		<br>

	</div>
</div>

<form action="main" method="post" name="mybookmarkForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="username" value="${member.username}" /> 
</form>

<%@ include file="../layouts/footer.jsp"%>


<%-- <form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="hidden" name="sno" value="${review.sno}" /> 
	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${cri.amount}" /> 
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form> --%>