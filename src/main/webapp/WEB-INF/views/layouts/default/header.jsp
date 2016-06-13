<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="navbar-fixed">	
	<nav>
		<div class="nav-wrapper blue">
			<a href="/contactList" class="brand-logo">한국냉동</a>
			<a href="#" data-activates="sideBar" class="button-collapse"><i class="material-icons">menu</i></a>
			<ul class="right hide-on-med-and-down">
				<!-- <li><a href="/">홈</a></li> -->
				<li><a href="/contactList">거래처 관리</a></li>
				<li><a href="/estimateList">견적서 관리</a></li>
				<li><a href="/materialList">자재관리</a></li>
				<li><a href="/diaryList">일지</a></li>
				<sec:authorize access="isAuthenticated()">
					<li><a href="/j_spring_security_logout">로그아웃</a></li>
				</sec:authorize>
			</ul>
			<ul id="sideBar" class="side-nav  blue" >
				<!-- <li><a href="/" class="white-text">홈</a></li> -->
				<li><a href="/contactList" class="white-text">거래처 관리</a></li>
				<li><a href="/estimateList" class="white-text">견적서 관리</a></li>
				<li><a href="/materialList" class="white-text">자재관리</a></li>
				<li><a href="/diaryList" class="white-text">일지</a></li>
				<sec:authorize access="isAuthenticated()">
					<li><a class="white-text" href="/j_spring_security_logout">로그아웃</a></li>
				</sec:authorize>
			</ul>
		</div>
	</nav>
</div>

<script type="text/javascript">
	$(".button-collapse").sideNav();
</script>