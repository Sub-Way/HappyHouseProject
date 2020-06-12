<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 완료</title>
<%@ include file="../style/page.jsp"%>
</head>
<body>
<div align="center">
<div class="container" align="center">
	<br><h2>공지사항이 성공적으로 수정되었습니다.</h2>
	<br><a href="/notice">공지사항목록</a>
</div>
</div>
<%@ include file="../style/footer.jsp"%>
</body>
</html>