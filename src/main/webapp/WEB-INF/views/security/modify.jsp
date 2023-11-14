<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
	
<%@ include file="../layouts/header.jsp" %>
<%-- 개별 페이지 --%>
<style>
	.con{
	width: 500px
	}
	
	h1{
	text-align:center;
	}

	.btn{
	background-color: #FEC25E;
	}
	
	.num_group{
	display: flex;
    justify-content: space-between;
	}
	
	.num_group .form-group{
	width: 30%; 
    margin-bottom: 20px;
	}
	
	.num_group .form-group input {
    display: block;
    margin: 0 auto;
    }
	
	.btn-group .btn {
	flex: none;
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
    display: flex;
    align-items: center;
  }
  
  	.btn-container a {
    display: flex;
    align-items: center;
    text-align: center;
}
  
</style>

<sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal.member" var="member" />
</sec:authorize>



<div class="container">
	<br />
	<div class="con mx-auto">
		<h1>회원 정보 수정</h1>
	
		<form:form modelAttribute="member" cssClass="form">
			<br/>
			<div class="form-group">
				<form:label path="password">비밀번호 </form:label>
				<form:input path="password" cssClass="form-control" />
				<form:errors path="password" cssClass="error" />
			</div>
			<div class="form-group">
				<form:label path="confirmedPassword">비밀번호 재확인 </form:label>
				<form:input path="confirmedPassword" cssClass="form-control" />
				<form:errors path="confirmedPassword" cssClass="error" />
			</div>
			<div class="form-group">
				<form:label path="name">이름 </form:label>
				<form:input path="name" value="${member.name}" cssClass="form-control" />
				<form:errors path="name" cssClass="error" />
			</div>
			<div class="form-group">
				<form:label path="email">이메일 </form:label>
				<form:input path="email" value="${member.email}" cssClass="form-control" />
				<form:errors path="email" cssClass="error" />
			</div>
			<div class="num_group">
				<div class="form-group first_num">
					<form:label path="phone1">전화번호 </form:label>
					<form:input path="phone1" value="${member.phone1}" cssClass="form-control" />
					<form:errors path="phone1" cssClass="error" />
				</div>
				<div class="form-group middle_num">
					<form:input path="phone2" value="${member.phone2}" cssClass="form-control" />
					<form:errors path="phone2" cssClass="error" />
				</div>
				<div class="form-group last_num">
					<form:input path="phone3" value="${member.phone3}" cssClass="form-control" />
					<form:errors path="phone3" cssClass="error" />
				</div>
			</div>
			
			<div class="btn-group">
				<div class="btn-container">
					<button type="submit" name="modify" class="btn form-control">
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
			

    


<%@ include file="../layouts/footer.jsp" %>