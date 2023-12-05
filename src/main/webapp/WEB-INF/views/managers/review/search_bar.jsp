<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/search.js"></script>

<style>
#search-btn {
	background-color: #FEC25E;
}

.form-select {
	font-family: Poppins-Medium;
	font-size: 14px;
}
.form-control {
	font-family: Poppins-Medium;
	font-size: 14px;
}
</style>

<div class="d-flex justify-content-between align-items-center my-4">

		<form id='searchform' action="/manager/review/list" method='get' class="d-flex">
			<select name='type' class="form-select">
				<option value="T">가맹점 상호명</option>
				<option value="C">리뷰 내용</option>
			</select> <input type='text' name='keyword' class="form-control rounded-0" />
			<button type="submit" class="btn rounded-0" id="search-btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>

</div>