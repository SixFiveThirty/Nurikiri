<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="layouts/header.jsp"%>

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

/* .editor-link > img {
	width: 100%;
	height: 100%;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */

/* .card-img-top {
	width: 100%;
	height: 200px;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */
.card-body {
	background-color: #FEC25E;
	border-color: #FEC25E;
}

.card-text {
	text-align: center;
}
</style>

<div class="container">
	<div class="recommend-part pb-5">
		<p class="mx-5">에디터 추천</p>
		<div class="editor-card-list">
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="/recommend/editor/get">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="/recommend/editor/get">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="/recommend/editor/get">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
		</div>
	</div>
	<div class="recommend-part py-5">
		<p class="mx-5">즐겨찾기 순 추천</p>
		<div class="editor-card-list">
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
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
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
			<div class="card mx-5" style="width: 18rem;">
				<a class="editor-link" href="#">
					<img src="..." class="card-img-top" alt="..."/>
				</a>
				<div class="card-body">
					<p class="card-text">000 전통 시장</p>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="layouts/footer.jsp"%>