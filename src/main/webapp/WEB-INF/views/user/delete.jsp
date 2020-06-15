<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지</title>
<%@ include file="../style/page.jsp"%>
</head>
<body>
<script>
$(document).ready(function(){
	$("#join_btn").click(function() {
			document.getElementById("loginform").action = "${root}/deletesuccess";
		    document.getElementById("loginform").submit();
	  	});//click
});//ready
</script>
<div align="center">
	<form id="loginform" method="post" action="">
		<input type="hidden"> 
			<br>
			<input type="hidden" name="id" id="id" value="${userinfo.id}">
			<h2>정말로 삭제하시겠습니까?</h2>
			<div class="container" style="width: 150px;">
				<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 100px;">
				<div class="card-body">
			<div class="form-group" align="center">
				<button type="button" id="join_btn" class="btn btn-primary btn-block">삭제하기</button>
			</div>
			</div>
			</div>
			</section>
			</div>
		</form>
</div>
<%@ include file="../style/footer.jsp"%>
</body>
</html>