<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../style/page.jsp"%>
</head>
<title>공지</title>
</head>
<body>
	<div class="container" align="center" style="width: 800px;">
			<form id="loginform" method="post" action="">
				<input type="hidden" name="act" value="login"> <br>
				<div class="container" align="right" style="width: 300px;">
				<div class="form-group" align="left">
					<label for=""><strong>글번호 : </strong> ${list.no}</label>
				</div>
				<div class="form-group" align="left">
					<label for=""><strong>작성자 : </strong> ${list.id}</label>
				</div>
				<div class="form-group" align="left">
					<label for=""><strong>작성일 : </strong> ${list.regtime}</label>
				</div>
				<div class="form-group" align="left">
					<label for=""><strong>제목 : </strong>${list.title}</label>
				</div>
				<div class="form-group" align="left">
					<label for=""><strong>내용 : </strong>${list.content}</label>
				</div>
				</div>
				<div class="form-group" align="center">
					<c:if test="${userinfo != null}">
						<a href="./rewrite?no=${list.no}">게시글 수정</a>
						<a href="./remove?no=${list.no}">게시글 삭제</a>
					</c:if>
					<a href="./notice">목록으로</a>
				</div>
			</form>
		</div>
<%@ include file="../style/footer.jsp"%>
</body>
</html>