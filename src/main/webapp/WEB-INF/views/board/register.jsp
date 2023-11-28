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

<h1 class="page-header"> 공지사항 등록하기</h1>

<div class="panel panel-default">
	<div class="panel-body">

		<form:form role="form" modelAttribute="board">

			<div class="form-group">
				<form:label path="title">게시판 제목</form:label>
				<form:input path="title" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="content">내용</form:label>
				<form:input path="content" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="writer">작성자</form:label>
				<form:input path="writer" cssClass="form-control" />
			</div>


			<div class="foot-div mt-5">
				<button type="submit" class="btn btn-light mr-5"
					style="width: 200px"
					onclick="location.href='${cri.getLink('list')}&bno=${board.bno}'">확인</button>
				<button type="button" class="btn btn-light" style="width: 200px"
					onclick="location.href='${cri.getLink('get')}&bno=${board.bno}'">취소</button>
			</div>

		</form:form>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>