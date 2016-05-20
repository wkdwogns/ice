<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h3>거래처</h3></div>
			<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="contactInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		
		<ul class="collection">
			<c:forEach var="contact" items="${list}">
				<li class="collection-item avatar" >
					<i class="material-icons circle" onclick="goList(${contact.no})">folder</i>
					<span class="title">${contact.name}</span>
					<p class="ellip">
						<i class="material-icons">phone</i>${contact.tel}<br> 
						<i class="material-icons">email</i>${contact.email}<br>
						<i class="material-icons">location_on</i>${contact.address}
					</p>
					<a href="javascript:contactInsert();" class="secondary-content"><i class="material-icons">grade</i></a>
				</li>
			</c:forEach>
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