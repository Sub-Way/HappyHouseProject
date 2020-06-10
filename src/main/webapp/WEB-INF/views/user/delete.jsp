<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 완료</title>
<%@ include file="../style/page.jsp"%>
	<!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/animate.css" rel="stylesheet">
    <link href="assets/css/plugins.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/pe-icons.css" rel="stylesheet">
</head>
<body>
<script>
$(document).ready(function(){
	$("#join_btn").click(function() {
			document.getElementById("loginform").action = "/deletesuccess";
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
			<div class="form-group" align="center">
				<button type="button" id="join_btn" class="btn btn-primary btn-block">삭제하기</button>
			</div>
		</form>
</div>
<%@ include file="../style/footer.jsp"%>
</body>
</html>