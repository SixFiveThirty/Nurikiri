const reviewUpdatable = `
<button class="btn btn-secondary btn-sm review-delete-btn" style="height: auto">
	<i class="fa-solid fa-times"></i> 삭제
</button> `;

function showUpdateReview(e) {
  const reviewEl = $(this).closest('.review');
  const rno = reviewEl.data('rno');

  const contentEl = reviewEl.find('.review-content');
  const review = { rno, content: contentEl.html().trim() }; //trim()은 앞뒤 공백을 제거해줌.

  console.log(review);

  contentEl.hide();
  contentEl.find('.btn-group').hide();

  const template = createReviewEditTemplate(review);
  const el = $(template);
  reviewEl.find('.review-body').append(el);
}

function createReviewTemplate(review, writer, sno) {
//function createReviewTemplate(review, writer, sno) {
  return `
		<div class="review my-3" style="background: white; border-radius: 6px; border: 4px #CCCCCC solid" data-rno="${
      review.rno
    }" data-writer="${review.writer}">
			<div class="review-title mx-2 my-2 d-flex justify-content-between">
				<div>
					<strong class="writer">
						<img src="/security/avatar/sm/${review.writer}" class="avatar-sm"> ${
    review.writer
  }
					</strong>
					<div class="rate" >
						<i class="fa-solid fa-star" style="color: #f9ba48"></i> ${review.rate} 점
					</div>
					
				</div>
				<div>
					<span class="text-muted mr-3 review-date"> 등록일: ${moment(
            review.regDate
          ).format('YYYY-MM-DD hh:mm')} </span>
					<div class="btn-group">
						${writer && writer == review.writer ? reviewUpdatable : ''}
					</div>
				</div>
			</div>
			<div class="review-body my-3 mx-5 text-right">
				<div class="review-content" onclick="uploadReview('${review.rno}')">${review.content}</div>
			</div>
			
				<!-- 리뷰 Modal 팝업창 -->
			<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
					<div class="modal-content"></div>
				</div>
			</div>
	
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

//async function createReview(sno, writer) {
async function createReview(sno, writer, fileCallPath) {
  const content = $('.new-review-content').val();
  const rate = $('.rating').val();

  if (!content) {
    alert('내용을 입력하세요.');
    $('.new-review-content').focus();
    return;
  }

  if (rate == 0) {
    alert('별점을 정해주세요.');
    $('.rating').focus();
    return;
  }

  if (!confirm('리뷰를 추가할까요?')) return;
  let review = { sno, writer, content, rate};
  console.log(review);

  // REST로 등록
  review = await rest_create(REVIEW_URL, review);

  //등록 성공 후DOM처리
  const reviewEl = createReviewTemplate(review, writer, sno);
  //const reviewEl = createReviewTemplate(review, writer, sno, fileCallPath);
  $('.review-list').prepend($(reviewEl));
  $('.new-review-content').val(''); //기존에 입력된 것 clear 시켜줌.
  $('.rating').val(0);
  console.log(content);
  console.log(rate);
}

async function updateReview(reviewEl, writer) {
  if (!confirm('수정할까요?')) return;

  const editContentEl = reviewEl.find('.review-edit-block'); //수정 창
  const content = editContentEl.find('.review-editor').val(); //수정 내용
  const rno = parseInt(reviewEl.data('rno'));

  let review = { rno, writer, content };
  console.log('수정', review);

  //review UPDATE API 호출
  review = await rest_modify(REVIEW_URL + review.rno, review);

  const contentEl = reviewEl.find('.review-content');
  editContentEl.remove();
  contentEl.html(review.content); //변경된 내용으로 화면 내용 수정 (새로운 내용으로 업데이트)
  contentEl.show();

  reviewEl.find('.btn-group').show();
}

// 리뷰 수정 취소
function cancelReviewUpdate(e) {
  const reviewEl = $(this).closest('.review');
  reviewEl.find('.review-content').show();
  // .css('display', 'block');
  reviewEl.find('.review-edit-block').remove();
  reviewEl.find('.btn-group').show();
}

// 리뷰 삭제
async function deleteReview(e) {
  if (!confirm('리뷰를 삭제할까요?')) return;

  const review = $(this).closest('.review');
  const rno = review.data('rno');

  // api 호출
  await rest_delete(REVIEW_URL + rno);
  review.remove();
}

async function loadReviews(sno, writer, REVIEW_URL) {
  let reviews = [];

  // API로 불러오기
  reviews = await rest_get(REVIEW_URL); //async ~ await이 없으면 promise 객체가 되어 루프를 못돌리게 됨.

  for (let review of reviews) {
    const reviewEl = $(createReviewTemplate(review, writer));
    $('.review-list').append(reviewEl);
  }
}
