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

<h1>즐겨 찾기</h1>

<%@ include file="../common/pagination.jsp"%>

<%@ include file="../layouts/footer.jsp"%>