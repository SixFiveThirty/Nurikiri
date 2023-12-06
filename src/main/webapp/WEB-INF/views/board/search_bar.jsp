<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<script src="/resources/js/boardSearch.js"></script>

<style>
#search-btn1 {
	background-color: #343a40;
	border-radius: 0 10px 10px 0;
}
.search-keyword1 {
	font-family: Poppins-Medium;
	/* font-size: 14px; */
	border-color: #343a40;
	
}

.search-keyword1:focus {
	border-color: #343a40;
	outline: 0;
	box-shadow: 0 0 0 .15rem rgba(0, 0, 0, 0)
}

.form-select1 {
	display: block;
	/* width: 100%; */
	padding: .375rem 2.25rem .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #555;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
	background-repeat: no-repeat;
	background-position: right .75rem center;
	background-size: 16px 12px;
	border: 1px solid #343a40;
	/* border-radius: 10px; */
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none
}
  
.form-select1:focus {
	border-color: #343a40;
	outline: 0;
	box-shadow: 0 0 0 .15rem rgba(0,0,0,0)
}

.form-select1[multiple], .form-select[size]:not([size="1"]) {
	padding-right: .75rem;
	background-image: none
}

.form-select1:disabled {
	background-color: #343a40
}

.form-select1:-moz-focusring {
	color: rgba(0, 0, 0, 0);
	text-shadow: 0 0 0 #555
}

.form-select1-sm {
	padding-top: .25rem;
	padding-bottom: .25rem;
	padding-left: .5rem;
	font-size: 0.875rem
}

.form-selec1t-lg {
	padding-top: .5rem;
	padding-bottom: .5rem;
	padding-left: 1rem;
	font-size: 1.25rem
}


</style>

<div class="d-flex justify-content-between align-items-center my-4">
		<form id='searchform' modelAttribute="cri" method='get' class="d-flex">
			<select name='type' class="form-select1 rounded-start">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select> <input type='text' name='keyword' class="search-keyword1 form-control rounded-0" />
			<button type="submit" class="btn rounded-end" id="search-btn1">
			<span style="color:white"><i class="fa-solid fa-magnifying-glass"></i></span>
			</button>
		</form>
	<div class="mx-5">전체 ${pageMaker.total} 건 </div>
</div>















<!-- <script src="/resources/js/boardSearch.js">
</script> -->

<%-- <div class = "container">
	<div class="d-flex justify-content-between align-items-center my-4">
		<div class="mx-5">
		전체 ${pageMaker.total} 건 </div>
			<form:form id="searchForm" modelAttribute="cri" method="get" class="d-flex">
				<form:hidden path="pageNum"/>
				<form:hidden path="amount"/>
				<form:select path="type" items="${searchTypes}" cssClass="form-select rounded-0 ml-1"/>
				
				
				
				<div class="input-group">
					<form:input path="keyword" cssClass="form-control rounded-0"/>
					<button type="submit" class="btn btn-secondary rounded-0">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</form:form>
		</div>
	</div>
 --%>