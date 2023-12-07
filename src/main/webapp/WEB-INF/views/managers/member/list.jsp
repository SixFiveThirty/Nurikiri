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
		document.forms.modifyForm.submit();
		
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
		
		$('.modify').click(function(){
			if(!confirm('정말 수정할까요?')) return;
			const userName = $(this).data("username");
			$(".modify_username").val(userName);
			console.log(userName);
			document.forms.modifyStateForm.submit();
			
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
	<h1 style="text-align: center">회원 관리</h1>

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
							<td><button type="button" class="btn btn-light modify" data-username="${member}" onclick="location.href='/security/modify'">수정</button></td>
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

<%-- <form action="modify" method="get" name="modifyForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="username" class="modify_userName" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form> --%>


<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="username" class="delete_userName" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<form action="changeAuth" method="post" name="changeAuthForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="username" class="change_username" />
	<input type="hidden" name="auth" class="change_auth" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<form action="changeState" method="post" name="changeStateForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="username" class="change_username" />
	<input type="hidden" name="isDeleted" class="change_state" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>


<%@ include file="../../common/pagination.jsp"%>

<%@ include file="../../layouts/footer.jsp"%>