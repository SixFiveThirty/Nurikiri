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
<div class="container">

	<h1 class="page-header">
		<i class="fas fa-list center"></i> 회원 목록
	</h1>

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="row">
			<div class="">	
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tr class="table_head">
								<th class="column-1">유저 ID</th>
								<th class="column-2">이름</th>
								<th class="column-3">유저 권한</th>
								<th class="column-4">가입날짜</th>	
								<th class="column-5">회원정보 삭제</th>
							</tr>

							<tr class="table_row">
								<td class="column-1">
									<div class="how-itemcart1">
										<img src="images/item-cart-04.jpg" alt="IMG">
									</div>
								</td>
								<td class="column-2">Fresh Strawberries</td>
								<td class="column-3">$ 36.00</td>
								<td class="column-4">
									<div class="wrap-num-product flex-w m-l-auto m-r-0">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</td>
								<td class="column-5">$ 36.00</td>
							</tr>

							<tr class="table_row">
								<td class="column-1">
									<div class="how-itemcart1">
										<img src="images/item-cart-05.jpg" alt="IMG">
									</div>
								</td>
								<td class="column-2">Lightweight Jacket</td>
								<td class="column-3">$ 16.00</td>
								<td class="column-4">
									<div class="wrap-num-product flex-w m-l-auto m-r-0">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product2" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</td>
								<td class="column-5">$ 16.00</td>
							</tr>
						</table>
					</div>
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