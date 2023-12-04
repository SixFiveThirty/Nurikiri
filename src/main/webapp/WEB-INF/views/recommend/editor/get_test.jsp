<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<style>
.row{
	justify-content: center;
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

						<div class="flex-col-c-m size-123 bg9 how-pos5">
							<%-- <span class="ltext-107 cl2 txt-center">${editor.eno}</span>  <span
								class="stext-109 cl3 txt-center"> Jan 2018 </span> --%>
						</div>
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

						<p class="stext-117 cl6 p-b-26">${editor.storeName}</p>

						<p class="stext-117 cl6 p-b-26">${editor.content}</p>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../../layouts/footer.jsp"%>