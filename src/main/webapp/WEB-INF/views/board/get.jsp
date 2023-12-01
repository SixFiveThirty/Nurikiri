<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"> </script>
<script src="/resources/js/boardRest.js"></script>


<script>
$(document).ready(async function(){ //async 비동기
	$('.remove').click(function(){
		if(!confirm('정말 삭제할까요?')) return;
		document.forms.removeForm.submit();
	});
});

</script>


<br><br>
<div class = "container">
	<div class="mx-5">
		<h2 class="page-header"> ${board.title}</h2><br>
		
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
		
		
		<div class="btn-group center">
				<a href="${cri.getLink('list')}" class="btn btn-primary list">
					목록</a>
		</div>
		
		<sec:authorize access="hasRole('MANAGER')">
		<div class="text-right mr-3">
			<a href="${cri.getLinkWithBno('modify', board.bno)}" class="btn btn-primary modify">
					수정</a>
				<a href="#" class="btn btn-danger remove">    <!-- 자바스크립트에서 클릭이벤트 발생해줘야함 #--> 
					삭제</a>
		</div>
		</sec:authorize>
		
		
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
	</div>
</div>
<%@ include file="../layouts/footer.jsp"%>