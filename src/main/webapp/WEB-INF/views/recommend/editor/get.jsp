<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"> </script>
<script src="/resources/js/comment.js"></script>
<script src="/resources/js/reply.js"></script>

<script>
	const COMMENT_URL = '/api/recommend/editor/${param.eno}/comment/'; //전역상수(댓글 기본 URL 상수임.)
	const REPLY_URL = '/api/recommend/editor/${param.eno}/reply/';
	
	$(document).ready(async function() {
		$('.remove').click(function() {
			if (!confirm('정말 삭제할까요?'))
				return;
			document.forms.removeForm.submit();
		});
		
		let eno = ${param.bno}; //글 번호
		let writer = '${username}'; //작성자(로그인 유저)
		
		loadComments(eno, writer); // 댓글 목록 불러오기
		
		// 댓글 추가 버튼 처리
		$('.comment-add-btn').click(function(e) {
	      createComment(eno, writer);
	   });
		
		
		$('.comment-list').on('click', '.comment-update-show-btn', showUpdateComment);
		
		//수정 확인 버튼 클릭
		$('.comment-list').on('click', '.comment-update-btn', function(e) {
			const el = $(this).closest('.comment');
			updateComment(el, writer);
			/* console.log('수정확인', el); */
		});
		
		//수정 취소 버튼 클릭
		$('.comment-list').on('click', '.comment-update-cancel-btn', cancelCommentUpdate);
		
		//삭제 버튼 클릭
		$('.comment-list').on('click', '.comment-delete-btn', deleteComment);
		
		$('.comment-list').on('click', '.reply-add-show-btn', function(e) {
			showReplyAdd($(this), writer);
		});
		
		$('.comment-list').on('click', '.reply-add-btn', function(e) {
			addReply($(this), writer);
		});
		
		// 답급 취소
		$('.comment-list').on('click', '.reply-add-cancel-btn', cancelReply);
		
		//답글 수정 화면 보이기
		$('.comment-list').on('click', '.reply-update-show-btn', function(e) {
			showUpdateReply($(this));
		});
		
		//답글 수정 등록
		$('.comment-list').on('click', '.reply-update', function(e) {
			updateReply($(this));
		});
		
		//답글 수정 취소
		$('.comment-list').on('click', '.reply-update-cancel', cancelReplyUpdate);
		
		//답글 삭제
		$('.comment-list').on('click', '.reply-delete-btn', deleteReply);
	});
</script>

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
	height: 300px;
}

.card:nth-child(2) {
	flex-grow: 1.5;
	height: 300px;
}
/* .btn-details {width: 300px;} */
.foot-div {
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
}
</style>

<div class="container">
	<h3>${editor.title}</h3>
	<div class="top-div mt-5">
		<div class="card">
			<img src="..." class="card-img-top" alt="..." />
		</div>
		<div class="card ml-5 p-5">
			<p>상호명 :</p>
			<p>운영시간 :</p>
			<p>주소 :</p>
			<p>연락처 :</p>
			<button type="button" class="btn btn-light btn-details">가맹점
				상세보기</button>
		</div>
	</div>
	<div class="mid-div mt-5">
		<div class="card p-5">
			<p>${editor.content}</p>
		</div>
	</div>
	<div class="bottom-div mt-5">
		<div class="card" id="map"></div>
	</div>
	<div class="foot-div mt-5">
		<a href="${cri.getLinkWithEno('modify', editor.eno)}"><button
				type="button" class="btn btn-light mr-5" style="width: 200px">수정</button></a>
		<button type="button" class="btn btn-light mr-5" style="width: 200px"
			onclick="location.href='/'">홈</button>
		<button type="button" class="btn btn-light" style="width: 200px"
			onclick="location.href='list'">목록</button>
	</div>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="eno" value="${editor.eno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47527c077dd44e34b71ffb876f21b3cc&libraries=services"></script>
<script>
let getcoder = new kakao.maps.services.Geocoder();

let locals =[
	<c:forEach var="local" items="${editor.locals}">
		{
			name: '${local.storeName}',
			coords: new kakao.maps.LatLng(${local.y}, ${local.x})
		}
	</c:forEach>
];

let address = '${editor.address}';

let container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
let options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
<%@ include file="../../layouts/footer.jsp"%>