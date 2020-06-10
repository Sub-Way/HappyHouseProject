<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="ckid" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
<%@ include file ="../style/page.jsp" %>
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
<div class="container" align="center" style="width: 800px;">
		<form id="loginform" method="post" action="">
		<input type="hidden"> 
			<br>
			<div class="container" align="right" style="width: 300px;">
			<div class="form-group" align="left" id="id">
				<label for=""><strong>아이디</strong> : ${userinfo.id}</label>
			</div>
			<div class="form-group" align="left">
				<label for=""><strong>이름</strong> : ${userinfo.name}</label>
			</div>
			<div class="form-group" align="left">
				<label for=""><strong>주소 : </strong>${userinfo.addr}</label>
			</div>
			<div class="form-group" align="left">
				<label for=""><strong>전화번호 : </strong>${userinfo.phone}</label>
			</div>
			</div>
			<div class="form-group" align="center">
				<a href="/modify">회원정보수정</a>
				<a href="/delete">회원탈퇴</a>
			</div>
		</form>
	</div>
<%@ include file ="../style/footer.jsp" %>
</body>
</html>