<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/swiper/swiper.min.css">

<!-- Demo styles -->
<style>

.swiper-container {
    width: 100%;
    margin: 20px auto;
    padding-bottom:20px;
}
.swiper-slide {
    text-align: center;
    font-size: 14px;
    background: #fff;
    width: 20%;
    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
}
</style>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h3>자재</h3></div>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="materialInsert()">자재등록</button></div>
			</sec:authorize>
		</div>
		
		<div class="row">
			<form id="sForm" action="/materialList" method="post">
				<input type="hidden" id="pIndex" name="pIndex">
				<%-- <div class="col s6 l2"><input type="text" id="sDm" name="sDm" value="${info.sDm}" placeholder="시작일"></div>
				<div class="col s6 l2"><input type="text" id="eDm" name="eDm" value="${info.eDm}" placeholder="종료일"></div> --%>
				<div class="col s5 l7">
					<select name="search">
						<option>선택</option>
						<option value="category" <c:if test="${info.search eq 'category'}">selected</c:if>>분류</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword" value="${info.searchKeyword}"></div>
				
				<div class="col s5 l7">
					<select name="search2">
						<option>선택</option>
						<option value="name" <c:if test="${info.search2 eq 'name'}">selected</c:if>>자재 명</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword2" value="${info.searchKeyword2}"></div>
				
				<div class="col s4 l2"><button type="submit" class="btn right">검색</button></div>
			</form>
		</div>
		
		<!-- Swiper -->
	    <div class="swiper-container">
	        <div class="swiper-wrapper"></div>
	        <!-- Add Scrollbar -->
	        <div class="swiper-scrollbar"></div>
	    </div>
		
		<table class="striped centered highlight">
			<thead>
				<tr>
					<th data-field="category">분류</th>
					<th data-field="name">자재명</th>
					<th data-field="quantity">수량</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="material" items="${list}">
					<tr onclick="update(${material.no})">
						<td>${material.category}</td>
						<td>${material.name}</td>
						<td>${material.quantity}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<ul class="pagination center-align">
		<li><a href='javascript:page(${info.goPrev});'><i class="material-icons">chevron_left</i></a></li>
		
		<c:forEach var="idx" begin="${info.pageStart}" end="${info.pageEnd}">
			<c:if test="${idx == info.pNo}"><li class="active blue"><a>${idx}</a></li></c:if>
			<c:if test="${idx != info.pNo}"><li><a href='javascript:page(${idx});'>${idx}</a></li></c:if>
		</c:forEach>
		
		<li class="waves-effect"><a href="javascript:page(${info.goNext});"><i class="material-icons">chevron_right</i></a></li>
	</ul>
	
</main>
<script src="/resources/swiper/swiper.min.js"></script>
<script>
	$('select').material_select();
	function update(no){
		location.href = '/materialUpdate/'+no;
	}
	
	function materialInsert(){
		location.href = '/materialInsert';
	}
	
	function page(no){
		$('#pIndex').val(no);
		$('#sForm').submit();
	}
	
	$.ajax({
		url:'/materialSort',
		method:'post',
		data:{},
		success:function(data){
			console.log(data);
			var html='';
			for(var i in data){
				html+='<div class="swiper-slide"><a onclick="searching(\''+data[i].category+'\')">'+data[i].category+'</a></div>'
			}
			$('.swiper-wrapper').html(html);
			var swiper = new Swiper('.swiper-container', {
		        scrollbar: '.swiper-scrollbar',
		        scrollbarHide: true,
		        slidesPerView: 'auto',
		        centeredSlides: true,
		        spaceBetween: 30,
		        grabCursor: true
		    });
		},
		error:function(){
			
		}
	});
	
	function searching(nm){
		$('[name=search]').val('category').material_select();
		$('[name=searchKeyword]').val(nm);
		$('#sForm').submit();
	}
</script>