<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<style>
button.btn1 {
  border: 0;
  outline: none;
  font-size: 15px;
  margin: 20px;
  background: #646970;
  color: white;
  cursor: pointer;
  border-radius: 20px;
}

button.btn1:hover {
  color: white;
  background: #FDB54D;
}


td {
  vertical-align : middle;
  width: 200px;
}

.a-content {
width:300px;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
}

.review-container {
max-width: 1000px;
}
</style>

<div class="container review-container">

<br><br><h1 class="my-5" style="text-align: center">리뷰 관리</h1><br>

	<div class="mx-5">
		<%@include file="../review/search_bar.jsp"%>

		<table class="table table-hover">
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
<br>
<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>