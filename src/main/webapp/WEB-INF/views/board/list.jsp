<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>

<h1 style ="text-align: center">공지사항 페이지</h1>

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
               <th style="text-align: center; width: 60px;">No</th>
               <th style="text-align: center;">제목</th>
               <th style="text-align: center; width: 100px;">작성날짜</th>
               <th style="text-align: center; width: 180px;">작성자</th>
           </tr>
       </thead>
       <tbody>
       <c:forEach items="${list}" var="board">
           <tr>
               <td style="text-align: center; width: 60px;">${board.bno} </td>
               <td style="text-align: center;"><a href="/board/get?sno=${board.bno}">${board.title}</a></td>
               <td style="text-align: center; width: 100px;"><fmt:formatDate pattern="yyyy" value="${board.regDate}"/></td>
               <td style="text-align: center; width: 60px;">${board.writer} </td>
           </tr>
          </c:forEach>
        </tbody>
    </table>
</div>

<sec:authorize access="hasRole('MANAGER')">
	<div class="text-right mr-3">
		<a href="register" class="btn btn-primary"> <i class="far fa-edit"></i>
			추가
		</a>
	</div>
</sec:authorize>

<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>