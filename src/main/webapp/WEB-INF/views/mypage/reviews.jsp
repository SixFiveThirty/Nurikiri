<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>


<style>

.page-item.active .page-link {
    z-index: 3;
    color: white;
    background-color: #FEC25E;
    border-color: #FEC25E;
}

a.page-link {
	color: #FEC25E;
}
th {
	text-align: center;
	vertical-align: middle;
}

td {
	text-align: center;
	vertical-align: middle;
}
.review-container{
	max-width : 1000px;
}

</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>

<div class="review-container container">
<h1 style="text-align: center">리뷰 목록</h1>

	<div class="mx-5">
	<%@include file="search_bar.jsp"%>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 60px">No</th>
					<th style="width: 180px">가맹점 상호명</th>
					<th >리뷰 내용</th>
					<th style="width: 110px">작성자</th>
					<th style="width: 110px">작성 일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${list}">
							<c:if test='${review.writer eq member.username}'>
					<tr>
						<td>${review.rno}</td>
						<td>${review.title}</td>
						<td  style="text-align: center"><a class="move" href="reviews/get?rno=${review.rno}">${review.content}</a></td>
						<td>${review.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}" /></td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
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