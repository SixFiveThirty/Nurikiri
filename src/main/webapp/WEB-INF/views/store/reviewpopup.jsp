<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.btn-upload {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

#file {
  display: none;
}
 .image-box {
    width: 200px;
    height: 200px;
    object-fit: cover;
    display: block;
    margin: 20px auto;
  }
</style>

<script src="/resources/js/rest.js"></script>
<script>
	const RECEIPT_CHECK = "/api/extractText?";
	const FILE = "/Users/jeonhayoon/Downloads/OCR_TEST/receipt_test.jpeg";
	
	async function receipt() {
		await rest_receipt_post(RECEIPT_CHECK, FILE);
	}
</script>

<title>리뷰 팝업 만드는 중입니다</title>
</head>
<body>
<h4>영수증 인증이 필요한 서비스입니다.</h4>
<form action="uploadFormAction" method="post" enctype="multipart/form-data">
 <div class="wrapper">
<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box"/>
<label for="file">
	<div class="btn-upload">영수증 인증</div>
	<!-- <button type="button" class="btn-upload" onclick="receipt()">영수증 인증</button> -->
</label>
<button type="button" onclick="receipt()">rest 테스트</button>
<input type="file" name='uploadFile' id="file" accept=".png, .jpg, .jpeg">
</div>

<div class="btn-upload" herf="">다음에 할래요</div>
</form>
</body>
</html>