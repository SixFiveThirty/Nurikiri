<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../layouts/header.jsp"%>

<style>
.editor-card-list {
	display: flex;
}

.card {
	border-color: #FEC25E;
}

.editor-link {
	width: 100%;
	height: 200px;
	background-color: #dddddd;
	text-align: center;
}

.store-card-list {
	display: flex;
}

.store-link {
	width: 100%;
	height: 200px;
	background-color: #dddddd;
	text-align: center;
}

/* .editor-link > img {
	width: 100%;
	height: 100%;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */

/* .card-img-top {
	width: 100%;
	height: 200px;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */
.card-body {
	background-color: #FEC25E;
	border-color: #FEC25E;
}

.card-text {
	text-align: center;
}
</style>

<h1>가맹점 찾기</h1>

<div class="row">
	<c:forEach var="store" items="${list}">
		<div class="col-sm-6 col-md-4 mb-3">

			<div class="card mx-5" style="width: 18rem;">
				<a class="store-link" href="${cri.getLink('get')}&sno=${store.sno}">
					<img src="..." class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">${store.title}</p>
				</div>
			</div>

		</div>
	</c:forEach>
</div>

<div class="foot-div mt-5">
	<button type="submit" class="btn btn-light mr-5" style="width: 200px"
		onclick="location.href='${cri.getLink('register')}&sno=${store.sno}'">가맹점 등록</button>
</div>

<%@ include file="../common/pagenation.jsp"%>

<%@ include file="../layouts/footer.jsp"%>