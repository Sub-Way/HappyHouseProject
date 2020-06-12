<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%
   String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>회원정보수정</title>
<%@ include file="../style/page.jsp"%>
    
</head>
 <body>
 <div class="container" style="width: 800px;">
	<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 300px;">
				<div class="card-body">

<!-- here start -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$("#addr").click(function(){//daum address
	    new daum.Postcode({
	        oncomplete: function(data) {
 	        	$("#addr").val(data.address);
	        }//oncomplete
	    }).open();
	});//click
});//ready
$(document).ready(function(){
	$("#password").change(function(){
		$("#pwd_chk_res").text("");
		if($("#password").val() == ''){
			return;
		}
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/.test($("#password").val())){            
	        $("#pwd_chk_res").text(" 비밀번호의 형식이 잘못되었습니다. 형식:(영문 대소문자+숫자+특수문자 전부 조합, 8~20자)");
	        $('#password').val('').focus();
	        return;
	    }//pwd 형식    
	});//change
	$("#pwdcheck").change(function(){
		$("#pwd_chk_res").text("");
		if($("#pwdcheck").val() == ''){
			return;
		}
		if($("#pwdcheck").val() != $("#password").val()){
			$("#pwd_chk_res").text(" 패스워드를 다시 확인해 주세요.");
			$("#pwdcheck").val('');
		}
	});//change
	$("#name").change(function(){
		$("#nm_chk_res").text("");
		if($.trim($("#name").val()) == ''){
	        $("#nm_chk_res").text(" 이름은 필수 입력입니다. 형식:(20자 이내)");
	        $('#name').val('').focus();
	        return;
		}
	});//change
	$("#phone").change(function(){
		$("#phone_chk_res").text('');
		if($("#phone").val() == ''){
			return;
		}
		var numStd = /^[0-9]+$/;
		if($("#phone").val().match(numStd)){
			//alert("ok");
		}else{
			$("#phone_chk_res").text(" 숫자만 입력 가능한 필드 입니다. 형식:(01055557777, 6~20자)");
			$("#phone").val('');
			return;
		}
	});//change
});//ready
</script>
<script>
$(document).ready(function(){
	$("#join_btn").click(function() {
		if($.trim($("#password").val()) == ''){
			alert("Password를 입력해 주세요.");
			return;
		}
		else if($.trim($("#pwdcheck").val()) == ''){
			alert("Password Confirm을 입력해 주세요.");
			return;
		}
		else if($.trim($("#name").val()) == ''){
			alert("Name을 입력해 주세요.");
			return;
		}
		else if($.trim($("#phone").val()) == ''){
			alert("CellPhone을 입력해 주세요.");
			return;
		}
		else if($.trim($("#addr").val()) == ''){
			alert("Address를 입력해 주세요.");
			return;
		}
		else {
			document.getElementById("memberform").action = "/modifysuccess";
	        document.getElementById("memberform").submit();
	        console.log("20");
	      }
	});//click
});//ready
</script>
<form id="memberform" name="memberform" method="post" action="">
	<input type="hidden" name="act" id="act" value="modify"> <br>
	<input type="hidden" name="id" id="id" value="${userinfo.id}">
	<label for="password"><strong>User Password (* 20자 이내) <span id="pwd_chk_res" class="text-danger"></span></strong></label>
	<input type="password" id="password" name="password" class="form-control mb-3" placeholder="Password" maxlength="20" required="required" />

	<label for="pwdcheck"><strong>User Password Confirm (* 20자 이내)</span></strong></label>
	<input type="password" id="pwdcheck" name="pwdcheck" class="form-control mb-3" placeholder="Password" maxlength="20" required="required" />

	<label for="name"><strong>User Name (* 10자 이내) <span id="nm_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="name" name="name" class="form-control mb-3" placeholder="Name" maxlength="10" required="required" />

	<label for="phone"><strong>User CellPhone (* 20자 이내) <span id="phone_chk_res" class="text-danger"></span></strong></label>
	<input type="text" id="phone" name="phone" class="form-control mb-3" placeholder="01055557777" maxlength="20" required="required" />

	<label for="addr"><strong>User Address (*)</strong></label>
	<input type="text" id="addr" name="addr" class="form-control mb-3" readonly="readonly" placeholder="Click!" required="required" style="cursor: pointer;"/>

	<!-- <label for="address2"><strong>User Address 2 (50자 이내)</strong></label>
	<input type="text" id="address2" name="address2" class="form-control mb-3" placeholder="주소 상세" maxlength="50" /> -->

	<button type="button" id="join_btn" class="btn btn-primary btn-block">수정완료</button>
</form>
<!-- here end -->

				</div>
			</div>
		</section>
		</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</html>