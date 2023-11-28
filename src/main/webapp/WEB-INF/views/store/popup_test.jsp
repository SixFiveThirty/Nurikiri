<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.min.css">

<%@ include file="../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script>
	/* 	const RECEIPT_CHECK = "/api/extractText?";
	 const FILE = "/Users/jeonhayoon/Downloads/OCR_TEST/receipt_test.jpeg";
	
	 async function receipt() {
	 await rest_receipt_post(RECEIPT_CHECK, FILE);
	 } */
</script>
<style>
</style>

<div class="container">
	<form:form modelAttribute="store" role="form"
		action="?_csrf=${_csrf.token}" enctype="multipart/form-data">
		<div class="form-group">
			<div class="thumbnail_title">영수증 등록</div>
			<input type="file" name="receipt" class="receipt" />
		</div>
		<button type="submit">확인</button>
	</form:form>
</div>

<%@ include file="../layouts/footer.jsp"%>