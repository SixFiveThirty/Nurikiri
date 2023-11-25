<%@page import="com.nurikiri.domain.MemberVO"%>
<%@page import="com.nurikiri.domain.AuthVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../layouts/header.jsp"%>

<script>
$(document).ready(async function() {

	$('.remove').click(function(){
		if(!confirm('정말 삭제할까요?')) return;
		const userName = $(this).data("username");
		$(".delete_userName").val(userName);
		document.forms.removeForm.submit();
	});
	
	
	$('.changeAuth').change(function(){
		//if(!confirm('정말 변경할까요?')) return;
		const userName = $(this).find("option:selected").data("username");
		const auth = $(this).val();
		console.log(userName);
		console.log(auth);
		$(".change_username").val(userName);
		$(".change_auth").val(auth);
		document.forms.changeForm.submit();
		
		//$(".change_userName").val(userName);
		//$(".change_auth").val()
		
	});	
	
});


</script>


<h1 class="page-header">
	<i class="fas fa-list"></i> 회원 목록
</h1>

<%@ include file="../../common/search_bar.jsp"%>


<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 130px">유저 ID</th>
			<th style="width: 130px">유저 닉네임</th>
			<th>유저권한</th>
			<th style="width: 130px">가입날짜</th>
			<th style="width: 130px">회원정보 수정</th>
			<th style="width: 130px">회원정보 삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="member" items="${list}">
			<tr>
				<td>${member.username}</td>
				<td>${member.name}</td>
				<td><select class="changeAuth">
						<option value="" selected disable hidden>${member.auth}</option>
						<option value="RULE_USER" data-username="${member.username}">USER</option>
						<option value="RULE_MANAGER" data-username="${member.username}">MANAGER</option>
						<option value="RULE_ADMIN" data-username="${member.username}">ADMIN</option>
				</select></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${member.regDate}" /></td>
				<td>
					<button type="button" class="btn btn-light mr-5" data-username="${member.username}"
						style="width: 200px" onclick="location.href='/security/modify'">수정</button>
				</td>
				<td><button type="button" class="btn btn-danger remove"
						data-username="${member.username}">
						<i class="fas fa-trash-alt"></i> 삭제
					</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" /> <input type="hidden" name="username"
		class="delete_userName" /> <input type="hidden" name="pageNum"
		value="${cri.pageNum}" /> <input type="hidden" name="amount"
		value="${cri.amount}" /> <input type="hidden" name="type"
		value="${cri.type}" /> <input type="hidden" name="keyword"
		value="${cri.keyword}" />
</form>

<form action="changeAuth" method="post" name="changeForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" /> <input type="hidden" name="username"
		class="change_username" /><input type="hidden" name="auth"
		class="change_auth" /> <input type="hidden" name="pageNum"
		value="${cri.pageNum}" /> <input type="hidden" name="amount"
		value="${cri.amount}" /> <input type="hidden" name="type"
		value="${cri.type}" /> <input type="hidden" name="keyword"
		value="${cri.keyword}" />
</form>
<%@ include file="../../common/pagination.jsp"%>

<%@ include file="../../layouts/footer.jsp"%>

