<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>검색</title>
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
	function searchAll() {
		document.location.href = "/searchAll";
	}
	function search() {
		if (document.getElementById("word").value == "") {
			alert("내용 입력 !!!");
			return;
		}

		var sel = document.getElementById("key");
		var tmp = document.getElementById("word");
		if (sel.options[sel.selectedIndex].value == "aptname") {
			document.location.href = "/searchAptName?word="+tmp.value;
		} else if (sel.options[sel.selectedIndex].value == "dongname") {
			document.location.href = "/searchDong?word="+tmp.value;
		}
	}
	
	function pageMove(pg) { 
		document.getElementById("pg").value=pg;
		document.location.href = "/searchAll?pg=" + pg;
	}
	
	function checkpoint(aptname) {
		document.location.href = "/searchAll?aptname=apt";
	}
</script>
</head>

<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="notice"> 
		<input type="hidden" name="pg" id="pg" value="">
	</form>
	<div class="container" align="center">
	<section>
		<div>
			<div class="container" align="center">
					<h2>실거래가 목록</h2>
			</div>
		</div>
		</section>
		<section id="index_section">
				<div class="card-body" style="float: center;">
					<form id="searchform" method="get" class="form-inline" action="">
						<table class="table table-borderless">
							<tr>
								<td align="center">
								<button type="button" class="btn btn-dark" onclick="javascript:searchAll();">전체 조회</button> 
									<select class="selectpicker" data-width="100px" name="key" id="key">
										<option value="aptname" selected="selected">아파트 이름</option>
										<option value="dongname">동 이름</option>
									</select> 
									<input type="text" class="form-control-sm" placeholder="검색어 입력" name="word" id="word">
									<button type="button" class="btn btn-dark" onclick="javascript:search();">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			

			<c:forEach var="deal" items="${deals}">
				<table class="table table-active">
					<tbody>
						<tr>
							<td onclick="document.location.href='/apt.do?act=show&no=${deal.no}&aptname=${deal.aptName}'" style="cursor: pointer;"><strong>${deal.no}</strong></td>
							<td colspan="3">아파트 이름 : ${deal.aptName}</td>
						</tr>
						<tr class="table-info">
							<td colspan="1">동 : ${deal.dong}</td>
							<td colspan="2"><strong>거래액 :
									${deal.dealAmount} 거래일자 :
									${deal.dealYear}-${deal.dealMonth}-${deal.dealDay}</strong></td>
							<td colspan="1">건축년도 : ${deal.buildYear} 면적 : ${deal.area} 층 :
								${deal.floor} 지번 : ${deal.jibun}</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
			
			
			
			<table>
				<tr>
					<td>${navigation.navigator}</td>
				</tr>
			</table>
		</section>
		</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</html>