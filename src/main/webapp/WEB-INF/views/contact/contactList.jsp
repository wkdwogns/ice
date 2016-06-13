<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h3>거래처</h3></div>
			<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="contactInsert()">거래처등록</button></div>
		</div>
		
		<div class="row">
			<form id="sForm" action="/contactList" method="post">
				<input type="hidden" id="pIndex" name="pIndex">
				<%-- <div class="col s6 l2"><input type="text" id="sDm" name="sDm" value="${info.sDm}" placeholder="시작일"></div>
				<div class="col s6 l2"><input type="text" id="eDm" name="eDm" value="${info.eDm}" placeholder="종료일"></div> --%>
				<div class="col s5 l7">
					<select name="search">
						<option>선택</option>
						<option value="name" <c:if test="${info.search eq 'name'}">selected</c:if>>거래처 명</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword" value="${info.searchKeyword}"></div>
				<div class="col s4 l2"><button type="submit" class="btn right">검색</button></div>
			</form>
		</div>
		
		<ul class="collection">
			<c:forEach var="contact" items="${list}">
				<li class="collection-item avatar" >
					<i class="material-icons circle" onclick="goList(${contact.no})">folder</i>
					<span class="title">${contact.no}.${contact.name}</span>
					<p class="ellip">
						<i class="material-icons">phone</i>${contact.tel}<br> 
						<i class="material-icons">email</i>${contact.email}<br>
						<i class="material-icons">location_on</i>${contact.address}
					</p>
					<a href="javascript:location.href='/contactUpdate/${contact.no}'" class="secondary-content"><i class="material-icons">grade</i></a>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<ul class="pagination center-align">
		<c:if test="${info.pNo ne  '1'}">
			<li><a href='javascript:page(${info.pNo-1});'><i class="material-icons">chevron_left</i></a></li>
		</c:if>
		<c:forEach var="idx" begin="${info.pageStart}" end="${info.pageEnd}">
			<c:if test="${idx == info.pNo}"><li class="active teal"><a>${idx}</a></li></c:if>
			<c:if test="${idx != info.pNo}"><li><a href='javascript:page(${idx});'>${idx}</a></li></c:if>
		</c:forEach>
		<c:if test="${info.pNo ne info.pageEnd}">
			<li class="waves-effect"><a href="javascript:page(${info.pNo+1});"><i class="material-icons">chevron_right</i></a></li>
		</c:if>
	</ul>
</main>

<script>
	$('select').material_select();
	function goList(no){
		location.href = '/estimateList?search=contactNo&searchKeyword='+no;
	}
	function contactInsert(){
		location.href = '/contactInsert';
	}
	function page(no){
		$('#pIndex').val(no);
		$('#sForm').submit();
	}
</script>