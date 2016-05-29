<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>견적서 수정</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/estimateUpdateAction" method="post" enctype="multipart/form-data" onsubmit="return fn_submit()">
			<input type="hidden" id="no" name="no" value="${no}">
			<input type="hidden" id="contactNo" name="contactNo">
			<input type="hidden" id="contents" name="contents">
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i>
					<input type="text" id="estimateTitle" name="estimateTitle" class="validate" maxlength="45" length="45" required="required"> 
				</div>
			</div>
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text" id="name" name="name" class="validate" maxlength="50" length="50" readonly="readonly"> 
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">payment</i>
					<input type="text"  id="price_kr" name="price_kr" class="validate" maxlength="50" length="50"> 
					
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="text"  id="constructionDate" name="constructionDate" class="validate" maxlength="20" length="20" readonly="readonly"> 
					
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="number"  id="validity" name="validity" class="validate" maxlength="10" length="10"> 
					
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="number"  id="deliveryDate" name="deliveryDate" class="validate" maxlength="10" length="10"> 
					
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">room</i>
					<input type="text"  id="deliveryPlace" name="deliveryPlace" class="validate" maxlength="40" length="40"> 
					
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">payment</i>
					<input type="text"  id="paymentType" name="paymentType" class="validate" maxlength="20" length="20"> 
					
				</div>
			</div>
			
			<div class="row">
				<div class="file-field input-field col s10 l12">
					<div class="btn">
						<span>File</span>
						<input type="file" id="files" name="files" multiple>
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text" placeholder="Upload one or more files">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l10">
					<input type="text"  id="title" name="title" class="validate" maxlength="100" length="100" placeholder="제목"> 
				</div>
				<div class="input-field col s2 l2">
					<a class="btn-floating" href="javascript:add();"><i class="material-icons">add</i></a>
				</div>
			</div>
			<div id="contentList">
				<div id="rowName0" class="row">
					<div class="input-field col s7 l4">
						<input type="text" id="mName" class="validate" placeholder="자재명">
					</div>
					<div class="input-field col s3 l2">
						<input type="text" id="mUnit" class="validate" placeholder="단위">
					</div>
					<div class="input-field col s2 l1">
						<input type="number" id="mQuantity" class="validate" placeholder="수량">
					</div>
					<div class="input-field col s4 l2">
						<input type="number" id="mPrice" class="validate" placeholder="가격">
					</div>
					<div class="input-field col s4 l2">
						<input type="text" id="mTotal" class="validate" placeholder="합계" readonly="readonly" style="font-size:medium;color: black;">
					</div>					
				</div>		
			</div>
			
			<div class="row">
				<div class="input-field col s6 l6 right-align"><h5>합계</h5></div>
				<div class="input-field col s6 l6">
					<input type="text"  id="total" name="total" class="validate center-align" readonly="readonly" style="font-size:xx-large;color: black;"> 
				</div>
			</div>
			
			<button class="btn waves-effect waves-light" type="submit">수정
		    	<i class="material-icons right">send</i>
			</button>
		</form>
	</div>
</div>
</main>

