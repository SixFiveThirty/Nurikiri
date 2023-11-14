<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

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
	height: 400px;
}

.card:nth-child(2) {
	flex-grow: 1.5;
	height: 400px;
}
/* .btn-details {width: 300px;} */
.review {
	border-color: #c3cad1;
}

.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}
</style>

<div class="container">
	<h3>${store.title}</h3>
	<div class="top-div mt-5">
		<div class="card">
			<img src="..." class="card-img-top" alt="사진 서비스 조금만 기다려주세요..." />
		</div>
		<div class="card ml-5 p-5">
			<p>상호명: ${store.title }</p>
			<p>소속 시장: ${store.market}</p>
			<p>주소: ${store.address }</p>
			<p>취급품목: ${store.item }</p>
			<p>충전식 카드 여부: ${store.useRechargeCard}</p>
			<p>지류 취급여부: ${store.useBill }</p>
			<p>모바일 취급여부: ${store.useMobile }</p>
			<p>등록년도: <fmt:formatDate value="${store.regDate}" pattern="yyyy년"/></p>
		</div>
	</div>
	<div class="mid-div mt-5">
		가계 설명
		<div class="card">${store.content}</div>
	</div>
	<div class="bottom-div mt-5">
		<div class="card">
			<p>지도 서비스 조금만 기다려주세요...</p>
		</div>
	</div>
	<div class="foot-div mt-5">
		<button type="button" class="btn btn-light mr-5" style="width: 200px"
			onclick="location.href='${cri.getLink('modify')}&sno=${store.sno}'">수정</button>
		<button type="button" class="btn btn-light" style="width: 200px"
			onclick="location.href='${cri.getLink('list')}'">목록</button>
	</div>
</div>

<h1>리뷰 목록</h1>
<button type= "button" class="btn btn-light mr-5" style="width: 200px">리뷰 등록</button>



<div class="review">리뷰 서비스 조금만 기다려주세요...</div>






<%@ include file="../layouts/footer.jsp"%>