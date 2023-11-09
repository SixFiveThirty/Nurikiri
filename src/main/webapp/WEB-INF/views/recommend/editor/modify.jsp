<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../../layouts/header.jsp"%>

<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.min.css">
<script src="/resources/js/summernote/summernote-lite.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>
<script src="/resources/js/rest.js"></script>
<script>
<!-- jquery의 기능을 확장시키는 플러그인 : jQuery Plugin -->
	$(document).ready(function() {
		$('#content').summernote({
			height : 300, //에디터 높이
			focus : true, //에디터 로딩 후 포커스를 맞출지 여부
			lang : "ko-KR", //한글 설정
		});

		$('.get').click(function() {
			document.forms.getForm.submit();
		});
		
		const attaches = $('[name="files"]');
		const attachList = $('#attach-list');
		
		attaches.change(function(e) {
			let fileList = '';
			for(let file of this.files) {
				let fileStr = `
				<div>
					<i class="fa-solid fa-file"></i>
					\${file.name}(\${file.size.formatBytes()})
				</div>
				`;
				fileList += fileStr;
			}
			attachList.html(fileList);
		});
		
		$('.remove-attachment').click(async function(e) {
			if(!confirm('파일을 삭제할까요?')) return;
			let no = $(this).data("no"); // data-no = " "
			
			//no = Path Variable
			// ?_csrf=${_csrf.token} = el
			let url = '/recommend/editor/remove/attach/' + no + '?_csrf=${_csrf.token}';
			let result = await rest_delete(url);
			if(result == 'OK') {
				$(this).parent().remove(); //DOM 에서 제거
			} else {
				alert('파일 삭제 실패');
			}
		});
	});
	
	// 기본 글꼴 설정
	$('#summernote').summernote('fontName', 'Arial');
</script>

<style>
.photo-upload {
	display: flex;
}

.content {
	height: 500px;
}

.map-card {
	height: 300px;
	border-color: red;
}

.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}
</style>

<br>
<h1 class="page-header">
	<i class="far fa-edit"></i> Editor Modification
</h1>
<div class="panel panel-default">
	<div class="panel-body">
		<form:form modelAttribute="editor" role="form"
			action="?_csrf=${_csrf.token}" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="amount" value="${cri.amount}" />
			<input type="hidden" name="type" value="${cri.type}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />

			<form:hidden path="eno" />
			<form:hidden path="writer" value="${username}" />

			<div class="form-group">
				<form:label path="title">제목</form:label>
				<form:input path="title" cssClass="form-control" />
				<form:errors path="title" cssClass="error" />
			</div>
			<div class="my-3">
				<label for="attaches">첨부파일</label>
				<c:forEach var="file" items="${editor.attaches}">
					<div>
						<i class="fa-solid fa-floppy-disk"></i> ${file.filename}
						(${file.formatSize})
						<button type="button" data-no="${file.no}"
							class="btn btn-danger btn-sm py-0 px-1 remove-attachment">
							<i class="fa-solid fa-times"></i>
						</button>
					</div>
				</c:forEach>
			</div>
			<div class="form-group">
				<label for="attaches">추가 첨부파일</label>
				<div id="attach-list" class="my-1"></div>
				<input type="file" class="form-control" multiple name="files" />
			</div>

			<div class="form-group">
				<form:label path="content">내용</form:label>
				<form:textarea path="content" id="content" cssClass="form-control"
					rows="10"></form:textarea>
				<form:errors path="content" cssClass="error" />
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i> 확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i> 취소
			</button>
			<a href="${cri.getLinkWithEno('get', editor.eno)}"
				class="btn btn-primary get"> <i class="fas fa-file-alt"></i>
				돌아가기
			</a>
		</form:form>
	</div>
</div>

<form id="getForm" action="recommend/editor/get" method="get">
	<input type="hidden" id="eno" name="eno" value="${editor.eno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
</form>

<%@include file="../../layouts/footer.jsp"%>