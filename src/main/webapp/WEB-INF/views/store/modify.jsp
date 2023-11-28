<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.min.css">


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

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}
</style>

<h1 class="page-header">가맹점 정보 수정하기</h1>

<div class="panel panel-default">
	<div class="panel-body">

		<form:form role="form" modelAttribute="store" action="?_csrf=${_csrf.token}">
			<input type="hidden" name="type" value="${cri.type}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
			<form:hidden path="sno" />

			<div class="form-group">
				<form:label path="title">가맹점명</form:label>
				<form:input path="title" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="market">소속 시장명</form:label>
				<form:input path="market" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="address">소재지</form:label>
				<form:input path="address" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="item">취급 품목</form:label>
				<form:input path="item" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="useRechargeCard">충전식 카드 취급 여부</form:label>
				<form:select path="useRechargeCard" cssClass="form-control">
					<form:option value="1">사용 가능</form:option>
					<form:option value="0">사용 불가</form:option>
				</form:select>
			</div>

			<div class="form-group">
				<form:label path="useBill">지류 취급 여부</form:label>
				<form:select path="useBill" cssClass="form-control">
					<form:option value="1">사용 가능</form:option>
					<form:option value="0">사용 불가</form:option>
				</form:select>
			</div>

			<div class="form-group">
				<form:label path="useMobile">모바일 취급여부</form:label>
				<form:select path="useMobile" cssClass="form-control">
					<form:option value="1">사용 가능</form:option>
					<form:option value="0">사용 불가</form:option>
				</form:select>
			</div>

			<div class="form-group">
				<form:label path="owner">사장님 이름</form:label>
				<form:input path="owner" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="phone">전화 번호</form:label>
				<form:input path="phone" cssClass="form-control" />
			</div>

			<div class="form-group">
				<div class="thumbnail_title">가맹점 사진 등록</div>
				<input type="file" name="thumbnail" class="thumbnail" />
			</div>

			<button type="button" class="btn btn-secondary mt-4"
				style="width: 150px">주소 설정</button>

			<div class="map-card card rounded-1 mt-4">
				<p>지도</p>
			</div>


			<div class="foot-div mt-5">
				<button type="submit" class="btn btn-light mr-5"
					style="width: 200px"
					onclick="location.href='${cri.getLink('get')}&sno=${store.sno}'">확인</button>
				<button type="button" class="btn btn-light" style="width: 200px"
					onclick="location.href='${cri.getLink('get')}&sno=${store.sno}'">취소</button>
			</div>

		</form:form>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>