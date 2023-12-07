<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>

<script>
//댓글 기본 URL 상수 - 전역 상수
const REVIEW_URL = '/api/store/review/';

//리뷰 삭제
async function deleteReviews(rno) {
	if(!confirm('리뷰를 삭제할까요?')) return;
	
	// api 호출
	await rest_delete(REVIEW_URL + rno);
		
	window.history.back();
}

	$(document).ready(async function() {		
		let writer = '${member.username}'; // 작성자(로그인 유저)
		
		// 삭제 버튼 클릭
		$('.review-list').on('click', '.review-delete-btn',	deleteReview);
		
		// 별점 불러오기
		var rating = $('.loadRate');

		rating.each(function(){
			var targetScore = $(this).attr('data-rate');
			console.log(targetScore);
			$(this).find('i:nth-child(-n+'+ targetScore +')').css({color:'#f9ba48'});
		});
		
	})

</script>

<style>
.top-div {
	display: flex;
	width: 100%;
}

.card {
	border-color: #c3cad1;
}

.card-thumbnail {
	flex-grow: 1;
	height: 300px;
}

.card-content {
	flex-grow: 1.5;
	height: 100px;
}

.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}

.loadRate i{
	color:#ebebeb;
}

.review-container {max-width:700px;
	margin: 0 auto;
}

</style>

<div class="review-container">
	<div class="card">
		<div class="card-thumbnail">
			<img src="..." class="card-img-top" alt="..." />
		</div>
	</div>
	
	<div class="d-flex justify-content-between">
		<div class="flex-w flex-t pb-30">
			<div class="wrap-pic-s size-109 bor0 of-hidden m-r-10 m-t-12">
				<img src="/security/avatar/sm/${review.writer}">
			</div>
			<div class="size-207">
				<div class="flex-w flex-sb-m pb-17">
					<span class="mtext-107 cl2 p-r-20">${review.writer}</span>
					<span class="loadRate fs-18 " data-rate="${review.rate}">
						<i class="zmdi zmdi-star"></i>
						<i class="zmdi zmdi-star"></i>
						<i class="zmdi zmdi-star"></i>
						<i class="zmdi zmdi-star"></i>
						<i class="zmdi zmdi-star"></i>
						<span class="mtext-107"> ${review.rate} 점 </span>
					</span>
					
				</div>
			</div>
			
		</div>
		<div>
			<i class="fas fa-clock"></i>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}" />			
		</div>
	</div>
	
	<div class="card mt-5">
		<div class="card-content">
			<p>${review.content}</p>
		</div>
	</div>
		
	<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
		<div class="foot-div mt-5">
			<button type="button" class="btn btn-light mr-3" style="width: 200px" onclick="location.href='list'">목록</button>
			<button type="button" class="btn btn-light review-delete-btn" style="width: 200px" onclick="deleteReviews('${review.rno}')">삭제</button>
		</div>		
	</sec:authorize>
	
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="rno" value="${review.rno }" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%@ include file="../../layouts/footer.jsp"%>