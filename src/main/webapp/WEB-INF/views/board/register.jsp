<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header.jsp"%>
<style>
.register-container {
 max-width : 1000px;
}

</style>




<script>
$(document).ready(function(){


//파일 업로드

	const attaches = $('[name="files"]');
	const attachList = $('#attach-list');
	
	attaches.change(function (e){
		let fileList = '';
		for(let file of this.files){ //<input type ="file" this.는 attaches.
			let fileStr = `
			<div>
				<i class="fa-solid fa-file"></i>
				\${file.name}(\${file.size.formatBytes(2)})
			</div>`;
			fileList += fileStr;
		}
		attachList.html(fileList);
	});
});

</script>

<br>
<div class = "register-container container">
	<div class="mx-5">
		<br><h2 class="page-header"><i class="far fa-edit"></i> 공지사항 등록</h2>
		<br>
		
		<div class="panel panel-default">
		
		 <div class="panel-body">
		 	<form:form modelAttribute="board" role="form"
		 		action="?_csrf=${_csrf.token}"
		 		enctype="multipart/form-data">
		 		<sec:authorize access="isAuthenticated()">
		 		<sec:authentication property="principal.member" var="member" />
		 		<input type = "hidden" name="writer" value="${member.name}"/>
				</sec:authorize>
			 	
			 	<div class="form-group">
						<form:label path="title">제목</form:label>
						<form:input path="title" cssClass="form-control"/>
						<form:errors path="title" cssClass="error"/>
				</div>
					
				<div class="form-group">
					<label for ="attaches">첨부파일</label>
					<div id="attach-list" class="my-1"></div>
					<input type="file" class="form-control" multiple name="files"/>
				</div>	
				
				<div class="form-group">
					<form:label path="content">내용</form:label>
					<form:textarea path="content" cssClass="form-control"></form:textarea>
					<form:errors path="content" cssClass="error"/>
				</div>
			
		 	
		 	<button type="submit" class="btn btn-dark">
		 	<i class="fas fa-check"></i>확인</button>
		 	
		 	<button type="reset" class="btn btn-dark">
		 	<i class="fas fa-undo"></i>취소</button>
		 	
		 	<a href="javascript:history.back()" class="btn btn-dark">
		 	<i class="fas fa-list"></i>목록</a>
		 	
		 	
		 	</form:form></div></div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>