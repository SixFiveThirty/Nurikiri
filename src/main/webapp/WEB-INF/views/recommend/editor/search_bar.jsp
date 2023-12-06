<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/search.js">
</script>


<style>
#search-btn {
	background-color: #FEC25E;
	border-radius: 0 10px 10px 0;
}
.search-keyword {
	font-family: Poppins-Medium;
	/* font-size: 14px; */
	border-color: #fdc24d;
	
}

.search-keyword:focus {
	border-color: #fdc24d;
	outline: 0;
	box-shadow: 0 0 0 .15rem rgba(253, 194, 77, .25)
}

.form-select {
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
	border: 1px solid #fdc24d;
	/* border-radius: 10px; */
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none
}
  
.form-select:focus {
	border-color: #fdc24d;
	outline: 0;
	box-shadow: 0 0 0 .15rem rgba(253, 194, 77, .25)
}

.form-select[multiple], .form-select[size]:not([size="1"]) {
	padding-right: .75rem;
	background-image: none
}

.form-select:disabled {
	background-color: #e9ecef
}

.form-select:-moz-focusring {
	color: rgba(0, 0, 0, 0);
	text-shadow: 0 0 0 #555
}

.form-select-sm {
	padding-top: .25rem;
	padding-bottom: .25rem;
	padding-left: .5rem;
	font-size: 0.875rem
}

.form-select-lg {
	padding-top: .5rem;
	padding-bottom: .5rem;
	padding-left: 1rem;
	font-size: 1.25rem
}
</style>


<div class="d-flex justify-content-between align-items-center my-4">
	<form id='searchForm' modelAttribute="cri" method='get' class="d-flex">
		<select name='type' class="form-select rounded-start">
			<option value="T">제목</option>
			<option value="W">작성자</option>
		</select> <input type='text' name='keyword' class="search-keyword form-control rounded-0" />
		<button type="submit" class="btn rounded-end" id="search-btn">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</form>
	
	<div class="mx-5">전체 ${pageMaker.total} 건</div>
</div>
























<!-- <style>
#search-btn {
	background-color: #FEC25E;
}

.form-select {
	font-family: Poppins-Medium;
	font-size: 14px;
}
.form-control {
	font-family: Poppins-Medium;
	font-size: 14px;
}
</style> -->

<%-- <div class="d-flex justify-content-between align-items-center my-4">
	<div>

		<form:form id='searchForm' modelAttribute="cri" method='get' class="d-flex">
			<form:hidden path="pageNum"/>
			<form:hidden path="amount"/>
			
			<form:select path="type" class="form-select rounded-start">
				<option value="T">상호명</option>
			</form:select> 
			
			<form:input type='text' path="keyword" class="search-keyword form-control rounded-0" />
			<button type="submit" class="btn rounded-end" id="search-btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form:form>

	</div>
</div> --%>


<%-- <style>
.container:focus {
 	outline: none;
}



.input-group:focus {
	outline: none;
}

.button:focus {
	outline: none;
}

</style>
<div class = "container">
	<div class="d-flex justify-content-between align-items-center my-5">
		<div class="mx-5">
		전체 ${pageMaker.total} 건 </div>

		<form id="searchForm" action="/search" method="GET">
			<input onkeyup="enterkey()" type="search" name="searchValue"/>
			<button type="submit">
			<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	</div>
</div>
 --%>


	<!-- 
	<div class = "container">
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
		
		<div class="searchBar">
			<i class="fa-solid fa-magnifying-glass"></i>
			<input type="text" class="input">
		</div>

			
		</div>
	</div>
	
	
	 -->