<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 문제가 일으키는 스타일 코드가 있는 곳  -->
<link href="../resources/css/pestkit/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../resources/css/pestkit/style.css" rel="stylesheet">


<c:if test="${not empty member.username}">

	<style>
.fa-heart {
	cursor: pointer;
}
.title{
	white-space : nowrap;
	overflow : hidden;
	text-overflow : ellipsis;
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

<style>
.btn-color {
	background-color: #FDB54D;
}
</style>

<div class="container">
	<div class="flex-w flex-sb-m p-b-22" id="selectSorts">
		<div class="menu-desktop">
			<ul class="main-menu">
				<li><a href="/store/list?keyword=${cri.keyword}&sort=default">기본 순</a></li>			
				<li><a href="/store/list?keyword=${cri.keyword}&sort=bookmarkCount">즐겨찾기 순</a></li>
				<li><a href="/store/list?keyword=${cri.keyword}&sort=starCount">별점 순</a></li>
				<li><a href="/store/list?keyword=${cri.keyword}&sort=reviewCount">리뷰 순</a></li>
			</ul>
		</div>
	</div>

	<div class="row g-5">
		<c:forEach var="store" items="${list}">
			<div class="col-xxl-3 col-lg-6 col-md-6 col-sm-12">

				<div class="owl-carousel blog-carousel wow fadeInUp" data-wow-delay=".5s">
					<div class="blog-item">
						<a class="store-link" href="${cri.getLink('get')}&sno=${store.sno}"> <img src="/store/image/thumbnail/${store.sno}" class="img-fluid w-100 rounded-top" alt="" /></a>
						<div class="rounded-bottom bg-light">
							<div class="p-4 pb-2">
								<h4 class="title">${store.title}</h4>
								<div style="text-align: right">
									<span class="storeAvgRate mr-3">
										<i class="fa-solid fa-star" style="color: #f9ba48"></i> ${store.avgRate}
									</span>
									<span class="storeBookmark">
										<i class="${store.myStoreBookmark ? 'fa-solid' : 'fa-regular' } fa-heart text-danger"
										data-sno="${store.sno}"></i>
									<span class="storeBookmark-count">${store.storeBookmarks}</span>
									</span>
								</div>
							</div>
						</div>
						<div class="p-4 py-2 mb-5 d-flex justify-content-between rounded-bottom blog-btn btn-color">
							<a><i class="fa fa-comments me-2"></i>${store.reviewCount} Reviews</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="../common/pagination.jsp"%>

<%@ include file="../layouts/footer.jsp"%>

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="../resources/lib/pestkit/wow/wow.min.js"></script>
<script src="../resources/lib/pestkit/easing/easing.min.js"></script>
<script src="../resources/lib/pestkit/waypoints/waypoints.min.js"></script>
<script src="/resources/js/main.js"></script>
