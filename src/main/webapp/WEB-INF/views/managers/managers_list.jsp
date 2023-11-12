<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<style>
	.card {
	border-color: #c3cad1;
	text-align: center;
	width: 100px;
}
</style>
<h1>관리자</h1>
<div class="container">
	<table class="table table-striped table-hover">
	
		<tbody>
			<div class="card">
				<a href="user/list" class="btn btn-primary"> <i class="fa-solid fa-user"></i> 회원 관리
				</a>			
				<a href="store/list" class="btn btn-primary"> <i class="fa-solid fa-store"></i> 가맹점 관리
				</a>			
				<a href="review/list" class="btn btn-primary"> <i class="fa-solid fa-feather-pointed"></i> 게시글 관리
				</a>
			
			</div>
		</tbody>
	</table>
</div>

<%@ include file="../layouts/footer.jsp"%>