<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../layouts/header.jsp"%>


<style>
.editor-card-list {
	display: flex;
}

.card {
	
}

.editor-link {
	width: 100%;
	height: 200px;
	background-color: #dddddd;
	text-align: center;
}

.store-card-list {
	display: flex;
}

.store-link {
	width: 100%;
	height: 200px;
	background-color: #dddddd;
	text-align: center;
}

/* .editor-link > img {
	width: 100%;
	height: 100%;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */

/* .card-img-top {
	width: 100%;
	height: 200px;
	border-color: #FEC25E;
	background-color: #dddddd;
	text-align: center;
} */
.card-body {
	background-color: #FEC25E;
	border-color: #FEC25E;
}

.card-text {
	text-align: center;
}

.thumbnail {
	height: 200px;
}
</style>

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

<div class="container">
	<div>
		<button type="button"
			onclick="location.href='/store/list?keyword=${cri.keyword}&sort=bookmarkCount'"
			class="btn">즐찾 순</button>
		<button type="button"
			onclick="location.href='/store/list?keyword=${cri.keyword}&sort=starCount'"
			class="btn">별점 순</button>
		<button type="button"
			onclick="location.href='/store/list?keyword=${cri.keyword}&sort=reviewCount'"
			class="btn">리뷰 순</button>
		<button type="button"
			onclick="location.href='/store/list?keyword=${cri.keyword}&sort=titleCount'"
			class="btn">상호명 순</button>
	</div>

	<div class="row mb-5">
		<c:forEach var="store" items="${list}">
			<div class="col-sm-6 col-md-4 mb-3">

				<div class="card mx-5" style="width: 18rem;">
					<a class="store-link" href="${cri.getLink('get')}&sno=${store.sno}">
						<img src="/store/image/thumbnail/${store.sno}"
						class="card-img-top thumbnail" alt="..." />
					</a>
					<div class="card-body">

						<span class="storeBookmark"> <i
							class="${ store.myStoreBookmark ? 'fa-solid' : 'fa-regular' } fa-heart	text-danger"
							data-sno="${store.sno}"></i> <span class="storeBookmark-count">${store.storeBookmarks}</span>
						</span>

						<p class="card-text">${store.title}</p>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</div>
<%@ include file="../common/pagination.jsp"%>

<%@ include file="../layouts/footer.jsp"%>
<%-- <%@ include file="list_test.jsp"%> --%>



