<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../layouts/header.jsp"%>

<h1 style ="text-align: center">가맹점 관리</h1>

<div style="display : inline-block; margin: 50px 10px; float:right;">
<div class="input-group">
   <div class="form-outline">
       <input id="search-input" type="search" name="title" 
              class="form-control" placeholder="검색어 입력" 
        onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}"/>
   </div>
</div>
</div>







<div class="container">
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
               <td style="text-align: center; width: 60px;">${store.sno} </td>
               <td style="text-align: center;"><a href="/store/get?sno=${store.sno}">${store.title}</a></td>
               <td style="text-align: center; width: 100px;"><fmt:formatDate pattern="yyyy" value="${store.regDate}"/></td>
               <td style="text-align: center;"><button onclick="location.href='/store/modify?sno=${store.sno}'">수정</button></td>
               <td style="text-align: center; width: 150px;"><button onclick="changeBtnName()">Y</button></td>
           </tr>
          </c:forEach>
        </tbody>
    </table>
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