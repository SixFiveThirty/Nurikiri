<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../../layouts/header.jsp"%>

 <div class="d-flex">
        <div class="me-2 " style="width:150px">
            <select class="form-select" onchange="changeDropdown(this)">
                <option id="title" value="title">글 제목</option>
                <option id="content" value="content">글 내용</option>
                <option id="writer" value="username">작성자</option>
            </select>
        </div>

        <div class="input-group">
            <div class="form-outline">
                <input id="search-input" type="search" name="title" 
                       class="form-control" placeholder="검색"
                 onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}" />
            </div>
            <button id="search-button" class="btn btn-primary" onclick="searchBoard()">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
    <%@ include file="../../layouts/footer.jsp"%>