<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/boardSearch.js">
</script>
<div class="d-flex justify-content-between align-items-center my-4">
	<div>
	전체 ${pageMaker.total} 건 </div>
	<div>
		<form:form id="searchForm" modelAttribute="cri" method="get" class="d-flex">
			<form:hidden path="pageNum"/>
			<form:hidden path="amount"/>
			<form:select path="type" items="${searchTypes}" cssClass="form-select rounded-0 ml-1"/>
			
			
			
			<div class="input-group">
				<form:input path="keyword" cssClass="form-control rounded-0"/>
				<button type="submit" class="btn btn-secondary rounded-0">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</form:form>
	</div>
</div>