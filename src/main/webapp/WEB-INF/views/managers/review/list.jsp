<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<h1>리뷰 관리</h1>

<div class="container">
	<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="text-align:center; width: 60px;">No</th>
			<th style="text-align:center;">제목</th>
			<th style="text-align:center; width: 100px;">작성자</th>
			<th style="text-align:center; width: 100px;">작성일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="review" items="${list}">
			<tr>
				<td style="text-align:center; width: 60px;">${review.rno}</td>
				<td style="text-align:center;">
					<a href="get?rno=${review.rno}">
						${review.content}
					</a>
				</td>
				<td style="text-align:center; width: 100px;">
					${review.writer}
				</td>
				<td style="text-align:center; width: 100px;">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${review.regDate}"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<%@ include file="../../layouts/footer.jsp"%>