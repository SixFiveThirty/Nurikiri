	$(document).ready(function() {
		let searchForm = $('#searchForm');

		/* let actionForm = $('#actionForm');
		$('a.page-link').on('click', function(e) {
			e.preventDefault();//a 태그에 이벤트 걸 때, submit으로 확인하고자 할 때 쓰임.
			//alert("click event");
			// xxx.val()은 value값을 변경해주는 메서드.
			// .val($(this)) 에서 this : 이벤트 핸들러 함수 내의 this, 이벤트를 발생시킨 객체 참조.
			//자바 this : 현재 인스턴스에 대한 참조
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));//xx.find()에서 find()는 자식에게서 찾는 것이다.
			actionForm.submit();//댓글작업할때 중요한 역할을 하게 될 것임.
		});

		$('.move').on('click', function(e) { //타이틀 눌렀을 때, 상세보기로 넘어가는기능
			e.preventDefault();
			actionForm.append('<input type = "hidden" name="bno"/>');
			actionForm.find('input[name="bno"]').val($(this).attr('href'));
			actionForm.attr('action', '/board/get');
			actionForm.submit();
		}); */

		$('#searchForm button').on('click', function(e) {
			let type = searchForm.find('option:selected');
			if (!type.val()) { // :xxx -> 상태 선택자, ! = false란 뜻
				alert('검색종류를 선택하세요');
				type.focus(); //강조시킴
				return false; //submit 하지 마라
			}
			let keyword = searchForm.find('input[name="keyword"]');
			if (!keyword.val()) {
				alert('키워드를 입력하세요');
				keyword.focus(); //강조시킴
				return false; //키워드가 있으면 여러번 출력하지 말아라.
			}
			searchForm.find('input[name="pageNum"]').val('1');
			e.preventDefault();
			searchForm.submit();
		});
	});