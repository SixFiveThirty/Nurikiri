<%@page import="com.nurikiri.domain.MemberVO"%>
<%@page import="com.nurikiri.domain.AuthVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../layouts/header.jsp"%>

<script>
$(document).ready(async function() {

	/*  $('.remove').click(function(){
		if(!confirm('정말 삭제할까요?')) return;
		const userName = $(this).data("username");
		$(".delete_userName").val(userName);
		document.forms.removeForm.submit();
	});  */
	
	
	$('.changeAuth').change(function(){
		//if(!confirm('정말 변경할까요?')) return;
		const userName = $(this).find("option:selected").data("username");
		const auth = $(this).val();
		console.log(userName);
		console.log(auth);
		$(".change_username").val(userName);
		$(".change_auth").val(auth);
		document.forms.changeAuthForm.submit();
		
		//$(".change_userName").val(userName);
		//$(".change_auth").val()
	});	
	
		$('.changeState').click(function(){
		if(!confirm('정말 삭제할까요?')) return;
		const userName = $(this).data("username");
		$(".change_username").val(userName);
		$(".change_state").val('-1');
		console.log(userName);
		document.forms.changeStateForm.submit();
		
	});
});
</script>

<style>
.modify {
	width: 80px;
	margin: auto;
	display: block;
}

.changeState {
	width: 80px;
	margin: auto;
	display: block;
}

.gi {
	display: flex;
}

.page-link {
	position: relative;
	display: block;
	padding: $pagination-padding-y$pagination-padding-x;
	margin-left: -$pagination-border-width;
	line-height: $pagination-line-height;
	color: $pagination-color;
	text-decoration: if($ link-decoration == none, null, none);
	background-color: $pagination-bg;
	border: $pagination-border-width solid$pagination-border-color;
}

a.page-link {
	color: #FEC25E;
}

th {
	text-align: center;
	vertical-align: middle;
}

td {
	text-align: center;
	vertical-align: middle;
}
.member-container{
	max-width : 1000px;
}
</style>


<div class="member-container container">
	<h1 style="text-align: center">리뷰 목록</h1>

	<div class="mx-5 member">
		<%@include file="search_bar.jsp"%>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 60px">유저 ID</th>
					<th style="width: 180px">이름</th>
					<th>유저 권한</th>
					<th style="width: 110px">가입날짜</th>
					<th style="width: 150px">회원정보 수정</th>
					<th style="width: 150px">회원정보 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${list}">
					<c:if test="${member.isDeleted eq '0'}">
						<tr>
							<td>${member.username}</td>
							<td>${member.name}</td>
							<td style="text-align: center"><select class="changeAuth">
									<option value="" selected disable hidden>${member.auth}</option>
									<option value="ROLE_USER" data-username="${member.username}">USER</option>
									<option value="ROLE_MANAGER" data-username="${member.username}">MANAGER</option>
									<option value="ROLE_ADMIN" data-username="${member.username}">ADMIN</option>
							</select></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
							<td><button type="button" class="btn btn-light modify" data-username="${member.username}" onclick="location.href='/security/modify'">수정</button></td>
							<td class="column-1"><button type="button" class="btn btn-danger changeState" data-username="${member.username}">
									<i class="fas fa-trash-alt"></i>
								</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="../../common/pagination.jsp"%>

<%@ include file="../../layouts/footer.jsp"%>