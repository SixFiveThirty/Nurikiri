<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<form:form modelAttribute="store" role="form"
		action="?_csrf=${_csrf.token}" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<div class="form-group">
			<div class="thumbnail_title">영수증 등록</div>
			<input type="file" name="receipt" class="receipt" />
		</div>
		<button type="submit">확인</button>
	</form:form>
</div>