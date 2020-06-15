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
		document.location.href = "${root}/searchAll";
	}
	
	function send(searchform){
		var sel = document.getElementById("key");
		var selstr = sel.options[sel.selectedIndex].value;
		
		searchform.key.value = selstr;
		searchform.word.value = document.getElementById("word").value;
		
		searchform.submit();
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
					<form id="searchform" method="get" class="form-inline" action="/search">
						<table class="table table-borderless">
							<tr>
								<td align="center">
								<button type="button" class="btn btn-dark" onclick="javascript:send(searchform);">전체 조회</button> 
									<select class="selectpicker" style="height:28px" data-width="100px" name="key" id="key">
										<option value="aptname" selected="selected">아파트 이름</option>
										<option value="dongname">동 이름</option>
									</select> 
									<input type="text" class="form-control-sm" style="height:28px" placeholder="검색어 입력" name="word" id="word">
									<button type="button" class="btn btn-dark" onclick="javascript:send(searchform);">검색</button>
									<input type="hidden" id="reqPageNo" name="reqPageNo" value="0">
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				<c:forEach var="deal" items="${deals}">
					<table id="tablesort" class="table table-active">
						<tbody>
							<tr>
								<td ><strong>${deal.no}</strong></td>
								<td colspan="3" onclick="document.location.href='/showDetail?no=${deal.no}'" style="cursor: pointer;">${deal.aptName}</td>
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
			<table class="table table-borderless">
				<tr>
					<td align="center">
							<a href="/pagemv?key=${pagedto.key }&word=${pagedto.word }&reqPageNo=${pagedto.reqPageNo-1}">◀이전</a>
						<c:forEach var="pageNo" begin="${startPage }" end="${lastPage}" step="1" >
							<a href="/pagemv?key=${pagedto.key }&word=${pagedto.word }&reqPageNo=${pageNo }">${pageNo}</a>
						</c:forEach>
							<a href="/pagemv?key=${pagedto.key }&word=${pagedto.word }&reqPageNo=${pagedto.reqPageNo+1}">다음▶</a>
					</td>
				</tr>
			</table>
		</section>
</div>
	<%@ include file="../style/footer.jsp"%>
</body>
</html>