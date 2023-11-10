<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
$(document).ready(function() {
	$('.get').click(function(){
		document.forms.getForm.submit();
	});		
});


<%@ include file="../layouts/header.jsp"%>

<style>
.photo-upload {
	display: flex;
}

.content {
	height: 500px;
}

.map-card {
	height: 300px;
	border-color: red;
}

.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}
</style>

<h1 class="page-header">가맹점 정보 수정하기</h1>

<div class="container">
	<form role="form" method="post">
		<input type="hidden" name="sno" value="${store.sno}">

		<div class="form-group">
			<label>가맹점명</label> <input name="title" class="form-control"
				value="${store.title}">
		</div>

		<div class="form-group">
			<label>소속 시장명</label> <input name="market" class="form-control"
				value="${store.market}">
		</div>

		<div class="form-group">
			<label>소재지</label> <input name="address" class="form-control"
				value="${store.address}">
		</div>

		<div class="form-group">
			<label>취급 품목</label> <input name="item" class="form-control"
				value="${store.item}">
		</div>

		<div class="form-group">
			<label>충전식 카드 취급 여부</label> <input name="useRechargeCard"
				class="form-control" value="${store.useRechargeCard}">
		</div>

		<div class="form-group">
			<label>지류 취급여부</label> <input name="useBill" class="form-control"
				value="${store.useBill}">
		</div>

		<div class="form-group">
			<label>모바일 취급여부</label> <input name="useMobile" class="form-control"
				value="${store.useMobile}">
		</div>

		<div class="form-group">
			<label>사장님 이름</label> <input name="owner" class="form-control"
				value="${store.owner}">
		</div>

		<div class="form-group">
			<label>전화 번호</label> <input name="phone" class="form-control"
				value="${store.phone}">
		</div>

		<%-- <div class="form-group">
			<label>등록년도</label> <input name="regDate" class="form-control"
				value="${store.regDate}">
		</div>

		<div class="form-group">
			<label>수정년도</label> <input name="updateDate" class="form-control"
				value="${store.updateDate}">
		</div> --%>

		<div class="photo-upload mt-4">
			<h3>사진 추가</h3>
			<button type="button" class="btn btn-secondary ml-4"
				style="width: 150px">파일 첨부</button>
		</div>

		<div class="form-group">
			<label>가맹점 설명</label> <input name="content"
				class="content form-control rounded-1 mt-4" value="${store.content}" />
		</div>

		<button type="button" class="btn btn-secondary mt-4"
			style="width: 150px">주소 설정</button>

		<div class="map-card card rounded-1 mt-4">
			<p>지도</p>
		</div>


		<div class="foot-div mt-5">
			<button type="submit" class="btn btn-light mr-5" style="width: 200px"
				onclick="location.href='${cri.getLink('get')}&sno=${store.sno}'">확인</button>
			<button type="button" class="btn btn-light" style="width: 200px"
				onclick="location.href='${cri.getLink('get')}&sno=${store.sno}'">취소</button>
		</div>


	</form>
</div>

<%@ include file="../layouts/footer.jsp"%>