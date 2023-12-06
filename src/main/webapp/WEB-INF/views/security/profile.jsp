<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header.jsp"%>


<%-- 개별 페이지 --%>
<style>
.row { -
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	display: flex;
	flex-wrap: wrap;
	margin-top: calc(-1 * var(- -bs-gutter-y));
	margin-right: calc(-.5 * var(- -bs-gutter-x));
	margin-left: calc(-.5 * var(- -bs-gutter-x));
	justify-content: center;
}

.profile {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.profile_title {
	margin-bottom: 40px;
}

.profile_title h1 {
	font-size: 24px;
	font-style: normal;
	font-weight: 500;
}

.inf {
	width: 800px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.profile_inf {
	width: 800px;
	display: flex;
	margin-top: 20px;
	margin: 0 auto;
	margin-bottom: 35px;
}

.box1 {
	display: flex;
}

.profile_inf .photo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile_inf .photo {
	border-radius: 70%;
	overflow: hidden;
	width: 250px;
	height: 250px;
	margin-left: 80px;
}

.profile_inf .sebu_inf {
	margin-left: 90px;
	display: flex;
	align-items: center;
}

th, td {
	padding: 10px 20px;
}

.menubox {
	width: 800px;
	display: flex;
	justify-content: space-between;
	margin: 0 auto;
}

.menu {
	display: flex;
	margin: 0 auto;
	width: 250px;
	height: 80px;
	border-radius: 3px;
	background-color: #D9D9D9;
	text-align: center;
	align-items: center;
	justify-content: space-between;
}

.menu a {
	color: #000000;
	margin: 0 auto;
	width: 100%;
}


.main-profile {
	padding: 30px;
	padding-top: 72px;
}

.main-profile .main-info span {
	font-size: 18px;
	color: #252525;
	padding: 1px 0;
	display: inline-block;
	border-radius: 25px;
	font-weight: 700;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	margin-bottom: 5px;
}

.main-profile h2 {
	color: #252525;
	font-weight: 700;
	text-align: center;
	margin-bottom: 35px;
}

.main-profile .main-info h4 {
	color: #252525;
	font-weight: 1000;
	margin-bottom: 20px;
}

.main-profile .main-info .main-border-button {
	margin-top: 25px;
}

.main-profile ul {
	border-radius: 23px;
	padding: 30px;
	border: 1px solid #FEC25E;
}

.main-profile ul li {
	width: 100%;
	font-size: 14px;
	color: #666;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #666;
}

.main-profile ul li span {
	float: right;
	font-weight: 500;
	color: #666;
}

.main-profile ul li:last-child {
	border-bottom: none;
	padding-bottom: 0;
	margin-bottom: 0;
}

.clips {
	margin-top: 30px;
}

.clips .heading-section {
	margin-top: 30px;
}

.clips .menu {
	border-radius: 23px;
	padding: 30px 15px;
	background-color: #D9D9D9;
	margin-bottom: 30px;
}

.clips .item .thumb {
	position: relative;
	border-radius: 23px;
	margin-bottom: 15px;
	border: 1px solid #D9D9D9;
	padding: 30px 0;
	background-color: #D9D9D9;
}

/* .clips .item .thumb:hover { */
/* 	position: relative; */
/* 	border-radius: 23px; */
/* 	margin-bottom: 15px; */
/* 	border: 1px solid #FEC25E; */
/* 	padding: 30px 0; */
/* 	background-color: #FEC25E; */
/*     transition-duration: 0.3s; */
/* } /* hover시 배경 오렌지 */ 

.clips .item .thumb:hover {
	position: relative;
	border-radius: 23px;
	margin-bottom: 15px;
	border: 1px solid #FEC25E;
	padding: 30px 0;
	background-color: #ffffff;
    transition-duration: 0.3s;
} /* hover시 배경 하얀색 */

.clips .item .thumb:hover >a {
	color: #FEC25E;
}


.clips .item .thumb a {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border-radius: 23px;
	display: inline-block;
	text-align: center;
	line-height: 46px;
	color: black;
	padding: 0px 15px;
	overflow: hiddlen;
  	white-space: nowrap;
}

.clips .item h4 {
	font-size: 15px;
	display: inline-block;
}

.clips .item span i {
	color: #ec6090;
}

.clips .item span {
	float: right;
	color: #fff;
	font-size: 14px;
}

.clips .main-button {
	margin-top: 10px;
	text-align: center;
}

.align-self-center{
	border: 
}

/* 
---------------------------------------------
Responsive Style
--------------------------------------------- 
*/
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>

 <div class="container profilecon">
    <div class="row">
      <div class="col-lg-9">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
              <h2>프로필</h2>
                <div class="row">
                  <div class="col-lg-4" style="text-align:center;">
                    <img src="/security/avatar/lg/${member.username}" alt="" style="border-radius: 23px; object-fit:cover;" width="250" height="250">
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text" style="text-align:center;">
                      <span>안녕하세요!</span>
                      <h4>${member.name} 님</h4>
                    </div>
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <ul>
                      <li>아이디 <span>${member.username}</span></li>
                      <li>이메일 <span>${member.email}</span></li>
                      <li>전화 번호 <span>${member.phone}</span></li>
<!--                       <li>즐겨찾기 수 <span>None</span></li> -->
<!--                       <li>리뷰 수 <span>29</span></li> -->
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="heading-section">
                          </div>
                        </div>
                        <div class="col-lg-4 col-sm-6" style="text-align:center;">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/clip-01.jpg" alt="" style="border-radius: 23px;">
                              <a href="/security/check_pwd">회원 정보 수정</a>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-4 col-sm-6" style="text-align:center;">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/clip-02.jpg" alt="" style="border-radius: 23px;">
                              <a href="/mypage/main">마이 페이지</a>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-4 col-sm-6" style="text-align:center;">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/clip-03.jpg" alt="" style="border-radius: 23px;">
                              <a href="/security/remove_view">회원 탈퇴</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->
        </div>
      </div>
    </div>
  </div>


<!-- <div class="container"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-lg-9 "> -->
<!-- 			<div class="page-content"> -->
<!-- 				***** Banner Start ***** -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-9"> -->
<!-- 						<div class="main-profile "> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-lg-3"> -->
<%-- 									<img src="/security/avatar/lg/${member.username}" alt="" --%>
<!-- 										style="border-radius: 23px;"> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-3 align-self-center"> -->
<!-- 									<div class="main-info header-text"> -->
<%-- 										<h4>${member.name} --%>
<!-- 											님, <br> 안녕하세요! -->
<!-- 										</h4> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-3 align-self-center"> -->
<!-- 									<ul> -->
<%-- 										<li>아이디<span>${member.username}</span></li> --%>
<%-- 										<li>휴대폰 번호<span>${member.phone}</span></li> --%>
<%-- 										<li>이메일<span>${member.email}</span></li> --%>
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="row"> -->
<!--                   <div class="col-lg-9"> -->
<!--                     <div class="clips"> -->
<!--                       <div class="row"> -->
<!--                         <div class="col-lg-3 col-sm-6"> -->
<!--                           <div class="item"> -->
<!--                             <div class="thumb"> -->
<!--                               <img src="assets/images/clip-01.jpg" alt="" style="border-radius: 23px;"> -->
<!--                               <a href="/security/check_pwd">회원 정보 수정</a> -->
<!--                             </div> -->
<!--                             <div class="down-content"> -->
<!--                               <h4>First Clip</h4> -->
<!--                               <span><i class="fa fa-eye"></i> 250</span> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-3 col-sm-6"> -->
<!--                           <div class="item"> -->
<!--                             <div class="thumb"> -->
<!--                               <img src="assets/images/clip-02.jpg" alt="" style="border-radius: 23px;"> -->
<!--                               <a href="/mypage/main">마이 페이지</a> -->
<!--                             </div> -->
<!--                             <div class="down-content"> -->
<!--                               <h4>Second Clip</h4> -->
<!--                               <span><i class="fa fa-eye"></i> 183</span> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="col-lg-3 col-sm-6"> -->
<!--                           <div class="item"> -->
<!--                             <div class="thumb"> -->
<!--                               <a href="/security/remove_view">회원 탈퇴</a> -->
<!--                             </div> -->
<!--                             <div class="down-content"> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-lg-9"> -->
<!-- 									<div class="menubox set"> -->
<!-- 										<div class="menu update col-lg-3 col-sm-6" > -->
<!-- 											<a href="/security/check_pwd">회원 정보 수정</a> -->
<!-- 										</div> -->
<!-- 										<div class="menu mypage col-lg-3 col-sm-6"> -->
<!-- 											<a href="/mypage/main">마이 페이지</a> -->
<!-- 										</div> -->
<!-- 										<div class="menu mypage col-lg-3 col-sm-6"> -->
<!-- 											<a href="/security/remove_view">회원 탈퇴</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				***** Banner End ***** -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



<!-- <div class="profile"> -->
<!-- 	<div class="inf"> -->
<!-- 		<div class="profile_title"> -->
<!-- 			<h1>프로필</h1> -->
<!-- 		</div> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="profile_inf"> -->
<!-- 				<div class="photo"> -->
<%-- 					<img src="/security/avatar/lg/${member.username}" /> --%>
<!-- 				</div> -->

<!-- 				<div class="sebu_inf"> -->
<!-- 					<table border="1"> -->
<!-- 						<tr> -->
<!-- 							<th>아이디</th> -->
<%-- 							<td>${member.username}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>이름</th> -->
<%-- 							<td>${member.name}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>휴대폰 번호</th> -->
<%-- 							<td>${member.phone}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>이메일</th> -->
<%-- 							<td>${member.email}</td> --%>
<!-- 						</tr> -->

<!-- 					</table> -->
<!-- 				</div> -->

<!-- 			</div> -->





<!-- 			<div class="menubox set"> -->
<!-- 				<div class="menu update"> -->
<!-- 					<a href="/security/check_pwd" >회원 정보 수정</a> -->
<!-- 				</div> -->
<!-- 				<div class="menu mypage"> -->
<!-- 					<a href="/mypage/main">마이 페이지</a> -->
<!-- 				</div>	 -->
<!-- 				<div class="menu mypage"> -->
<!-- 					<a href="/security/remove_view">회원 탈퇴</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



<%@ include file="../layouts/footer.jsp"%>