<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	.modal-btn {
		text-align: center;
	}
</style>

<div class="container my-5">
	<h5 class="mb-5" style="text-align:center">영수증 인증 팝업</h5>
	<form:form role="form" action="receipt_popup?_csrf=${_csrf.token}" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<input type="hidden" name="sno" value="${sno}"/>
		<div class="container form-group ml-5">
			<div class="thumbnail_title">영수증 등록</div>
			<input type="file" name="receipt" class="receipt" />
		</div>
		<div class="modal-btn mt-5">
			<button type="submit"
				style="background-color: #dddddd; width: 100px;">확인</button>
			<!-- <button type="button"
				style="background-color: #dddddd; width: 100px;"
				onclick="history.back()">취소
			</button> -->
			<button type="button"
				style="background-color: #dddddd; width: 100px;"
				data-dismiss="modal" aria-label="Close">취소
			</button>
		</div>
	</form:form>
</div>