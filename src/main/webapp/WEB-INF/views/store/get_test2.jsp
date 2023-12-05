<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="/resources/js/review.js"><</script>
<script src="/resources/js/rest.js"><</script>

<script>
function uploadReceipt(sno) {
	console.log("값이 잘 받아지는지?", sno);
	$('#receiptModal .modal-content').load("receipt_popup?sno="+sno);
	$('#receiptModal').modal();
}


//댓글 기본 URL 상수 - 전역 상수
const REVIEW_URL = '/api/store/review/';

	$(document).ready(async function() {
		$('.remove').click(function() {
			// 클릭 이벤트 핸들러 함수
			if (!confirm("정말 삭제하겠습니까?"))
				return;

			// form을 얻어서 submit() 호출
			// console.log(document.forms)
			document.forms.removeForm.submit();
		});
		
		let sno = '${store.sno}'; 	// 글번호
		let writer = '${member.username}'; // 작성자(로그인 유저)
		let url = REVIEW_URL + '?sno=' + sno;
		
		loadReviews(sno, writer, url); 	// 리뷰 목록 불러오기
		
		// 리뷰 추가 버튼 처리
		$('.review-add-btn').click(function(e) {
			createReview(sno, writer);
		});

		// 삭제 버튼 클릭
		$('.review-list').on('click', '.review-delete-btn',
				deleteReview);		
	});
</script>

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
		
		//좋아요 추가
		$('span.storeBookmark').on('click', '.fa-heart.fa-regular', async function(e){
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
		
		//좋아요 제거
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
.top-div {
	display: flex;
	width: 100%;
}

.card {
	border-color: #c3cad1;
}

.card:nth-child(1) {
	flex-grow: 1;
	height: 400px;
}

.card:nth-child(2) {
	flex-grow: 1.5;
	height: 400px;
}
/* .btn-details {width: 300px;} */
.review {
	border-color: #c3cad1;
}

.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}

.thumbnail-card {
	width: 400px;
	height: 400px;
	border-radius: 5px;
}

.top {
	width: 400px;
	height: 400px;
	border-radius: 5px;
}

.modal {
	/* padding: 50%; */
	
}

.modal-dialog {
	position: absolute;
	top: 25%;
	left: 35%;
}

.review-btn {
	width: 150px;
	background-color: #FDB54D;
	text-align: center;
}
</style>

<div class="container">
	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="/resources/images/product-detail-01.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="/resources/images/product-detail-01.jpg" alt="IMG-PRODUCT">
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">${store.title}</h4>

						<span class="mtext-106 cl2">
						<span class="storeAvgRate mr-3">별점 <i class="fa-solid fa-star" style="color: #f9ba48"></i> ${store.avgRate}</span>
						<span class="storeBookmark ml-3"> 즐겨찾기
							<i class="${ store.myStoreBookmark ? 'fa-solid' : 'fa-regular' } fa-heart	text-danger" data-sno="${store.sno}"></i>
							<span class="storeBookmark-count">${store.storeBookmarks}</span>
						</span>
						</span>

						<p class="stext-102 cl3 p-t-23">소속 시장: ${store.market }</p>
						<p class="stext-102 cl3 p-t-23">주소: ${store.address }</p>
						<p class="stext-102 cl3 p-t-23">취급 품목: ${store.item }</p>
						<p class="stext-102 cl3 p-t-23">충전식 카드 여부: ${store.useRechargeCard}</p>
						<p class="stext-102 cl3 p-t-23">지류 취급여부: ${store.useBill }</p>
						<p class="stext-102 cl3 p-t-23">모바일 취금 여부: ${store.useMobile }</p>
						<p class="stext-102 cl3 p-t-23">
							등록년도:
							<fmt:formatDate value="${store.regDate}" pattern="yyyy년" />
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="bottom-div mt-5">
			<div class="card" id="map">지도 서비스</div>
		</div>
		<div>
			<a id="load" href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212">
				<button type="button" class="btn btn-light mt-3 mb-5" style="width: 200px; float: right; background-color: #FEC25E;">길찾기</button>
			</a>
		</div>
		<div class="foot-div mt-5">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" class="btn btn-light mr-5" style="width: 200px" onclick="location.href='${cri.getLink('modify')}&sno=${store.sno}'">수정</button>
			</sec:authorize>
			<button type="button" class="btn btn-light" style="width: 200px" onclick="location.href='${cri.getLink('list')}'">목록</button>
		</div>
		<button type="button" class="btn btn-light mr-5" style="width: 200px" onclick="uploadReceipt('${store.sno}')">리뷰 등록</button>

		<!-- 영수증 Modal 팝업창 -->
		<div class="modal fade" id="receiptModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content"></div>
			</div>
		</div>
		<!--  리뷰 기능 구현 -->
		<c:if test="${member.username != store.owner }">
			<div class="container bg-light p-2 rounded my-5" id="review">
				<div>${member.username == null ? '리뷰를 작성하려면 먼저 로그인하세요' : '리뷰 작성' }</div>
				<div>
					<span class="wrap-rating fs-18 cl11 pointer"> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <i class="item-rating pointer zmdi zmdi-star-outline"></i> <input class="rating" type="hidden" name="rating">
					</span>

					<textarea class="form-control new-review-content" rows="3" ${member.username == null ? 'disabled' : '' }></textarea>

					<div class="text-right">
						<button class="btn btn-primary btn-sm my-2">
							<i class="fa-regular fa-image"></i> 사진 업로드
						</button>
						<button class="btn btn-primary btn-sm my-2 review-add-btn" ${member.username == null ? 'disabled' : '' }>
							<i class="fa-regular fa-comment"></i> 리뷰 등록
						</button>
					</div>
				</div>
			</div>
		</c:if>

		<div class="container my-5">
			<h1 style="text-align: center;">
				<i class="fa-regular fa-comments"></i>리뷰 목록
			</h1>
			<hr>
			<div class="review-list"></div>
		</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47527c077dd44e34b71ffb876f21b3cc&libraries=services"></script>
<script>
let geocoder = new kakao.maps.services.Geocoder();

let locals =[
	<c:forEach var="local" items="${store.locals}">
		{
			name: '${local.placeName}',
			coords: new kakao.maps.LatLng(${local.y}, ${local.x})
		},
	</c:forEach>
];

let address = '${store.address}';
let storeName = '${store.title}';

geocoder.addressSearch(address, function(result, status) {
	if(status === kakao.maps.services.Status.OK) {
		let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		let mapContainer = document.getElementById('map');
		let mapOption = {
			center: coords,	//중심좌표
			level: 2	//지도의 확대 레벨
		};
		
		let x = result[0].x;
		let y = result[0].y;

		let url = `https://map.kakao.com/link/to/\${storeName},\${y},\${x}`;
		
		$("#load").attr("href",url);
		
		let map = new kakao.maps.Map(mapContainer, mapOption);
		
		let marker = new kakao.maps.Marker({
			position: coords
		});
	
		
		//지도상에 마커표시
		marker.setMap(map);
		
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
		map.setCenter(coords);
	} else {
		alert("잘못된 주소입니다.");
	}
});
</script>

<%@ include file="../layouts/footer.jsp"%>

