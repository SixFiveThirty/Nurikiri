<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="/resources/js/search.js"></script>

<style>
#search-btn {
	background-color: #FEC25E;
}

.form-select {
	font-family: Poppins-Medium;
	font-size: 14px;
}
.form-control {
	font-family: Poppins-Medium;
	font-size: 14px;
}

.page-item {
  &:first-child {
    .page-link {
      margin-left: 0;
      @include border-left-radius($border-radius);
    }
  }
  &:last-child {
    .page-link {
      @include border-right-radius($border-radius);
    }
  }

  &.active .page-link {
    z-index: 3;
    color: $pagination-active-color;
    background-color: #FDB54D;
    border-color: #FDB54D;
  }
  .page-link {
  position: relative;
  display: block;
  padding: $pagination-padding-y $pagination-padding-x;
  margin-left: -$pagination-border-width;
  line-height: $pagination-line-height;
  color: #FDB54D;
  text-decoration: if($link-decoration == none, null, none);
  background-color: $pagination-bg;
  border: $pagination-border-width solid $pagination-border-color;
  }
</style>

<div class="d-flex justify-content-between align-items-center my-4">

		<form id='searchform' method='get' class="d-flex">
			<select name='type' class="form-select">
				<option value="I">유저ID</option>
				<option value="N">유저이름</option>
			</select> <input type='text' name='keyword' class="form-control rounded-0" />
			<button type="submit" class="btn rounded-0" id="search-btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>

</div>