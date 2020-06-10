<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>공지 사항</title>
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
<script type="text/javascript">
	function movewrite() {
		location.href = "/mvwrite";
	}
	function pageMove(pg) { 
		document.getElementById("pg").value=pg;
		document.getElementById("pageform").action = "${root}/notice.do";
		document.getElementById("pageform").submit();
	}
</script>
<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="notice"> 
		<input type="hidden" name="pg" id="pg" value="">
	</form>
	<div class="container" align="center" style="width: 1000px;">
		<br>
		<h2>공지목록</h2>
		<p>공지사항 확인해주세요!!!!!</p>
		<table class="table table-borderless">
			<c:if test="${userinfo != null}">
				<tr>
					<td align="right"><button type="button" class="btn btn-link"
							onclick="javascript:movewrite();">글쓰기</button></td>
				</tr>
			</c:if>
		</table>
		<form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="notice">
	  <input type="hidden" name="pg" id="pg" value="1">
		<table class="table table-active">
			<tbody>
				<tr class="table-info">
					<td colspan="4"><strong>글번호</strong></td>
					<td colspan="4"><strong>제목</strong></td>
					<td colspan="4"><strong>작성자</strong></td>
					<td colspan="4"><strong>작성일</strong></td>
				</tr>
			</tbody>
			<c:if test="${list.size() != 0}">
				<c:forEach var="lists" items="${list}">
					<tbody>
						<tr class="table-info">
							<td colspan="4"><strong>${lists.no}</strong></td>
							<td colspan="4"><a href="./detail?no=${lists.no}"><strong>${lists.title}</strong></a></td>
							<td colspan="4"><strong>${lists.id}</strong></td>
							<td colspan="4"><strong>${lists.regtime}</strong></td>
						</tr>
					</tbody>
				</c:forEach>
			</c:if>
		</table>
		</form>
		<table>
			<tr>
				<td>${navigation.navigator}</td>
			</tr>
		</table>
		<c:if test="${list.size() == 0}">
			<table class="table table-active">
				<tbody>
					<tr class="table-info" align="center">
						<td>작성된 글이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</body>
</html>