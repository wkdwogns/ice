<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>견적서 등록</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/materialInsertAction" method="post">
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">shopping_cart</i>
					<input type="text" id="name" name="name" class="validate" maxlength="50" length="50" required="required"> 
					<label for="name">자재 명</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">call_made</i>
					<input type="number" id="quantity" name="quantity" class="validate" maxlength="11" length="11" required="required"> 
					<label for="quantity">수량</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">chat</i>
					<input type="text" id="quantity" name="quantity" class="validate" maxlength="100" length="100"> 
					<label for="quantity">코멘트</label>
				</div>
			</div>
			
			<button class="btn waves-effect waves-light" type="submit" name="action">등록
			    <i class="material-icons right">send</i>
			  </button>
		</form>
	</div>
</div>
</main>