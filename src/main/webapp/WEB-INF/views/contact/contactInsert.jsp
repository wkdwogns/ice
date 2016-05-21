<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s6">
			<h5>거래처 등록</h5>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/contactInsertAction" method="post">
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">account_circle</i>
					<input id="first_name" type="text" class="validate" length="50" placeholder="거래처명"> 
					<!-- <label for="first_name">거래처 명</label> -->

					<input type="text" id="name" name="name" class="validate" maxlength="50" length="50"> 
					<label for="first_name">거래처 명</label>

				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">phone</i>
					<input type="text" id="text" name="tel" class="validate" maxlength="14" length="14"> 
					<label for="disabled">전화번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">room</i>
					<input type="tel" id="address" name="address" class="validate" maxlength="50" length="50"> 
					<label for="disabled">주소</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">email</i>
					<input type="email" id="email" name="email" class="validate" maxlength="45" length="45"> 
					<label for="email">이메일</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">comment</i>
					<input type="text" id="comment" name="comment" class="validate" maxlength="50" length="50"> 
					<label for="password">비고</label>
				</div>
			</div>
			<button class="btn waves-effect waves-light" type="submit" name="action">등록
			    <i class="material-icons right">send</i>
			  </button>
		</form>
	</div>
</div>
<script>
	function goList(no) {
		location.href = '/getEstimateListByNum/' + no;
	}
	function contactInsert() {
		location.href = '/contactInsert';
	}
</script>
</main>
