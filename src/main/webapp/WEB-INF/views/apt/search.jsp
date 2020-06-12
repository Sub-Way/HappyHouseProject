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
    <script type="text/javascript">
	function searchAll() {
		document.location.href = "/searchAll";
	}
	
	function search() {
		if (document.getElementById("word").value == "") {
			alert("검색어를 입력하세요.");
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
<div class="container">
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
									<select class="selectpicker" style="height:28px" data-width="100px" name="key" id="key">
										<option value="aptname" selected="selected">아파트 이름</option>
										<option value="dongname">동 이름</option>
									</select> 
									<input type="text" class="form-control-sm" style="height:28px" placeholder="검색어 입력" name="word" id="word">
									<button type="button" class="btn btn-dark" onclick="javascript:search();">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				<c:forEach var="deal" items="${deals}">
					<table id="tablesort" class="table table-active">
						<tbody>
							<tr>
								<td onclick="document.location.href='/apt.do?act=show&no=${deal.no}&aptname=${deal.aptName}'" style="cursor: pointer;"><strong>${deal.no}</strong></td>
								<td colspan="3">${deal.aptName}</td>
							</tr>
							<tr class="table-info">
								<td colspan="1">${deal.dong}</td>
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