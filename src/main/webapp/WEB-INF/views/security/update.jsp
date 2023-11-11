<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
<%@ include file="../layouts/header.jsp" %>
<%-- 개별 페이지 --%>

<h1>회원 정보 수정</h1>
	<form action="/security/update" method="post" modelAttribute="vo">
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<%--     <form:hidden path="username"/> --%>
    
        <label for="orgPassword">이전 비밀번호:</label>
        <input type="password" id="orgPassword" name="orgPassword" required>
        <br>
        
        <label for="newPassword">새로운 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <br>
        
        <label for="newPassword2">비밀번호 확인:</label>
        <input type="password" id="newPassword2" name="newPassword2" required>
        <br>
        
          <label for="newPassword">새로운 이름:</label>
        <input type="text" id="newName" name="newName" value="${vo.name}" required>
        <br>
        
        <label for="newPassword">새로운 이메일:</label>
        <input type="text" id="newEmail" name="newEmail" value="${vo.email}"required>
        <br>
        
        
        
        <input type="submit" value="회원 정보 변경">
    </form>

<%-- <form:form modelAttribute="vo"> --%>
<!-- 			<div class="panel panel-default"> -->
<!-- 				<div class="panel-body"> -->
<!-- 					<form role="form" method="post"> -->
<!-- 						<div class="form-group"> -->
<%-- 							<form:label path="username"> --%>
<%-- 								<i class="fa-solid fa-user"></i> ID : </form:label> --%>
<%-- 							<form:input path="username" cssclass="form-control" /> --%>
<%-- 							<form:errors path="username" cssclass="errors" /> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<%-- 							<form:label path="password"> --%>
<%-- 								<i class="fa-solid fa-lock"></i> PW : </form:label> --%>
<%-- 							<form:input path="password" cssclass="form-control" /> --%>
<%-- 							<form:errors path="password" cssclass="errors" /> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<%-- 							<form:label path="password2"> --%>
<%-- 								<i class="fa-solid fa-lock"></i> PW 재확인 : </form:label> --%>
<%-- 							<form:input path="password2" cssclass="form-control" /> --%>
<%-- 							<form:errors path="password2" cssclass="errors" /> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<%-- 							<form:label path="email"> --%>
<%-- 								<i class="fa-regular fa-envelope"></i> Email : </form:label> --%>
<%-- 							<form:input path="email" cssclass="form-control" /> --%>
<%-- 							<form:errors path="email" cssclass="errors" /> --%>
<!-- 						</div> -->
<!-- 						<div class="text-center"> -->
<!-- 							<button type="submit" class="btn btn-primary"> -->
<!-- 								<i class="fas fa-check"></i>회원가입 -->
<!-- 							</button> -->
<!-- 						</div> -->

<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->




<%-- </form:form> --%>
    
    <c:if test="${not empty errors.allErrors}">
        <div class="error">
            <c:forEach items="${errors.allErrors}" var="error">
                <p>${error.defaultMessage}</p>
            </c:forEach>
        </div>
    </c:if>

<%@ include file="../layouts/footer.jsp" %>