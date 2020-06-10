<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="ckid" value=" checked=\"checked\"" />
</c:if>
<head>
<title>로그인 화면</title>
<%@ include file="../style/page.jsp"%>
<!-- Bootstrap Core CSS -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/plugins.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/assets/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/pe-icons.css" rel="stylesheet">
<script type="text/javascript">
	function login() {
		if (document.getElementById("id").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("password").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			document.getElementById("loginform").action = "/home";
			document.getElementById("loginform").submit();
		}
	}

	function findpwd() {
		document.location.href = "/findpwd";
	}
</script>
</head>
<body>
	<br><div align="center">
		<c:if test="${userinfo == null}">
			<h4>${msg}</h4>
		</c:if>
	</div>
	<br>
	<div class="container" align="center" style="width: 800px;">
			<form id="loginform" method="post" action="">
				<input type="hidden" name="act" value="login">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="" value="${saveid}">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password" placeholder=""
						onkeydown="javascript:if(event.keyCode == 13) {login();}">
				</div>
				<div class="form-group form-check" align="right">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" id="idsave" name="idsave"
						value="saveok" ${ckid}> 아이디저장
					</label>
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary"
						onclick="javascript:login();">로그인</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:findpwd();">비밀번호찾기</button>
				</div>
			</form>
		</div>
		<%@ include file="../style/footer.jsp"%>
</body>
