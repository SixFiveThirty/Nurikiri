<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<%@ include file="../layouts/header.jsp" %>
<%-- 개별 페이지 --%>

<style>

.con{
	width: 500px
	}
	
	.con h1{
	text-align:center;
	font-size: 24px;
	font-style: normal;
	font-weight: 500;
	}
	
	.btn-group .btn {
	background-color: #FEC25E;
	border-radius: 3px;
	padding: 0;
	width: 215px;
	height: 50px;
}

	.btn-group {
	display: flex;
	justify-content: space-between;
}

  	.btn-container {
    height: 50px;
    display: flex;
    text-align: center;
  }

  .btn-container a {
    display: flex;
    justify-content: center;
    align-items: center;
  }

</style>

<sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal.member" var="member" />
</sec:authorize>


<div style="width: 500px" class="mx-auto">
	<div class="container">
	<br />
			<div class="con mx-auto">
				<h1>비밀번호 재확인</h1>
				<form:form modelAttribute="member" cssClass="form" method="post" action="/remove">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
				<input type="hidden" name="password" value="${member.password}"/>
					<form:label path="confirmedPassword">비밀번호</form:label>
					<form:input path="confirmedPassword" cssClass="form-control" type="password"/>
					<form:errors path="confirmedPassword" cssClass="errors" />
				</div>

			<div class="btn-group">
					<div class="btn-container">
						<button type="submit" name="remove" class="btn form-control">
							확인
						</button>
					</div>
				
					<div class="btn-container">
							 <a href="/security/profile" class="btn form-control">
						        취소
						      </a>
				     </div>
			      </div>
		</form:form>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp" %>