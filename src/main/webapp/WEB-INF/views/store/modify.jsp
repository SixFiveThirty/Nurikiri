<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


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
	<form:form role="form" modelAttribute="store">
		<input type="hidden" name="sno" value="${store.sno}">

		<div class="form-group">
			<form:label path="title">가맹점명</form:label>
			<form:input path="title" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="market">소속 시장명</form:label>
			<form:input path="market" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="address">소재지</form:label>
			<form:input path="address" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="item">취급 품목</form:label>
			<form:input path="item" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="useRechargeCard">충전식 카드 취급 여부</form:label>
			<form:input path="useRechargeCard" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="useBill">지류 취급여부</form:label>
			<form:input path="useBill" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="useMobile">모바일 취급여부</form:label>
			<form:input path="useMobile" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="owner">사장님 이름</form:label>
			<form:input path="owner" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="phone">전화 번호</form:label>
			<form:input path="phone" cssclass="form-control"/>
		</div>
		
		<div class="form-group">
			<form:label path="content">가맹점 설명</form:label>
			<form:input path="content" cssclass="form-control rounded-1 mt-4"/>
		</div>
			
		<div class="photo-upload mt-4">
			<h3>사진 추가</h3>
			<button type="button" class="btn btn-secondary ml-4"
				style="width: 150px">파일 첨부</button>
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

	</form:form>



</div>

<%@ include file="../layouts/footer.jsp"%>