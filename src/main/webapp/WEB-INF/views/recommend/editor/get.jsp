<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"> </script>
<script src="/resources/js/comment.js"></script>
<script src="/resources/js/reply.js"></script>

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

.top {
	width: 300px;
	height: 300px;
	border-radius: 5px;
}

.thumbnail-card {
	width: 300px;
	height: 300px;
	border-radius: 5px;
}
</style>

<div class="container">
	<h3>${editor.title}</h3>
	<div class="top-div mt-5">
		<div class="thumbnail-card">
			<img src="/recommend/editor/image/fullsize/${editor.eno}" class="top" alt="..." />
		</div>
		<div class="card ml-5 p-5">
			<p>상호명 : ${editor.storeName}</p>
			<p>소속 시장 : ${editor.market}</p>
			<p>주소 : ${editor.address}</p>
			<p>취급품목 : ${editor.item}</p>
			<p>연락처 : ${editor.phone}</p>
			<button type="button" class="btn btn-light btn-details" onclick="location.href='${editor.link}'">가맹점 상세보기</button>
		</div>
	</div>
	<div class="mid-div mt-5">
		<div class="card p-5">
			<p>${editor.content}</p>
		</div>
	</div>
	<div class="bottom-div mt-5">
		<div class="card" id="map">지도 서비스 조금만 기다려주세요...</div>
	</div>
	<div>
		<a id="load" href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212">
			<button type="button" class="btn btn-light mt-3 mb-5" style="width: 200px; float: right; background-color: #FEC25E;">길찾기</button>
		</a>
	</div>
	<div class="foot-div mt-5">
		<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
			<a href="${cri.getLinkWithEno('modify', editor.eno)}">
				<button type="button" class="btn btn-light mr-5" style="width: 200px">수정</button>
			</a>
		</sec:authorize>

		<button type="button" class="btn btn-light mr-5" style="width: 200px" onclick="location.href='/'">홈</button>

		<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
			<button type="button" class="btn btn-light" style="width: 200px" onclick="location.href='list'">목록</button>
		</sec:authorize>
	</div>
</div>

<form action="remove" method="post" name="removeForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="eno" value="${editor.eno}" /> <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input type="hidden" name="amount" value="${cri.amount}" /> <input type="hidden" name="type" value="${cri.type}" /> <input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47527c077dd44e34b71ffb876f21b3cc&libraries=services"></script>
<script>
let geocoder = new kakao.maps.services.Geocoder();

let locals =[
	<c:forEach var="local" items="${editor.locals}">
		{
			name: '${local.placeName}',
			coords: new kakao.maps.LatLng(${local.y}, ${local.x})
		},
	</c:forEach>
];

let address = '${editor.address}';
let storeName = '${editor.storeName}';

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
<%@ include file="../../layouts/footer.jsp"%>