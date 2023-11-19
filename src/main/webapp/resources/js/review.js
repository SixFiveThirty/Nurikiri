const replyAddable = `
	<button class="btn btn-light btn-sm reply-add-show-btn">
		<i class="fa-solid fa-pen-to-square"></i> 답글
	</button>
`;

const reviewUpdatable = `
<button class="btn btn-light btn-sm review-update-show-btn">
	<i class="fa-solid fa-pen-to-square"></i> 수정
</button>
<button class="btn btn-light btn-sm review-delete-btn">
	<i class="fa-solid fa-times"></i> 삭제
</button> `;

function showUpdateReview(e) {
	const reviewEl = $(this).closest('.review');
	const no = reviewEl.data("no");
	
	const contentEl = reviewEl.find('.review-content');
	const review = {no, content:contentEl.html().trim()}; //trim()은 앞뒤 공백을 제거해줌.
	
	console.log(review);
	
	contentEl.hide();
	contentEl.find('.btn-group').hide();
	
	const template = createreviewEditTemplate(review);
	const el = $(template);
	reviewEl.find('.review-body').append(el);
}

function createReviewTemplate(review, writer) {
	return `
		<div class="review my-3" data-no="${review.no}" data-writer="${review.writer}">
			<div class="review-title my-2 d-flex justify-content-between">
				<div>
					<strong class="writer">
						<img src="/security/avatar/sm/admin" class="avatar-sm"> ${review.writer}
					</strong>
					<span class="text-muted ml-3 review-date"> ${moment(review.regDate).format('YYYY-MM-DD hh:mm')} </span>
				</div>
				<div class="btn-group">
					${writer && (writer != review.writer) ? replyAddable : ''}
					${writer && (writer == review.writer) ? reviewUpdatable : ''}
				</div>
			</div>
			<div class="review-body">
				<div class="review-content">${review.content}</div>
			</div>
			<div class="reply-list ml-5"></div>
		</div>
	`;
}

function createReviewEditTemplate(review) {
	return `
		<div class="bg-light p-2 rounded review-edit-block">
			<textarea class="form-control mb-1 review-editor">${review.content}</textarea>
			<div class="text-right">
				<button class="btn btn-light btn-sm py-1 review-update-btn">
					<i class="fa-solid fa-check"></i> 확인
				</button>
				<button class="btn btn-light btn-sm py-1 review-update-cancel-btn">
					<i class="fa-solid fa-undo"></i> 취소
				</button>
			</div>
		</div>
	`;
}

async function loadReviews(rno, writer) {
   let reviews = [];
   
	// API로 불러오기
	reviews = await rest_get(REVIEW_URL); //async ~ await이 없으면 promise 객체가 되어 루프를 못돌리게 됨.
	
	for(let review of reviews) {
		const reviewEl = $(createreviewTemplate(review, writer));
		$('.review-list').append(reviewEl);
		
		let replyListEl = reviewEl.find('.reply-list');
		//답글 목록 처리
		for(let reply of review.replyList) {
			console.log(reply);
		};
	}
}

async function createReview(rno, writer) {
	const content = $('.new-review-content').val();
	
	if(!content){
		alert('내용을 입력하세요.');
		$('.new-review-content').focus();
		return;
	}
	
	if(!confirm('댓글을 추가할까요?')) return;
	let review = { rno, writer, content };
	console.log(review);
	
	// REST로 등록
	review = await rest_create(REVIEW_URL, review);
	
	//등록 성공 후DOM처리
	const reviewEl = createreviewTemplate(review, writer);
	$('.review-list').prepend($(reviewEl));
	$('.new-review-content').val(''); //기존에 입력된 것 clear 시켜줌.
	
	console.log(content);
}

async function updateReview(reviewEl, writer) {
	if(!confirm('수정할까요?')) return;
	
	const editContentEl = reviewEl.find('.review-edit-block'); //수정 창
	const content = editContentEl.find('.review-editor').val(); //수정 내용
	const no = parseInt(reviewEl.data("no"));
	
	let review = {no, writer, content};
	console.log('수정', review);
	
	//review UPDATE API 호출
	review = await rest_modify(REVIEW_URL + review.no, review);
	
	const contentEl = reviewEl.find('.review-content');
	editContentEl.remove();
	contentEl.html(review.content); //변경된 내용으로 화면 내용 수정 (새로운 내용으로 업데이트)
	contentEl.show();
	
	reviewEl.find('.btn-group').show();
}

// 댓글 수정 취소
function cancelReviewUpdate(e) {
   const reviewEl = $(this).closest('.review');
   reviewEl.find('.review-content').show();
            // .css('display', 'block');
reviewEl.find('.review-edit-block').remove();
   reviewEl.find('.btn-group').show();
}

// 댓글 삭제
async function deleteReview(e) {
	if(!confirm('댓글을 삭제할까요?')) return;
	
	const review = $(this).closest('.review')
   	const no = review.data("no");
   	
	// api 호출
	await rest_delete(REVIEW_URL + no);
	review.remove();
}

async function loadReviews(rno, writer) {
	let reviews = [];
	//API로 불러오기
	reviews = await rest_get(REVIEW_URL);
	
	for(let review of reviews) {
		const reviewEl = $(createreviewTemplate(review, writer))
		$('.review-list').append(reviewEl);
		
		let replyListEl = reviewEl.find('.reply-list');
		//답글 목록 처리
		for(let reply of review.replyList){
			let replyEl = $(createReplyTemplate(reply, writer));
			replyListEl.append(replyEl);
		}
	}
}