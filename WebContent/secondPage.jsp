<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../view/header.jsp"%>
<section class="content">
	<div class="container">
	<img alt="배너 이미지 입니다."
		src="http://ipsumimage.appspot.com/1062x400?l=배너" id="bannerImg">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=질문방"
						alt="..." onclick="location.href='qnalist'" />
				</div>
			</div>
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=스터디방"
						alt="..." />
				</div>
			</div>
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=리뷰방"
						alt="..." />
				</div>
			</div>
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=쇼핑방"
						alt="..." />
				</div>
			</div>
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=공채캘린더"
						alt="..." />
				</div>
			</div>
			<div class="col-md-6 col-lg-4 mb-5">
				<div class="portfolio-item mx-auto">
					<img class="img-fluid" src="http://ipsumimage.appspot.com/900x460?l=자사소개"
						alt="..." />
				</div>
			</div>
		</div>
	</div>
	<%@include file="../view/footer.jsp" %>
</section>
