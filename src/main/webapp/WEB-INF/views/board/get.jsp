<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"> </script>
<script src="/resources/js/comment.js"></script>
<script src="/resources/js/reply.js"></script>

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
.top {
	width: 300px;
	height: 300px;
	border-radius: 5px;
}
.thumbnail-card {
	width: 300px;
	height: 300px;
	border-radius: 5px;
}
</style>

<div class="container">
	<h3>${board.title}</h3>
	<div class="top-div mt-5">
		<div class="thumbnail-card">
			<img src="/recommend/editor/image/fullsize/${board.bno}" class="top" alt="..." />
		</div>
		<div class="card ml-5 p-5">
			<p>제목 : ${board.title}</p>
			<p>내용 : ${board.content}</p>
			<p>작성자 : ${board.writer}</p>
			<button type="button" class="btn btn-light btn-details" onclick="location.href='${board.link}'">공지사항 상세보기</button>
		</div>
	</div>
	<div class="mid-div mt-5">
		<div class="card p-5">
			<p>${board.content}</p>
		</div>
	</div>
	
	<div class="foot-div mt-5">
		<a href="${cri.getLinkWithEno('modify', board.bno)}"><button
				type="button" class="btn btn-light mr-5" style="width: 200px">수정</button></a>
		<button type="button" class="btn btn-light mr-5" style="width: 200px"
			onclick="location.href='/'">홈</button>
		<button type="button" class="btn btn-light" style="width: 200px"
			onclick="location.href='list'">목록</button>
	</div>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="bno" value="${board.bno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%@ include file=../layouts/footer.jsp"%>