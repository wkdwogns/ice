<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h3>거래처</h3></div>
			<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="contactInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		${list }
		<ul class="collection">
			<li class="collection-item avatar" onclick="goList(0)">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
			<li class="collection-item avatar">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
			<li class="collection-item avatar">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
			<li class="collection-item avatar">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
			<li class="collection-item avatar">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
			<li class="collection-item avatar">
				<span class="title">거래처 이름</span>
				<p>
					<i class="material-icons">phone</i>전화번호<br> 
					<i class="material-icons">email</i>이메일<br>
					<i class="material-icons">location_on</i>주소
				</p> 
			</li>
		</ul>
	</div>
</main>
<script>
	function goList(no){
		location.href = '/getEstimateListByNum/'+no;
	}
	function contactInsert(){
		location.href = '/contactInsert';
	}
</script>