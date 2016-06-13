<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>자재 수정</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/materialUpdateAction" method="post">
			<input type="hidden" id="no" name="no" value="${info.no}">
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">shopping_cart</i>
					<input type="text" id="category" name="category" class="validate" value="${info.category}" maxlength="45" length="45" required="required"> 
					<label for="category">분류</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">shopping_cart</i>
					<input type="text" id="name" name="name" class="validate" value="${info.name}" maxlength="50" length="50" required="required"> 
					<label for="name">자재 명</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">call_made</i>
					<input type="number" id="quantity" name="quantity" class="validate" value="${info.quantity}" maxlength="11" length="11" required="required"> 
					<label for="quantity">수량</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">chat</i>
					<input type="text" id="comment" name="comment" class="validate" value="${info.comment}" maxlength="100" length="100"> 
					<label for="quantity">코멘트</label>
				</div>
			</div>
			
			<button class="btn waves-effect waves-light" type="submit">수정
				<i class="material-icons right">send</i>
			</button>
			<button class="btn red" type="button" onclick="del(${info.no})">삭제
				<i class="material-icons right">send</i>
			</button>
		</form>
	</div>
</div>
</main>

<script>
	function del(no){
		var letitgo = confirm('삭제하겠습니까?');
		if(letitgo){
			location.href='/materialDelete/'+no;
		}
		
	}
</script>