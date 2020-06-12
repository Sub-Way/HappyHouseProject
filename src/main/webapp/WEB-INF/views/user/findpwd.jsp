<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>    
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호찾기</title>
<%@ include file="../style/page.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#registerBtn").click(function() {
		if($("#name").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#id").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#userpwd").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if($("#userpwd").val() != $("#pwdcheck").val()) {
			alert("비밀번호 확인!!!");
			return;
		} else {
			document.getElementById("memberform").action = "/findsuccess";
	        document.getElementById("memberform").submit();
		}
	});
});
</script>
</head>
<body>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="findpwd">
			<label for="id"><strong>User ID (* 20자 이내) <span id="id_chk_res"></span></strong></label>
			<input type="text" id="id" name="id" class="form-control mb-3" placeholder="ID" maxlength="20" required="required" />
			<label for="name"><strong>User Name (* 10자 이내) <span id="nm_chk_res" class="text-danger"></span></strong></label>
			<input type="text" id="name" name="name" class="form-control mb-3" placeholder="Name" maxlength="10" required="required" />
			<label for="phone"><strong>User CellPhone (* 20자 이내) <span id="phone_chk_res" class="text-danger"></span></strong></label>
			<input type="text" id="phone" name="phone" class="form-control mb-3" placeholder="01055557777" maxlength="20" required="required" />
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">입력</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="../style/footer.jsp"%>
</body>
</html>