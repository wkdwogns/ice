<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main>

<div class="container">
	<div class="row">
		<div class="col s6">
			<h5>거래처 수정</h5>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/contactUpdateAction" method="post">
			<input type="hidden" id="no" name="no" value="${info.no}">
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text" id="name" name="name" class="validate" value="${info.name}" maxlength="50" length="50"> 
					<label for="first_name">거래처 명</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">phone</i>
					<input type="tel" id="text" name="tel" class="validate" value="${info.tel}" maxlength="14" length="14"> 
					<label for="disabled">전화번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">room</i>
					<input type="text" id="address" name="address" class="validate" value="${info.address}" maxlength="50" length="50"> 
					<label for="disabled">주소</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">email</i>
					<input type="email" id="email" name="email" class="validate" value="${info.email}" maxlength="45" length="45"> 
					<label for="email">이메일</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">room</i>
					<input type="tel" id="buisness" name="buisness" class="validate" value="${info.buisness}" maxlength="50" length="50"> 
					<label for="disabled">사업자</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">comment</i>
					<input type="text" id="comment" name="comment" class="validate" value="${info.comment}" maxlength="45" length="45"> 
					<label for="password">비고</label>
				</div>
			</div>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<button class="btn waves-effect waves-light" type="submit">수정<i class="material-icons right">send</i></button>
				<button class="btn waves-effect waves-light red" type="button" onclick="del(${info.no})">삭제
					<i class="material-icons right">send</i>
				</button>
			</sec:authorize>
			
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
	function del(no) {
		var letitgo = confirm('정말로 삭제하시겠습니까?');
		if(letitgo){
			location.href = '/contactDelete/'+no;
		}
		
	}
</script>
</main>
