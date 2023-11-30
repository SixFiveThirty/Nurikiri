<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="/resources/js/review.js"><</script>
<script src="/resources/js/rest.js"><</script>

<link rel="stylesheet" href="/resources/css/starrate.css">

<script>
//댓글 기본 URL 상수 - 전역 상수
const REVIEW_URL = '/api/store/${param.sno}/review/';
/* const REPLY_URL = '/api/store/${param.sno}/reply/'; */


	$(document).ready(async function() {
		$('.remove').click(function() {
			// 클릭 이벤트 핸들러 함수
			if (!confirm("정말 삭제하겠습니까?"))
				return;

			// form을 얻어서 submit() 호출
			// console.log(document.forms)
			document.forms.removeForm.submit();
		});
		

		let sno = ${param.sno}; 	// 글번호
		let writer = '${member.username}'; // 작성자(로그인 유저)
		
		loadReviews(sno, writer); 	// 댓글 목록 불러오기
		
		// 댓글 추가 버튼 처리
		$('.review-add-btn').click(function(e) {
			createReview(sno, writer);
		});

		// 댓글 수정, 삭제 버튼 처리 - 이벤트 버블링(이벤트 처리 위임)
		// 댓글 수정 보기 버튼 클릭
		$('.review-list').on('click', '.review-update-show-btn',showUpdateReview);
				
		console.log($('.review-update-show-btn'));
		
		// 수정 확인 버튼 클릭
		$('.review-list').on('click', '.review-update-btn', function (e){
			const el = $(this).closest('.review');
			updateReview(el, writer);
			
			console.log('수정 확인', el);
		});
		
		// 수정 취소 버튼 클릭
		$('.review-list').on('click', '.review-update-cancel-btn', 
			cancelReviewUpdate);

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
</style>

<div class="container">
	<div class="d-flex justify-content-between">
		<h3>${store.title}
		</h3>
		
		<span class="storeBookmark"> <i class="${ store.myStoreBookmark ? 'fa-solid' : 'fa-regular' } fa-heart	text-danger" data-sno="${store.sno}"></i> <span class="storeBookmark-count">${store.storeBookmarks}</span>
		</span>	
	</div>
	
	<div class="top-div mt-5">
		<div class="thumbnail-card">
			<img src="/store/image/fullsize/${store.sno}" class="top" alt="사진 서비스 조금만 기다려주세요..." />
		</div>
				
		<div class="card ml-5 p-5">
			<p>상호명: ${store.title}</p>
			<p>소속 시장: ${store.market}</p>
			<p>주소: ${store.address}</p>
			<p>취급품목: ${store.item}</p>
			<p>충전식 카드 여부: ${store.useRechargeCard}</p>
			<p>지류 취급여부: ${store.useBill}</p>
			<p>모바일 취급여부: ${store.useMobile}</p>
			<p>등록년도: <fmt:formatDate value="${store.regDate}" pattern="yyyy년"/></p>
		</div>
	</div>
	<div class="bottom-div mt-5">
		<div class="card" id="map">지도 서비스 조금만 기다려주세요...</div>
	</div>
	<div>
		<a id="load" href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212">
			<button type="button" class="btn btn-light mt-3 mb-5" style="width: 200px; float:right; background-color:#FEC25E;">길찾기</button>
		</a>
	</div>
	<div class="foot-div mt-5">
		<button type="button" class="btn btn-light mr-5" style="width: 200px"
			onclick="location.href='${cri.getLink('modify')}&sno=${store.sno}'">수정</button>
		<button type="button" class="btn btn-light" style="width: 200px"
			onclick="location.href='${cri.getLink('list')}'">목록</button>
	</div>
</div>

<button type= "button" class="btn btn-light mr-5" style="width: 200px"
onclick="location.href='${cri.getLink('receipt_popup')}&sno=${store.sno}'">리뷰 등록</button>


<!--  리뷰 기능 구현 -->
<c:if test="${member.username != store.owner }">
<div class="bg-light p-2 rounded my-5">
		<div>${member.username == null ? '리뷰를 작성하려면 먼저 로그인하세요' : '리뷰 작성' }</div>
		<div>
			<fieldset class="rate new-review-rate">
                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
              	<input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
            	<input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
            </fieldset>

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

<div class="my-5">
	<h1 style="text-align: center;"><i class="fa-regular fa-comments"></i>리뷰 목록</h1>
	<hr>
	<div class="review-list"></div>
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