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
  padding: $pagination-padding-y $pagination-padding-x;
  margin-left: -$pagination-border-width;
  line-height: $pagination-line-height;
  color: $pagination-color;
  text-decoration: if($link-decoration == none, null, none);
  background-color: $pagination-bg;
  border: $pagination-border-width solid $pagination-border-color;

</style>


<div class="container">

	<h1 style="text-align: center">회원 목록</h1>
	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">

		<!-- <div class="row"> -->

		<div class="col-lg-12 col-xl-9 m-lr-auto m-b-50">
			<div class="gi">
				<%@ include file="search_bar.jsp"%>
			</div>

			<div>
				<div class="wrap-table-shopping-cart">

					<table class="table-shopping-cart">

						<tr class="table_head">
							<th class="column-1">유저 ID</th>
							<th class="column-1">이름</th>
							<th class="column-1">유저 권한</th>
							<th class="column-1">가입날짜</th>
							<th class="column-1">회원정보 수정</th>
							<th class="column-1">회원정보 삭제</th>
						</tr>

						<c:forEach var="member" items="${list}">
							<c:if test="${member.isDeleted eq '0'}">
								<tr class="table_row">

									<td class="column-1">${member.username}</td>
									<td class="column-1">${member.name}</td>
									<td class="column-1"><select class="changeAuth">
											<option value="" selected disable hidden>${member.auth}</option>
											<option value="ROLE_USER" data-username="${member.username}">USER</option>
											<option value="ROLE_MANAGER" data-username="${member.username}">MANAGER</option>
											<option value="ROLE_ADMIN" data-username="${member.username}">ADMIN</option>
									</select></td>
									<td class="column-1"><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
									<td class="column-1"><button type="button" class="btn btn-light modify" data-username="${member.username}" onclick="location.href='/security/modify'">수정</button></td>
									<td class="column-1"><button type="button" class="btn btn-danger changeState" data-username="${member.username}">
											<i class="fas fa-trash-alt"></i>
										</button></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>


<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="username" class="delete_userName" /> <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input type="hidden" name="amount" value="${cri.amount}" /> <input type="hidden" name="type" value="${cri.type}" /> <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<form action="changeAuth" method="post" name="changeAuthForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="username" class="change_username" /> <input type="hidden" name="auth" class="change_auth" /> <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input type="hidden" name="amount" value="${cri.amount}" /> <input type="hidden" name="type" value="${cri.type}" /> <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<form action="changeState" method="post" name="changeStateForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="username" class="change_username" /> <input type="hidden" name="isDeleted" class="change_state" /> <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input type="hidden" name="amount" value="${cri.amount}" /> <input type="hidden" name="type" value="${cri.type}" /> <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>
<%@ include file="../../common/pagination.jsp"%>

<%@ include file="../../layouts/footer.jsp"%>