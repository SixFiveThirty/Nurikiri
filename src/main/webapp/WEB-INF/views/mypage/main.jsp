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
<style>
.card {
	border-color: #c3cad1;
	width: 400px;
	margin: 0 auto;
}
</style>
<h1 style="text-align: center">마이 페이지</h1>
<div class="container">

	<div class="top-div mt-5">

		<div class="card">
			<a href="/mypage/review" class="btn btn-light"> <i
				class="fa-solid fa-comment"></i> 리뷰 관리
			</a>
		</div>
		<br> <br>
		<div class="card">
			<a href="/mypage/favorit" class="btn btn-light"><i
				class="fa-solid fa-star"></i> 즐겨찾기 </a>
		</div>
		<br>

	</div>

</div>

<%@ include file="../layouts/footer.jsp"%>