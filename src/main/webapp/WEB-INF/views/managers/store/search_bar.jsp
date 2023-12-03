<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/storeManagerSearch.js">
</script>

<style>
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

<script>
function enterkey() {
        if (window.event.keyCode == 13) {
             document.getElementById("searchForm").submit();
        }
}
</script>



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