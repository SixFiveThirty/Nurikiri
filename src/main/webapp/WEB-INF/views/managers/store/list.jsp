<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Store List</title>


<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">가맹점 관리 페이지</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right">
                          <i class="fa fa-edit fa-fw"></i> 작성
                      </button>
                      <button type="button" class="btn btn-outline btn-primary pull-right">
                          <i class="fa fa-edit fa-fw"></i> 수정
                      </button>
                       <button id="search-button" class="btn btn-primary" onclick="searchBoard()">
                <i class="fas fa-search"></i>검색
                </button>
                  </div>
                   <div class="input-group">
            <div class="form-outline">
                <input id="search-input" type="search" name="title" 
                       class="form-control" placeholder="검색"
                 onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}" />
            </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">가맹점 관리  </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>가맹점명</th>
                                <th>소속시장</th>
                                <th>소재지</th>
                                <th>취급품목</th>
                                <th>충전식 카드</th>
                                <th>지류 취급여부</th>
                                <th>모바일 취급여부</th>
                                <th>가맹점 설명</th>
                                <th>사장님 이름</th>
                                <th>전화 번호</th>
                                <th>등록일자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="StoreAdminVO">
                            <tr>
                                <td>1</td>
                                <td>${StoreAdminVO.title}</td>
                                <td>${StoreAdminVO.market}</td>
                                <td>${StoreAdminVO.address}</td>
                                <td>${StoreAdminVO.item}</td>
                                <td>${StoreAdminVO.useRechargeCard}</td>
                                <td>${StoreAdminVO.useBill}</td>
                                <td>${StoreAdminVO.useMobile}</td>
                                <td>${StoreAdminVO.content}</td>
                                <td>${StoreAdminVO.owner}</td>
                                <td>${StoreAdminVO.phone}</td>
                                <td>${StoreAdminVO.regDate}</td>
                                <td><${fmt:formatDate pattern ="yyyy-MM-dd" value="${StoreAdminVO.updateDate}"/></td>
                            </tr>
                           </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
 

     </div>
    <%@ include file="../../layouts/footer.jsp"%>