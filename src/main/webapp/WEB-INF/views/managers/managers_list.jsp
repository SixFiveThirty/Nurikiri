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
	width: 400px;
	outline: none;
	margin: 0 auto;
	border : none;
}


.btn1 {
  border: 0;
  outline: none;
  font-size: 15px;
  margin: 10px;
  background: #CCCCCC;
  color: black;
  cursor: pointer;
  border-radius: 20px;
  border : none;
  text-align: center;
  padding: 10px 30px;
}


.btn1:hover {
	color: white;
	background: #FDB54D;
}
</style>
<br>
<br>
<br>
<h1 style="text-align: center">관리자 페이지</h1>
<div class="container">
	<div class="top-div mt-5">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="card">
			<a href="member/list" class="btn1 btn-light"> <i class="fa-solid fa-user"></i> 회원 관리
			</a>
		</div>
		<br>
		</sec:authorize>
		
		<div class="card">
			<a href="store/list" class="btn1 btn-light"> <i
				class="fa-solid fa-store"></i> 가맹점 관리
			</a>
		</div>
		<br>
		<div class="card">
			<a href="../recommend/editor/list" class="btn1 btn-light"> <i
				class="fa-solid fa-feather-pointed"></i> 추천페이지 관리
			</a>
		</div>
		<br>
		<div class="card">
			<a href="review/list" class="btn1 btn-light"> <i
				class="fa-solid fa-comment"></i> 리뷰 관리
			</a>
		</div>
	</div>

</div>

<%@ include file="../layouts/footer.jsp"%>