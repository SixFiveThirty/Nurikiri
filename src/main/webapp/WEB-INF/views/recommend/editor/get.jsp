<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<style>
.row{
	justify-content: center;
}

.editorLink{
	display: flex;
    justify-content: center;
    align-items: center;
	font-size: 12px;
	background-color: #D9D9D9;
	border-radius: 23px;
 	padding: 1px 7px; 
 	color: black;	
 	border: 1px solid #D9D9D9;
}

.editorLink:hover{
	border: 1px solid #FEC25E;
	background-color: #ffffff;
	transition-duration: 0.3s; 
    color: #FEC25E;
}

</style>


<!-- Content page -->
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<!--  -->
					<div class="wrap-pic-w how-pos5-parent">
						<img src="/recommend/editor/image/thumbnail/${editor.eno}" alt="IMG-BLOG">
					</div>

					<div class="p-t-32">
						<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
								<span class="cl4">By </span>${editor.writer}<span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> ${editor.regDate} <span class="cl12 m-l-4 m-r-6">|</span>
						</span> <span>${editor.item} <span
								class="cl12 m-l-4 m-r-6">|</span>
						</span> <span> ${editor.address} </span>
						</span>

						<h4 class="ltext-109 cl2 p-b-28">${editor.title}</h4>

						<div class="cl6 p-b-26" style="display:flex">
							<p class="stext-117">${editor.storeName}</p><a href="${editor.link}" class="stext-117 ml-3 editorLink">바로가기</a>
						</div>
						<p class="stext-117 cl6 p-b-26">${editor.content}</p>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../../layouts/footer.jsp"%>