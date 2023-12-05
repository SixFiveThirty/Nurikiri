<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../layouts/header.jsp"%>

<style>
#top a {      
position:fixed; bottom:5px; right:15px; z-index:5;     
font-size:30px; color:#fff; text-shadow:rgba(0, 0, 0, 0.3) 1px 1px 2px, rgba(0, 0, 0, 0.3) 0 0 10px;"}   
</style>
<br>
<center><h2 class="title">공지사항</h2></center><br>
<center><div class="desc">
<p class="txt">누리끼리의 소식을 안내해 드립니다.</p>
</div></center>
			

<%@include file="../board/search_bar.jsp"%>

<div class = "container">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th style="width: 60px">No</th>
				<th>제목</th>
				<th style="width: 120px">등록일</th>
				<th style="width: 110px">작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.bno}</td>
					<td><a class="move" href="${cri.getLinkWithBno('get', board.bno)}">${board.title}</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${board.regDate}" /></td>
					<td>${board.writer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<sec:authorize access="hasRole('MANAGER')">
	<div class="text-right mr-3">
		<a href="register" class="btn btn-primary"> <i class="far fa-edit"></i>글쓰기
		</a>
	</div>
	</sec:authorize>
</div>

<!-- 위로 가는 버튼 -->
<div id="top"><a href="#"><i class="fa fa-arrow-up"></i></a></div>
<script>   
 $('#top').click(function(){$('html, body').animate({scrollTop:0}, 'slow');});
</script>
<!-- // 위로 가는 버튼 --> 



	                                            

<%@ include file="../common/pagination.jsp"%>
<%@ include file="../layouts/footer.jsp"%>


