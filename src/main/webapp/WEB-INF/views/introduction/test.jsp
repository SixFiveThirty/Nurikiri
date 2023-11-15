<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/header.jsp"%>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
  integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
<script>
  Kakao.init('47527c077dd44e34b71ffb876f21b3cc'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="start-navigation" href="javascript:startNavigation()">
  <img src="https://developers.kakao.com/assets/img/about/buttons/navi/kakaonavi_btn_medium.png"
    alt="길 안내하기 버튼" />
</a>

<script>
  function startNavigation() {
    Kakao.Navi.start({
      name: '현대백화점 판교점',
      x: 127.11205203011632,
      y: 37.39279717586919,
      coordType: 'wgs84',
    });
  }
</script>

<%@include file="../layouts/footer.jsp"%>