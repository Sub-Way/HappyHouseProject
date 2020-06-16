<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../style/page.jsp"%>
<title>거래 상세정보 조회</title>
</head>

<body>
	<br><br>
	<div class="container">
	
	<div id="map" style="width:100%;height:350px;" style = "align:center"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=080bb423a201009ee4d15968e7e76bd2"></script>
	<script>
	var lat = ${deal.lat}
	var lng = ${deal.lng}
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
		<br>
		<table id="tablesort" class="table table-active" style = "text-align:center">
			<tbody>
				<tr><td><strong>거래번호 </strong> </td>
				<td>${deal.no}</td></tr>
				<tr><td><strong>동 </strong> </td>
				<td>${deal.dong}</td></tr>
				<tr><td><strong>아파트 이름 </strong> </td>
				<td>${deal.aptName}</td></tr>
				<tr><td><strong>거래액</strong> </td>
				<td>${deal.dealAmount}</td></tr>
				<tr><td><strong>거래일자</strong> </td>
				<td>${deal.dealYear}-${deal.dealMonth}-${deal.dealDay}</td></tr>
				<tr><td><strong>건축년도</strong> </td>
				<td>${deal.buildYear}</td></tr>
				<tr><td><strong>면적</strong> </td>
				<td>${deal.area}</td></tr>
				<tr><td><strong>층</strong> </td>
				<td>${deal.floor}</td></tr>
				<tr><td><strong>지번</strong></td>
				<td>${deal.jibun}</td></tr>
				<tr>
				<td colspan="2" style="align:center"><button onclick="document.location.href='${root}/pagemv?key=aptname&word=${deal.aptName}&reqPageNo=${reqPageNo}'">목록</button></td>
				</tr>
			</tbody>
		</table>
	</div>
		<%@ include file="../style/footer.jsp"%>
</body>
</html>