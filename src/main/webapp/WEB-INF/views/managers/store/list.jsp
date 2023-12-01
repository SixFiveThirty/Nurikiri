<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../layouts/header.jsp"%>

<style>
button.button_1 {
  border: 0;
  outline: none;
  font-size: 15px;
  margin: 15px;
  background: #646970;
  color: white;
  cursor: pointer;
  border-radius: 10px;
}

button.button_1:hover {
  color: white;
  background: #FDB54D;
}


td {
  vertical-align : middle;
}

</style>

<div class="container">

<br><br><h2 style ="text-align: center">가맹점 관리 페이지</h2><br><br>

<%@include file="../../board/search_bar.jsp"%>



	<div class="mx-5">
	   <table class="table table-hover">
	       <thead>
	           <tr>
	               <th style="text-align: center; width: 60px;">번호</th>
	               <th style="text-align: center;">가맹점 게시글 제목</th>
	               <th style="text-align: center; width: 100px;">작성 날짜</th>
	               <th style="text-align: center; width: 180px;">가맹점 게시글 수정</th>
	               <th style="text-align: center; width: 150px;">가맹점 운영 여부</th>
	           </tr>
	       </thead>
	       <tbody>
	       <c:forEach items="${list}" var="store">
	           <tr>
	               <td style="text-align : center; vertical-align : middle; width: 60px;">${store.sno} </td>
	               <td style="text-align: center ; vertical-align : middle;"><a href="/store/get?sno=${store.sno}">${store.title}</a></td>
	               <td style="text-align: center; vertical-align : middle; width: 100px;"><fmt:formatDate pattern="yyyy" value="${store.regDate}"/></td>
	               <td style="text-align: center; vertical-align : middle;"><button class="button_1" onclick="location.href='/store/modify?sno=${store.sno}'">수정</button></td>
	               <td style="text-align: center; vertical-align : middle; width: 150px;"><button class="button_1" onclick="changeBtnName()">Y</button></td>
	           </tr>
	          </c:forEach>
	        </tbody>
	    </table>
	</div>
</div>
<script>
function changeBtnName(e)  {
			console.log(e);
	  const btnElement = $(e.target);
//	    = document.getElementById('btn');
	  
	  const html 
	    = '<div style="color:red"> N </div>';
	  
	  btnElement.innerHTML = html;
	}
</script>





<script>
/* <c:forEach items="${storeManager}" var="store">
</c:forEach>
let store = ${store}
console.log("store", store); */


</script>

     
<%@ include file="../../common/pagination.jsp"%>
<%@ include file="../../layouts/footer.jsp"%>