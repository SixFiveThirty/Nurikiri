<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../../layouts/header.jsp"%>

<div class="container">
	<h1 class="my-5" style="text-align: center">추천페이지 관리</h1><br><br>
	
	<div class="mx-5">
		<%@include file="../editor/search_bar.jsp"%>
	
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="text-align: center; width: 60px;">No</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center; width: 100px;">작성자</th>
					<th style="text-align: center; width: 100px;">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="editor" items="${list}">
					<tr>
						<td style="text-align: center; width: 60px;">${editor.eno}</td>
						<td style="text-align: center;"><a
							href="get?eno=${editor.eno}"> ${editor.title} </a></td>
						<td style="text-align: center; width: 100px;">
							${editor.writer}</td>
						<td style="text-align: center; width: 200px;"><fmt:formatDate
								pattern="yyyy-MM-dd" value="${editor.regDate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<sec:authorize access="hasRole('MANAGER')">
			<div class="text-right mr-3">
				<a href="register" class="btn btn-primary"> <i class="far fa-edit"></i>
					추가
				</a>
			</div>
		</sec:authorize>
	</div>	
</div>

<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>