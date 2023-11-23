<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/search.js"></script>

<style>
#search-btn {
	background-color: #FEC25E;
}
</style>

<div class="d-flex justify-content-between align-items-center my-4">
	<div>
		<%-- <form:form id="searchForm" modelAttribute="cri" method="get" class="d-flex">
			<form:hidden path="pageNum"/>
			<form:hidden path="amount"/>
			<form:select path="type" items="${searchTypes}" class="form-select rounded-0 ml-1"/>
			<div class="input-group">
				<form:input path="keyword" cssClass="form-control rounded-0" />
				<input type="text" name="keyword" class="form-control rounded-0"
					value="${pageMaker.cri.keyword}" />
				<button type="submit" class="btn btn-success rounded-0">
					<i class="fa-solid fa-magnifying-glass"></i> 검색
				</button>
			</div>
		</form:form> --%>
		<form id="searchForm" modelAttribute="cri" method="get" actoin="/store/list" class="d-flex">
		<input type="hidden" name="pageNum" value="1">
			<div class="input-group">
				<select>
					<option value="F" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>상호명</option>
					<option value="R" ${pageMaker.cri.type eq 'M' ? 'selected' : ''}>시장명</option>
					<option value="A" ${pageMaker.cri.type eq 'A' ? 'selected' : ''}>지역명</option>
				</select> <input type="text" name="keyword" class="form-control rounded-0" />
				<button type="submit" class="btn rounded-0" id="search-btn">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</form>
	</div>
</div>