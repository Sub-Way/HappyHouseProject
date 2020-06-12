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
<title>회원 가입</title>
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
	$("#id").change(function(){//id check
		$("#id_chk_res").text("");
		$("#id_chk_res").removeClass("text-primary");
		$("#id_chk_res").removeClass("text-danger");
		if($("#id").val() == ''){
			return;
		}
		if(!/^(?=.*[a-z])(?=.*[0-9]).{6,20}$/.test($("#id").val())){            
			$("#id_chk_res").text(" 아이디의 형식이 잘못되었습니다. 형식:(영문 소문자/숫자, 6~20자)");
			$("#id_chk_res").toggleClass("text-danger");
	        $('#id').focus();
	        return;
		}//id 형식
		$.post("${pageContext.request.contextPath}/BIdCheckController"
				, {command:'id_check', id_input:$("#id").val()}
				, function(data,status){
					if(status == "success"){
						if(data > 0) {
							$("#id_chk_res").text(" 이미 존재하는 ID 입니다.");
							$("#id_chk_res").addClass("text-danger");
							$('#id').focus();
						} else {
							$("#id_chk_res").text(" 사용 가능한 ID 입니다.");
							$("#id_chk_res").addClass("text-primary");
						}
					}//success
				}//function
		);
	});//change
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
		if($.trim($("#id").val()) == ''){
			alert("ID를 입력해 주세요.");
			return;
		}
		else if($.trim($("#password").val()) == ''){
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
			document.getElementById("join_form").action = "/joinsuccess";
		    document.getElementById("join_form").submit();
	      }
	});//click
});//ready
</script>
<form id="join_form" name="join_form" method="post" action="">
<!-- 	<input type="hidden" name="act" id="act" value="join"> <br> -->
	<label for="id"><strong>User ID (* 20자 이내) <span id="id_chk_res"></span></strong></label>
	<input type="text" id="id" name="id" class="form-control mb-3" placeholder="ID" maxlength="20" required="required" />

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

	<button type="button" id="join_btn" class="btn btn-primary btn-block">회원가입</button>
</form>
<!-- here end -->

				</div>
			</div>
		</section>
		</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</html>