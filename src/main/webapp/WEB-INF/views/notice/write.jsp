<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<!DOCTYPE html>
<html>
<head>
<title>공지사항 작성</title>
<%@ include file="../style/page.jsp"%>
</head>
<script type="text/javascript">
	function writeNotice() {
		if (document.getElementById("title").value == "") {
			alert("제목 입력!!!!");
			return;
		} else if (document.getElementById("content").value == "") {
			alert("내용 입력!!!!");
			return;
		} else {
			alert("공지사항이 성공적으로 입력되었습니다.");
			document.getElementById("writeform").action = "${root}/writesuccess";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<br>
		<h2>공지사항 작성</h2>
		<form id="writeform" method="post" action="">
			<input type="hidden" name="act" id="act" value="write">
			<div class="form-group" align="left">
				<input type="hidden" name="id" id="id" value="${userinfo.id}">
			</div>
			<div class="form-group" align="left">
				<label for="subject">제목:</label> 
				<input type="text" class="form-control" id="title" name="title">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" class="btn btn-primary" onclick="javascript:writeNotice();">글작성</button>
			<button type="reset" class="btn btn-primary">초기화</button>
		</form>
	</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</html>