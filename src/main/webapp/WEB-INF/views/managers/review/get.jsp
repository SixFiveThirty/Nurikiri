<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>

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
	<h3>리뷰 ${review.rno}</h3>
	<div class="top-div mt-5">
		<div class="card">
			<img src="..." class="card-img-top" alt="..." />
		</div>
	</div>
	<div class="mid-div mt-5">
		<div class="card">
			<p>${review.content}</p>
		</div>
	</div>
	<div class="foot-div mt-5">
		<button type="button" class="btn btn-light" style="width: 200px" onclick="location.href='list'">목록</button>
	</div>
	
	<div class="d-flex justify-content-between">
	<div>
		<img src="/security/avatar/sm/${review.writer}" class="avatar-sm" style="width: 100%; height: 80%"> ${review.writer}
		<div class="rate">
			<i class="fa-solid fa-star"></i> ${review.rate}
			</div>
	</div>
	<div>
		<i class="fas fa-clock"></i>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}" />
	</div>
</div>
</div>


<%@ include file="../../layouts/footer.jsp"%>