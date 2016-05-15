<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<nav>
	<div class="nav-wrapper">
		<a href="#!" class="brand-logo">한국냉동</a>
		<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
		<ul class="right hide-on-med-and-down">
			<li><a href="/contactList">거래처 관리</a></li>
			<li><a href="badges.html">자재관리</a></li>
			<li><a href="collapsible.html">일지</a></li>
		</ul>
		<ul class="side-nav" id="mobile-demo">
			<li><a href="/contactList">거래처 관리</a></li>
			<li><a href="badges.html">자재관리</a></li>
			<li><a href="collapsible.html">일지</a></li>
		</ul>
	</div>
</nav>
<script type="text/javascript">
	$(".button-collapse").sideNav();
</script>