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
                                    <h4 class="widget-title"><strong>인기많은 매물</strong></h4>
                                    <div>
										<c:if test="${topapt.size() != 0}">
											<c:forEach var="apt" items="${topapt}">
											<div class="media">
					                        <div class="pull-left">
					                             <img class="widget-img" src="img/${apt.aptName}.jpg" onerror="this.src='img/no_imagel.jpg'" alt="" style="width: 60px;" height="60px;">
					                        </div>
					                        <div class="media-body">
					                              <span class="media-heading"><a href="${root}/showDetail?no=${apt.no}&reqPageNo=0">${apt.aptName}</a></span>
					                              <small class="muted">거래번호: ${apt.no} </small>
					                              <small class="muted">건축년도: ${apt.buildYear} </small>
					                        </div>
				                        </div>
											</c:forEach>
										</c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget">
                                    <h4 class="widget-title">인기많은 동네</h4>
                                    <div class="tagcloud">
                                       	<c:if test="${topdong.size() != 0}">
											<c:forEach var="dong" items="${topdong}">
												<a href="${root}/pagemv?key=dongname&word=${dong.dong }&reqPageNo=0" class="tag-link btn btn-theme btn-xs" title="3 topics">${dong.dong}</a>
											</c:forEach>
										</c:if>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</body>
</html>