<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
</head>
<body>
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
                                    <h4 class="widget-title">Popular Tags</h4>
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