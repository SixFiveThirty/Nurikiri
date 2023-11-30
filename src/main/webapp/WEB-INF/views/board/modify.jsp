<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/boardRest.js"></script>

<%@ include file="../layouts/header.jsp"%>


<script>
$(document).ready(function(){
	
	
	 $('.get').click(function(){
	document.forms.getForm.submit();
	}); 
	
	const attaches = $('[name="files"]');
	const attachList = $('#attach-list');

	attaches.change(function (e){
		let fileList = '';
		for(let file of this.files){
			let fileStr =`
			<div>
				<i class="fa-solid fa-file"></i>
				\${file.name}(\${file.size.formatBytes()})
			</div>`;
			fileList += fileStr;
		}
		attachList.html(fileList);
	});	
	
	
 
	$('.remove-attachment').click(async function(e){
		if(!confirm('파일을 삭제할까요?')) return;
		let no = $(this).data("no");
		
		let url ='/board/remove/attach/' + no + '?_csrf=${_csrf.token}';
		let result = await rest_delete(url);
		if(result =='OK'){
			$(this).parent().remove();
		} else{
			alert('파일 삭제 실패');
		}
	});

});
</script>

<div class="mx-5">
	<h2 class="page-header"><i class="far fa-edit"></i>공지사항 수정페이지</h2><br><br>
	<div class="panel panel-default">
	<div class="pannel-body">
		<form:form modelAttribute="board" role="form"
	action="?_csrf=${_csrf.token}" enctype="multipart/form-data"> <!-- submit 할 때 설정 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" /> 
			<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
			<input type="hidden" name="amount" value="${cri.amount}"/>
			<input type="hidden" name="type" value="${cri.type}"/>
			<input type="hidden" name="keyword" value="${cri.keyword}"/>
			
			<form:hidden path="bno" />
			<form:hidden path="writer"/>
			
			<div class="form-group">
				<form:label path="title">제목</form:label>
				<form:input path="title" cssClass="form-control"/>
				<form:errors path="title" cssClass="error"/>
				</div>
		
			<div class="my-3">
				<label for ="attaches">첨부파일</label>
				<c:forEach var ="file" items="${board.attaches}">
					<div>
						<i class="fa-solid fa-floppy-disk"></i> ${file.filename}(${file.formatSize})
						<button type="button" data-no ="${file.no}"
						class="btn btn-danger btn-sm py-0 px-1 remove-attachment">
							<i class="fa-solid fa-times"></i>
						</button>
					</div>
				</c:forEach>
			</div>
			
			<div class="form-group">
				<label for ="attaches">추가 첨부파일</label>
				<div id = "attach-list" class="my-1"></div>
				<input type="file" class="form-control" multiple name="files"/>
			</div>
		
		
			<div class="form-group">
				<form:label path="content">내용</form:label>
				<form:textarea path="content" cssClass="form-control"></form:textarea>
				<form:errors path="content" cssClass="error"/>
			</div>
			
				
				<button type="submit" class="btn btn-primary">
			 		<i class="fas fa-check"></i>확인</button>
			 	
			 	<button type="reset" class="btn btn-primary">
			 		<i class="fas fa-undo"></i>취소</button>
			 	
			 	<a href="${cri.getLinkWithBno('list', board.bno)}" class="btn btn-primary get">
			 		<i class="fas fa-file-alt"></i>돌아가기</a>
			 		
	
	 		</form:form>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>