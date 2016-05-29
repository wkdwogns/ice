<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main>
	<div class="row">
		<div class="col s6">
			<h5 id="estimateTitle"></h5>
		</div>
		<div class="col s6">
			<button class="btn right red" style="margin-top: 20px; margin-right:10px;" onclick="del('${no}','${conDt}');"><i class="material-icons left">cloud</i>삭제</button>
			<button class="btn right" style="margin-top: 20px; margin-right:10px;" onclick="update('${no}');"><i class="material-icons left">cloud</i>수정</button>
		</div>
	</div>
	<div class="row">
		<div class="col s12 l6">
			<div class="card-panel teal">
				<h5 class="white-text">거래처 명</h5>
				<span id="name" class="white-text"></span>
	        </div>
	        <div class="card-panel teal">
				<h5 class="white-text">금액</h5>
				<span id="price_kr" class="white-text"></span>
	        </div>
		</div>
		<div class="col s12 l6">
			<table id="infoT" class="bordered">
	        <thead>
	          <tr>
	              <th data-field="name" class="grey-text">자재명</th>
	              <th data-field="unit">단위</th>
	              <th data-field="price">수량</th>
	              <th data-field="quantity">가격</th>
	              <th data-field="total">합계</th>
	          </tr>
	        </thead>
	        <tbody></tbody>
	      </table>
		</div>
	</div>
	<div class="row">
		<div id="total" class="col s12 l12"></div>
	</div>
	<div class="row">
		<div class="col s12 l12">
			<c:if test="${fn:length(images) ne 0}">
				<div class="carousel center">
					<c:forEach var ="image" items="${images}">
						<a class="carousel-item"><img src="/img/${image.virtualNm}"></a>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
		
	<form id="eForm" action="" method="post">
		<input type="hidden" id="no" name="no">
		<input type="hidden" id="contactNo" name="contactNo">
		<input type="hidden" id="constructionDate" name="constructionDate">
	</form>
</main>
<script>
	$(document).ready(function(){
    	$('.carousel').carousel({dist:0});
  	});
	function del(no,d){
		var letitgo = confirm('정말로 삭세하시겠습니까?');
		if(letitgo){
			$('#no').val(no);
			$('#constructionDate').val(d);
			$('#eForm').attr('action','/estimateDelete/');
			$('#eForm').submit();
		}
	}
	
	function update(no){
		$('#no').val(no);
		$('#eForm').attr('action','/estimateUpdate/');
		$('#eForm').submit();	
	}
	
	$.ajax({
		url:'/getDetailByNumAjax',
		data:{ 'no' : '${no}' },
		type: "post",
		dataType :'json',
		success:function(data){
			$('#estimateTitle').text(data.estimateTitle);
			$('#name').text(data.name);
			$('#price_kr').text(data.price_kr+' 원정');
			$('#contactNo').val(data.contactNo);
			$('#total').text('합계 : '+data.total);
			var obj = jQuery.parseJSON( data.contentList );
			var html = '';
			for(i in obj){
				html +='<tr>';
				html +='<td>'+obj[i].name+'</td>';
				html +='<td>'+obj[i].unit+'</td>';
				html +='<td>'+obj[i].quantity+'</td>';
				html +='<td>'+obj[i].price+'</td>';
				html +='<td>'+obj[i].total+'</td>';
				html +='</tr>';
			}
		   $('#infoT tbody').html(html);
		},error:function(){
			
		}	
	});
</script>