<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>


<style>
.column-1 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.gi {
	display: flex;
}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>

<div class="container">

	<h1 style="text-align: center">리뷰 목록</h1>
	<!-- Shoping Cart -->
	
	
	<form class="bg0 p-t-75 p-b-85">
	
		<!-- <div class="row"> -->
		<div class="col-lg-12 col-xl-9 m-lr-auto m-b-50">
			<div class="gi">
				<%@include file="search_bar.jsp"%>
			</div>

			<div>
				<div class="wrap-table-shopping-cart">

					<table class="table-shopping-cart">

						<tr class="table_head">
						
							<th class="column-1">NO</th>
							<th class="column-1">가맹점 상호명</th>
							<th class="column-1">리뷰 내용</th>
							<th class="column-1">작성자</th>
							<th class="column-1">작성일자</th>
						</tr>

						<c:forEach var="review" items="${list}">
							<c:if test='${review.writer eq member.username}'>
								<tr class="table_row">
									<td class="column-1">${review.rno}</td>
									<td class="column-1">${review.title}</td>
									<td class="column-1">${review.content}</td>
									<td class="column-1">${review.writer}</td>
									<td class="column-1"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>

<%-- <form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="hidden" name="sno" value="${review.sno}" /> 
	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${cri.amount}" /> 
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form> --%>

<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>