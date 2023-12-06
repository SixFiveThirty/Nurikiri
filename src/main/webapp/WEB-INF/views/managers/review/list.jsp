<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="/resources/js/review.js"></script>
<div class="container">
	<h1 class="my-5" style="text-align: center">리뷰 관리</h1>
	<br> <br>
	<div class="mx-5">
		<%@include file="../review/search_bar.jsp"%>

		<table class="table table-striped table-hover" id="listTable">
			<thead>
				<tr>
					<th style="text-align: center; width: 60px;">No</th>
					<th style="text-align: center; width: 150px;">가맹점 번호</th>
					<th style="text-align: center; width: 150px;">가맹점 상호명</th>
					<th style="text-align: center;">리뷰 내용</th>
					<th style="text-align: center; width: 100px;">작성자</th>
					<th style="text-align: center; width: 150px;">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${list}">
					<tr>
						<td style="text-align: center; width: 60px;">${review.rno}</td>
						<td style="text-align: center; width: 150px;">${review.sno}</td>
						<td style="text-align: center;">${review.title}</td>
						<td style="text-align: center;"><a href="get?rno=${review.rno}"> ${review.content} </a></td>
						<td style="text-align: center; width: 150px;">${review.writer}</td>
						<td style="text-align: center; width: 100px;"><fmt:formatDate pattern="yyyy.MM.dd" value="${review.regDate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>