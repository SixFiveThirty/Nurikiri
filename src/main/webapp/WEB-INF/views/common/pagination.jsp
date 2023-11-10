<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 한번에 묶어서 스타일을 바꿔보자  -->

<ul class="pagination justify-content-center">
	<c:if test="${pageMaker.cri.pageNum > 1}">
	  <li class="page-item">
	  	<a class="page-link" href="${pageMaker.cri.getLink(1)}">
	  		<i class="fa-solid fa-backward-step" style=color:#FEC25E;></i>
	  	</a>
  	</li>
  </c:if>
	
	<c:if test="${pageMaker.prev}">
	  <li class="page-item">
	  	<a class="page-link" href="${cri.getLink(pageMaker.startPage-1)}">
	  		<i class="fa-solid fa-angle-left" style=color:#FEC25E;></i>
	  	</a>
  	</li>
  </c:if>

 
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
  	<li class="page-item ${ pageMaker.cri.pageNum == num ? 'active' : '' }">
  		<a class="page-link" href="${cri.getLink(num)}">${num} </a>
  	</li>
  </c:forEach>
  

	<c:if test="${pageMaker.next}">
		<li class="page-item">
  			<a class="page-link" href="${cri.getLink(pageMaker.endPage+1)}">
	 			<i class="fa-solid fa-angle-right" style=color:#FEC25E;></i>
	 		</a>
	</li>
	</c:if>
	
	<c:if test="${pageMaker.cri.pageNum < pageMaker.totalPage}">
		<li class="page-item">
			<a class="page-link" href="${cri.getLink(pageMaker.totalPage)}">
	 			<i class="fa-solid fa-forward-step" style=color:#FEC25E;></i>
			</a>
		</li>
	</c:if>	 
</ul> 

