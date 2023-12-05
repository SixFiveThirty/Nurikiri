	$(document).ready(function() {
		let searchForm = $('#searchForm');


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