<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

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

<div class="container">
	<h3>수정하기</h3>
	<input type="text" class="form-control rounded-1 mt-4" />
	<div class="photo-upload mt-4">
		<h3>사진 추가</h3>
		<button type="button" class="btn btn-secondary ml-4"
			style="width: 150px">파일 첨부</button>
	</div>
	<input type="text" class="content form-control rounded-1 mt-4"
		placeholder="글 내용" />
	<button type="button" class="btn btn-secondary mt-4"
		style="width: 150px">주소 설정</button>
	<div class="map-card card rounded-1 mt-4">
		<p>지도</p>
	</div>
	<div class="foot-div mt-5">
		<button type="button" class="btn btn-light mr-5" style="width:200px" onclick="location.href='get'">확인</button>
		<button type="button" class="btn btn-light" style="width:200px" onclick="location.href='get'">취소</button>
	</div>
</div>

<%@ include file="../../layouts/footer.jsp"%>