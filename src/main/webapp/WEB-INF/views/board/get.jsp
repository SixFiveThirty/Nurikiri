<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"> </script>
<script src="/resources/js/boardRest.js"></script>

<h2 class="page-header"><i class="far fa-file-alt"></i> ${board.title}</h2><br>

<div class="d-flex justify-content-between">
<div><i class="fas fa-user"></i> ${board.writer}</div>
<div>
<i class="fas fa-clock"></i>
<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></div></div>



<div class="text-right">
	<c:forEach var="file" items="${board.attaches}">
		<div class = "attach-file-item">
			<a href = "/board/download/${file.no}" class="file-link">
				<i class="fa-solid fa-floppy-disk"></i>
					${file.filename}(${file.formatSize})<br>
			</a>
		</div>
	</c:forEach>
</div>


<hr>
<div>${board.content}</div>


	

<div class="mt-4">
		<a href="${cri.getLink('list')}" class="btn btn-primary list">
			<i class="fas fa-list"></i>목록</a>
		<a href="${cri.getLinkWithBno('modify', board.bno)}" class="btn btn-primary modify">
			<i class="far fa-edit"></i>수정</a>
		<a href="#" class="btn btn-danger remove">    <!-- 자바스크립트에서 클릭이벤트 발생해줘야함 #--> 
			<i class="fas fa-trash-alt"></i>삭제</a>
</div>

<form id ="modifyForm" action="/board/modify" method="get" >
	<input type="hidden" id="bno" name="bno" value="${board.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<input type="hidden" name="type" value="${cri.type}" /> 
	<input type="hidden" name="keyword" value="${cri.keyword}" /></form> 

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
	<input type="hidden" name="bno" value="${board.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<input type="hidden" name="type" value="${cri.type}"/> 
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
</form>

<%@ include file="../layouts/footer.jsp"%>