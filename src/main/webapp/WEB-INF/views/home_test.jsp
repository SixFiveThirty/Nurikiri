<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%@ include file="layouts/header.jsp"%> --%>
<%@ include file="layouts/header_test.jsp"%>

<style>
.inside_container {
	padding-top: 100px;
}
.d-block {
	height: 500px;
}
</style>

<div class="container">
	<div class="inside_container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<c:forEach items="${getEditorListThree}" varStatus="status">
					<li data-target="#carouselExampleIndicators"
						data-slide-to="${status.index}"
						class="<c:if test="${status.first}">active</c:if>"></li>
				</c:forEach>
			</ol>

			<div class="carousel-inner">
				<c:forEach var="editor" items="${getEditorListThree}"
					varStatus="status">
					<div
						class="carousel-item <c:if test="${status.first}">active</c:if>">
						<a class="editor-link editor"
							href="/recommend/editor/get?eno=${editor.eno}"> <img
							class="d-block w-100"
							src="/recommend/editor/image/thumbnail/${editor.eno}">
						</a>
					</div>
				</c:forEach>
			</div>

			<!-- 			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="..." alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="..." alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="..." alt="Third slide">
				</div>
			</div> -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
</div>

<form id="editorForm" action="/recommend/editor/get" method="get">
	<input type="hidden" id="eno" name="eno" value="${editor.eno}" />
</form>

<%@ include file="layouts/footer.jsp"%>