<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

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
		<c:forEach var="editor" items="${list}">
			<tr>
				<td style="text-align:center; width: 60px;">${editor.eno}</td>
				<td style="text-align:center;">
					<a href="get?eno=${editor.eno}">
						${editor.title}
					</a>
				</td>
				<td style="text-align:center; width: 100px;">
					${editor.writer}
				</td>
				<td style="text-align:center; width: 100px;">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${editor.regDate}"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<%@ include file="../../layouts/footer.jsp"%>