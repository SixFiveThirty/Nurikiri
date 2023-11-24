<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="layouts/header.jsp"%>

<script>
	$(document).ready(function() {
		$('.editor').click(function() {
			document.forms.editorForm.submit();
		});
	})
</script>

<style>
.editor-card-list {
	display: flex;
}

.card {
	border-color: #FEC25E;
}

.editor-link {
	width: 100%;
	height: 200px;
	background-color: #dddddd;
	text-align: center;
}
.card-body {
	background-color: #FEC25E;
	border-color: #FEC25E;
}

.card-text {
	text-align: center;
}
.thumbnail {
	height: 200px;
}
</style>

<div class="container">
	<div class="recommend-part pb-5">
		<p class="mx-5">에디터 추천</p>
		<div class="editor-card-list">
			<c:forEach var="editor" items="${getEditorListThree}">
				<div class="card mx-5" style="width: 18rem;">
					<a class="editor-link editor" href="/recommend/editor/get?eno=${editor.eno}">
						<img src="/recommend/editor/image/thumbnail/${editor.eno}" class="card-img-top thumbnail" alt="..." />
					</a>
					<div class="card-body">
						<p class="card-text">${editor.title}</p>
					</div>
				</div>
			</c:forEach>
			<!-- <div class="card mx-5" style="width: 18rem;">
				<a class="editor-link editor" href="/recommend/editor/get">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link editor" href="/recommend/editor/get">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div> -->
		</div>
	</div>
	<div class="recommend-part py-5">
		<p class="mx-5">즐겨찾기 순 추천</p>
		<div class="editor-card-list">
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
		</div>
	</div>
	<div class="recommend-part py-5">
		<p class="mx-5">별점 순 추천</p>
		<div class="editor-card-list">
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#"> <img src="..."
					class="card-img-top" alt="..." />
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="editorForm" action="/recommend/editor/get" method="get">
	<input type="hidden" id="eno" name="eno" value="${editor.eno}" />
</form>

<%@ include file="layouts/footer.jsp"%>