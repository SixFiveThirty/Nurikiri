<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">

	<!-- Icon Font Stylesheet -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

	<!-- Libraries Stylesheet -->
	<link href="../resources/lib/pestkit/animate/animate.min.css" rel="stylesheet">
	<!-- 밑의 코드는 좌우로 이동하는 기능인데 안쓸듯해서 주석처리하겠음 -->
	<!-- <link href="../resources/lib/pestkit/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"> -->

	<!-- Customized Bootstrap Stylesheet -->
	<link href="../resources/css/pestkit/bootstrap.min.css" rel="stylesheet">

	<!-- Template Stylesheet -->
	<link href="../resources/css/pestkit/style.css" rel="stylesheet">


	<c:if test="${not empty member.username}">

		<style>
.fa-heart {
	cursor: pointer;
}
</style>

		<script src="/resources/js/rest.js"></script>

		<script>		
	$(document).ready(function() {
				
		let username = '${member.username}';
		const BASE_URL = '/api/store/storeBookmark';
	
		//즐겨찾기 추가
		$('span.storeBookmark').on('click', '.fa-heart.fa-regular', async function(e){
		console.log()
		let sno = parseInt($(this).data("sno"));
		let storeBookmark = { sno, username };
		console.log(storeBookmark);
		
		await rest_create(BASE_URL + "/add", storeBookmark);
		
		let storeBookmarkCount = $(this).parent().find(".storeBookmark-count");
		console.log(storeBookmarkCount);
		let count = parseInt(storeBookmarkCount.text());
		storeBookmarkCount.text(count+1);
	
		$(this)
		.removeClass('fa-regular')
		.addClass('fa-solid');
		});
	
		//즐겨찾기 제거	
		$('span.storeBookmark').on('click', '.fa-heart.fa-solid', async function(e){
			
			let sno = parseInt($(this).data("sno"));
			
			await rest_delete(`\${BASE_URL}/delete?sno=\${sno}&username=\${username}`);
	
			let storeBookmarkCount = $(this).parent().find(".storeBookmark-count");
			console.log(storeBookmarkCount);
			let count = parseInt(storeBookmarkCount.text());
			storeBookmarkCount.text(count-1);
		
			$(this)
				.removeClass('fa-solid')
				.addClass('fa-regular');
		});
		
	});
	</script>
	</c:if>
	<!-- Blog Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="text-center mb-5 wow fadeInUp" data-wow-delay=".3s">
				<h5
					class="mb-2 px-3 py-1 text-dark rounded-pill d-inline-block border border-2 border-primary">누리끼리한</h5>
				<h1 class="display-5">가맹점 찾기</h1>
			</div>
			<nav aria-label="breadcrumb">
				<ol
					class="breadcrumb justify-content-center mb-0 animated slideInDown">
					<li class="breadcrumb-item"><a href="#">즐겨찾기 순</a></li>
					<li class="breadcrumb-item"><a href="#">별점 순</a></li>
					<li class="breadcrumb-item"><a href="#">리뷰 많은 순</a></li>
					<li class="breadcrumb-item text-white" aria-current="page">상호명
						순</li>
				</ol>
			</nav>

		<div class="row isotope-grid">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
				<div class="owl-carousel blog-carousel wow fadeInUp" data-wow-delay=".5s">
					
					<div class="blog-item">
						<img src="/resources/img/blog-1.jpg" class="img-fluid w-100 rounded-top" alt="">
							<div class="rounded-bottom bg-light">
								<div class="d-flex justify-content-between p-4 pb-2">
									<h4>store.title<h4>
									<i class= "fa fa-heart"></i>
								</div>
							<div class="p-4 py-2 d-flex justify-content-between bg-primary rounded-bottom blog-btn">
								<a><i class="fa fa-comments me-2"></i>(store.reviewcount) Comments</a>
							</div>
						</div>
					</div>
					
					<div class="blog-item">
						<img src="/resources/img/blog-3.jpg"
							class="img-fluid w-100 rounded-top" alt="">
						<div class="rounded-bottom bg-light">
							<div class="d-flex justify-content-between p-4 pb-2">
								<span class="pe-2 text-dark"><i class="fa fa-user me-2"></i>By
									Admin</span> <span class="text-dark"><i
									class="fas fa-calendar-alt me-2"></i>10 Feb, 2023</span>
							</div>
							<div class="px-4 pb-0">
								<h4>How To Build A Cleaning Plan</h4>
								<p>Lorem ipsum dolor sit amet consectur adip sed eiusmod
									tempor.</p>
							</div>
							<div
								class="p-4 py-2 d-flex justify-content-between bg-primary rounded-bottom blog-btn">
								<a href="#" type="button" class="btn btn-primary border-0">Learn
									More</a> <a href="#" class="my-auto text-dark"><i
									class="fa fa-comments me-2"></i>23 Comments</a>
							</div>
						</div>
					</div>
					<div class="blog-item">
						<img src="/resources/img/blog-2.jpg"
							class="img-fluid w-100 rounded-top" alt="">
						<div class="rounded-bottom bg-light">
							<div class="d-flex justify-content-between p-4 pb-2">
								<span class="pe-2 text-dark"><i class="fa fa-user me-2"></i>By
									Admin</span> <span class="text-dark"><i
									class="fas fa-calendar-alt me-2"></i>10 Feb, 2023</span>
							</div>
							<div class="px-4 pb-0">
								<h4>How To Build A Cleaning Plan</h4>
								<p>Lorem ipsum dolor sit amet consectur adip sed eiusmod tempor.</p>
							</div>
							<div class="p-4 py-2 d-flex justify-content-between bg-primary rounded-bottom blog-btn">
								<a href="#" type="button" class="btn btn-primary border-0">Learn
									More</a> <a href="#" class="my-auto text-dark"><i
									class="fa fa-comments me-2"></i>23 Comments</a>
							</div>
						</div>
					</div>
					<div class="blog-item">
						<img src="/resources/img/blog-1.jpg" class="img-fluid w-100 rounded-top" alt="">
							<div class="rounded-bottom bg-light">
								<div class="d-flex justify-content-between p-4 pb-2">
									<span class="pe-2 text-dark"><i class="fa fa-user me-2"></i>By
										Admin</span> <span class="text-dark"><i
										class="fas fa-calendar-alt me-2"></i>10 Feb, 2023</span>
								</div>
								<div class="px-4 pb-0">
									<h4>How To Build A Cleaning Plan</h4>
									<p>Lorem ipsum dolor sit amet consectur adip sed eiusmod tempor.</p>
								</div>
								<div class="p-4 py-2 d-flex justify-content-between bg-primary rounded-bottom blog-btn">
									<a href="#" type="button" class="btn btn-primary border-0">Learn
										More</a> <a href="#" class="my-auto text-dark"><i
										class="fa fa-comments me-2"></i>23 Comments</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Blog End -->
	<%@ include file="../common/pagination.jsp"%>

	<%@ include file="../layouts/footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/lib/pestkit/wow/wow.min.js"></script>
	<script src="../resources/lib/pestkit/easing/easing.min.js"></script>
	<script src="../resources/lib/pestkit/waypoints/waypoints.min.js"></script>
	<script src="../resources/lib/pestkit/owlcarousel/owl.carousel.min.js"></script>
	<!-- Template Javascript -->
	<script src="/resources/js/main.js"></script>