<script>
	$('input').on('keydown',function(e){
		if(e.keyCode==13){e.preventDefault();} 
	});
	
	$('#rowName0').find('#mPrice').on('focusout',function(e){
		var quantity = $('#rowName0').find('#mQuantity').val();
		var price = $('#rowName0').find('#mPrice').val();
		$('#rowName0 #mTotal').val(quantity*price);
		
		var total = 0;
		$.each($('[id^=rowName]'),function(){
			var val = $(this).find('#mTotal').val();
			total +=parseInt(val);
		});
		$('#total').val(total);
	});
	
	function add(){
		var id = 'rowName'+$('#contentList > .row').length;
		var html ='<div id="'+id+'" class="row">'+
					'<div class="input-field col s7 l4">'+
						'<input type="text" id="mName" class="validate" placeholder="자재명">'+
					'</div>'+
					'<div class="input-field col s3 l2">'+
						'<input type="text" id="mUnit" class="validate" placeholder="단위">'+
					'</div>'+
					'<div class="input-field col s2 l1">'+
						'<input type="number" id="mQuantity" class="validate" placeholder="수량">'+
					'</div>'+
					'<div class="input-field col s4 l2">'+
						'<input type="number" id="mPrice" class="validate" placeholder="가격">'+
					'</div>'+
					'<div class="input-field col s4 l2">'+
						'<input type="text" id="mTotal" class="validate" placeholder="합계" readonly="readonly" style="font-size:midium;color: black;">'+
					'</div>'+
					'<div class="input-field col s4 l1">'+
						'<a class="btn-floating" href="javascript:remove('+id+');"><i class="material-icons">remove</i></a>'+
					'</div>'+
				'</div>';
		$('#contentList').append(html);
		$(id+' > #mQuantity,#mPrice').on('focusout',function(e){
			var quantity = $('#'+id).find('#mQuantity').val();
			var price = $('#'+id).find('#mPrice').val();
			$('#'+id).find('#mTotal').val(quantity*price);
			
			var total = 0;
			$.each($('[id^=rowName]'),function(){
				var val = $(this).find('#mTotal').val();
				total +=parseInt(val);
			});
			$('#total').val(total);
		});
	}

	function remove(id){
		$(id).remove();
		var total = 0;
		$.each($('[id^=rowName]'),function(){
			var val = $(this).find('#mTotal').val();
			total +=parseInt(val);
		});
		$('#total').val(total);
	}
 
	function fn_submit(){
		if($('#contactNo').val() ==''||$('#contactNo').val()==null){
			alert('거래처명을 입력해주세요');
			return false;
		}
		var arr = [];
		$('#contentList > .row').each(function(i){
			var row = {};
			row.name = $(this).find('#mName').val();
			row.unit = $(this).find('#mUnit').val();
			row.price = $(this).find('#mPrice').val();
			row.quantity = $(this).find('#mQuantity').val();
			row.total = $(this).find('#mTotal').val();
			arr.push(row);
		});
		$('#contents').val(JSON.stringify(arr));
		
		return true;
	}
	
	$.ajax({
		url:'/getDetailByNumAjax',
		data:{ 'no' : '${no}' },
		type: "post",
		dataType :'json',
		success:function(data){
			$('#estimateTitle').val(data.estimateTitle);
			$('#name').val(data.name);
			$('#price_kr').val(data.price_kr);
			$('#validity').val(data.validity);
			$('#deliveryDate').val(data.deliveryDate);
			$('#deliveryPlace').val(data.deliveryPlace);
			$('#paymentType').val(data.paymentType);
			$('#constructionDate').val(data.constructionDate);
			$('#contactNo').val(data.contactNo);
			$('#total').val(data.total);
			$('#title').val(data.title);
			var obj = jQuery.parseJSON( data.contentList );
			var html = '';
			for(i in obj){
				var id = 'rowName'+i;
				html +='<div id="'+id+'" class="row">'+
				'<div class="input-field col s7 l4">'+
					'<input type="text" id="mName" class="validate" value="'+obj[i].name+'" placeholder="자재명">'+
				'</div>'+
				'<div class="input-field col s3 l2">'+
					'<input type="text" id="mUnit" class="validate" value="'+obj[i].unit+'" placeholder="단위">'+
				'</div>'+
				'<div class="input-field col s2 l1">'+
					'<input type="number" id="mQuantity" class="validate" value="'+obj[i].quantity+'" placeholder="수량">'+
				'</div>'+
				'<div class="input-field col s4 l2">'+
					'<input type="number" id="mPrice" class="validate" value="'+obj[i].price+'" placeholder="가격">'+
				'</div>'+
				'<div class="input-field col s4 l2">'+
					'<input type="text" id="mTotal" class="validate" value="'+obj[i].total+'" placeholder="합계" readonly="readonly" style="font-size:midium;color: black;">'+
				'</div>'+
				'<div class="input-field col s4 l1">'+
					'<a class="btn-floating" href="javascript:remove('+id+');"><i class="material-icons">remove</i></a>'+
				'</div>'+
			'</div>';
			}
		   $('#contentList').html(html);
		   $(id+' > #mQuantity,#mPrice').on('focusout',function(e){
				var quantity = $('#'+id).find('#mQuantity').val();
				var price = $('#'+id).find('#mPrice').val();
				$('#'+id).find('#mTotal').val(quantity*price);
				
				var total = 0;
				$.each($('[id^=rowName]'),function(){
					var val = $(this).find('#mTotal').val();
					total +=parseInt(val);
				});
				$('#total').val(total);
			});
		},error:function(){
			
		}	
	});
	
  </script>
