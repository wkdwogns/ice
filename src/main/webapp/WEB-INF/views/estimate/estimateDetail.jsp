<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<h4>견적서 상세내용</h4>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
		<h5>거래처 명</h5>
		<p>한국냉동</p>
	</div>
</main>
<script>
	function detail(no){
		location.href = '/getDetailByNum/'+no;
	}
</script>