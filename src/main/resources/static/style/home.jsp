<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/assets/img/ico/favicon.ico">
    <link rel="apple-touch-icon" sizes="144x144" href="/assets/img/ico/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/assets/img/ico/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/assets/img/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" href="/assets/img/ico/apple-touch-icon-57x57.png">

    <title>행복한 우리 집</title>

    <!-- Bootstrap Core CSS -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/plugins.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/assets/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/pe-icons.css" rel="stylesheet">
</head>
<body>
    <div class="master-wrapper">
        <div class="preloader">
            <div class="preloader-img">
                <span class="loading-animation animate-flicker"><img src="/assets/img/loading.GIF" alt="loading"/></span>
            </div>
        </div>

        <nav class="navbar navbar-default navbar-fixed-top fadeInDown" data-wow-delay="0.5s">
            <div class="top-bar smoothie hidden-xs">
                <div class="container">
                    <div class="clearfix">
                    <c:if test="${userinfo != null}">
                        <div class="pull-right text-right">
                            <ul class="list-inline">
                                <li>
                                    <div class="meta-item"><i class="fa fa-mobile"></i> ${userinfo.phone}</div>
                                </li>
                            </ul>
                        </div>
                        </c:if>
                        <c:if test="${userinfo == null}">
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="main-navigation">
                <c:if test="${userinfo == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                             <a href="/main">홈</a>
                        </li>
                       <li class="dropdown">
                             <a href="/login">로그인</a>
                        </li>
                         <li class="dropdown">
                            <a href="/join">회원가입</a>
                        </li>
                        <li class="dropdown">
                            <a href="/list">거래검색</a>
                        </li>
                        <li class="dropdown">
                        	<a href="${root}/notice.do?act=notice&pg=1">공지사항</a>
                        </li>
                        <li class="dropdown">
                        	<a href="${root}/notice/sitemap.jsp">사이트맵</a>
                       <li class="dropdown">
                       		<a href="/login" style="float:right">로그인을 해주세요!</a>
                        </li>
                        <li><a href="javascript:void(0);" class="side-menu-trigger hidden-xs"><i class="fa fa-bars"></i></a></li>
                    </ul>
                    </c:if>
                    <c:if test="${userinfo != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                             <a href="/main">홈</a>
                        </li>
                       	<li class="dropdown">
                             <a href="/logout">로그아웃</a>
                        </li>
                         <li class="dropdown">
                            <a href="/info">회원정보</a>
                        </li>
                        <li class="dropdown">
                            <a href="/list">거래검색</a>
                        </li>
                        <li class="dropdown">
                        	<a href="${root}/notice.do?act=notice&pg=1">공지사항</a>
                        </li>
                        <li class="dropdown">
                        	<a href="${root}/notice/sitemap.jsp">사이트맵</a>
                       <li class="dropdown">
                       		<a href="${root}/user/info.jsp" style="float:right" >${userinfo.id}(${userinfo.name})님 환영합니다!</a>
                        </li>
                        <li><a href="javascript:void(0);" class="side-menu-trigger hidden-xs"><i class="fa fa-bars"></i></a></li>
                    </ul>
                    </c:if>
                </div>
                <!-- /.navbar-collapse -->
                
            </div>
            <!-- /.container-fluid -->
        </nav>
		<!-- login modal start -->
		<div class="modal" id="loginModal">
			<div class="modal-dialog modal-md" style="vertical-align: middle;">
				<div class="modal-content" style="z-index: 1001;">
					<!-- ModalHeader -->
					<div class="modal-header">
						<h4 class="modal-title">LogIn</h4>
						<button type="button" class="close dataDismiss" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="mbr_id">ID:</label>
							<input type="text" id="mbr_id" class="form-control" placeholder="Enter ID">
						</div>
						<div class="form-group">
							<label for="mbr_pwd">Password:</label>
							<input type="password" id="mbr_pwd" class="form-control" placeholder="Enter Password">
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" id="modalLogInBtn" class="btn btn-primary" data-dismiss="modal">LogIn</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
        <!-- Header -->
        <header id="headerwrap" class="dark-wrapper backstretched special-max-height no-overlay">
            <div class="container vertical-center">
                <div class="intro-text vertical-center text-left smoothie">
                    <div class="intro-heading wow fadeIn heading-font" data-wow-delay="0.2s">Happy House</div>
                    <div class="intro-sub-heading wow fadeIn secondary-font" data-wow-delay="0.4s"> SSAFY 3기 임진섭, 진소라의<span class="rotate"> 노력, 결실, 작품</span></div>
                </div>
            </div>
        </header>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0616f0ba015224733d168a0bb3e20b90"></script>
		<script>
			var lat = 37.5012743;
			var lng = 127.039585;
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

        <div id="footer-wrapper" class="footer-image-bg">
            <section class="transparent-wrapper">
                <div class="section-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget about-us-widget">
                                    <div class="widget about-us-widget mb50">
                    <h4 class="widget-title">About HAPPY HOUSE</h4>
                    <p>부트스트랩을 적용하여 재미있는 화면구성과 주택 매물정보를 제공하는 사이트입니다. 회원가입을 통해 로그인을 할 수 있고, 로그인 시 공지사항 글 작성 기능을 이용할 수 있습니다. 하단의 푸터를 통해 SSAFY의 소식을 확인할 수 있습니다.</p>
                </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget">
                                    <h4 class="widget-title"><strong>인기있는 매물</strong></h4>
                                    <div>
									<div class="media">
					                        <div class="pull-left">
					                             <img class="widget-img" src="img/건양하늘터.jpg" alt="" style="width: 60px;" height="60px;">
					                        </div>
					                        <div class="media-body">
					                             <span class="media-heading"><a href="#">건양하늘터</a></span>
					                             <small class="muted">건축년도: 2006 </small>
					                        </div>
				                        </div>
				                        <div class="media">
				                            <div class="pull-left">
				                                <img class="widget-img" src="img/광화문풍림스페이스본.jpg" alt="" style="width: 60px;" height="60px;">
				                            </div>
				                            <div class="media-body">
				                                <span class="media-heading"><a href="#">광화문풍림스페이스본</a></span>
				                                <small class="muted">건축년도: 2008 </small>
				                            </div>
				                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget">
                                    <h4 class="widget-title">인기있는 동네</h4>
                                    <div class="tagcloud">
										<a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">사직동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">숭인동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">창신동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">평동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">홍파동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">견지동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">인의동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">명륜1가</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">명륜2가</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">무악동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">옥인동</a>
				                        <a href="#" class="tag-link btn btn-theme btn-white btn-xs smoothie" title="3 topics">신영동</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <footer class="white-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-left match-height">
                            <ul class="list-inline social-links wow">
                                <li>
                                    <a href="https://www.instagram.com/hellossafy/"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="https://www.ssafy.com/ksp/jsp/swp/swpMain.jsp"><i class="fa fa-internet-explorer"></i></a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/hellossafy"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="https://pf.kakao.com/_Vhxoxnxb"><i class="fa fa-comments"></i></a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-6 text-right match-height">
                            <div class="vertical-center">
                                <span class="copyright">Copyright 2020. Designed by SSAFY</span>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

    </div>

    <div class="flexpanel">
        <div class="viewport-wrap">
            <div class="viewport">
                <div class="widget mb50">
                    <h4 class="widget-title">인기많은 매물</h4>
                    <div>
                    	<div class="media">
	                        <div class="pull-left">
	                             <img class="widget-img" src="img/건양하늘터.jpg" alt="" style="width: 60px;" height="60px;">
	                        </div>
	                        <div class="media-body">
	                             <span class="media-heading"><a href="#">건양하늘터</a></span>
	                             <small class="muted">건축년도: 2006 </small>
	                        </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img class="widget-img" src="img/광화문풍림스페이스본.jpg" alt="" style="width: 60px;" height="60px;">
                            </div>
                            <div class="media-body">
                                <span class="media-heading"><a href="#">광화문풍림스페이스본</a></span>
                                <small class="muted">건축년도: 2008 </small>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img class="widget-img" src="img/현대뜨레비앙.jpg" alt="" style="width: 60px;" height="60px;">
                            </div>
                            <div class="media-body">
                                <span class="media-heading"><a href="#">현대뜨레비앙</a></span>
                                <small class="muted">건축년도: 2003</small>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img class="widget-img" src="img/경희궁의아침.jpg" alt="" style="width: 60px;" height="60px;">
                            </div>
                            <div class="media-body">
                                <span class="media-heading"><a href="#">경희궁의아침</a></span>
                                <small class="muted">건축년도: 2004</small>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img class="widget-img" src="img/신동아블루아광화문.jpg" alt="" style="width: 60px;" height="60px;">
                            </div>
                            <div class="media-body">
                                <span class="media-heading"><a href="#">신동아블루아광화문</a></span>
                                <small class="muted">건축년도: 2007</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget mb50">
                    <h4 class="widget-title"><strong>인기많은 동네</strong></h4>
                    <div class="tagcloud">
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">사직동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">숭인동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">창신동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">평동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">홍파동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">견지동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">인의동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">명륜1가</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">명륜2가</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">무악동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">옥인동</a>
                        <a href="#" class="tag-link btn btn-theme btn-xs" title="3 topics">신영동</a>
                    </div>
                </div>
                <div class="widget about-us-widget mb50">
                    <h4 class="widget-title">About HAPPY HOUSE</h4>
                    <p>부트스트랩을 적용하여 재미있는 화면구성과 주택 매물정보를 제공하는 사이트입니다. 회원가입을 통해 로그인을 할 수 있고, 로그인 시 공지사항 글 작성 기능을 이용할 수 있습니다. 하단의 푸터를 통해 SSAFY의 소식을 확인할 수 있습니다.</p>
                </div>
            </div>
        </div>
    </div>

    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/plugins.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="/assets/js/init.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
    $(document).ready(function() {
        'use strict';
        jQuery('#headerwrap').backstretch([
            "/assets/img/bg/bg1.jpg",
            "/assets/img/bg/bg2.jpg",
            "/assets/img/bg/bg3.jpg"
        ], {
            duration: 8000,
            fade: 500
        });
    });
    </script>

</body>
</html>