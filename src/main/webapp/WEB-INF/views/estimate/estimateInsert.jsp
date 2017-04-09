<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>견적서 등록</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/estimateInsertAction" method="post" enctype="multipart/form-data" onsubmit="return fn_submit(event)">
			<input type="hidden" id="contactNo" name="contactNo">
			<input type="hidden" id="contents" name="contents">
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i>
					<input type="text" id="estimateTitle" name="estimateTitle" class="validate" maxlength="45" length="45" required="required"> 
					<label for="estimateTitle">견적서 명</label>
				</div>
			</div>
			
			<!-- <div class="row">
				<div class="input-field col s10 l12 hide-on-large-only">
					<i class="material-icons prefix">add</i> 
					<input type="number" id="num" name="num" class="validate" maxlength="11" length="11">
					<label for="num">거래처 번호</label>
				</div>
			</div> -->
			
			<div class="row">
				<div class="input-field col s7 l10">
					<i class="material-icons prefix">account_circle</i>
					<input type="text" id="name" name="name" class="validate" maxlength="50" length="50" readonly="readonly" placeholder="거래처명"> 
					<!-- <label for="name">거래처 명</label> -->
				</div>
				<div class="input-field col s2 l2">
					<button type="button" class="btn-floating" onclick="openM()">검색</button>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">payment</i>
					<input type="text"  id="price_kr" name="price_kr" class="validate" maxlength="50" length="50"> 
					<label for="price_kr">금액 한글</label>
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="text"  id="constructionDate" name="constructionDate" class="validate" maxlength="20" length="20" required="required"> 
					<label for="constructionDate">시공일</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="number"  id="validity" name="validity" class="validate" maxlength="10" length="10"> 
					<label for="validity">견적 유효기간</label>
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">today</i>
					<input type="number"  id="deliveryDate" name="deliveryDate" class="validate" maxlength="10" length="10"> 
					<label for="deliveryDate">납품기한</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">room</i>
					<input type="text"  id="deliveryPlace" name="deliveryPlace" class="validate" maxlength="40" length="40"> 
					<label for="deliveryPlace">납품장소</label>
				</div>
				<div class="input-field col s10 l6">
					<i class="material-icons prefix">payment</i>
					<input type="text"  id="paymentType" name="paymentType" class="validate" maxlength="10" length="10"> 
					<label for="paymentType">대금 지불조건</label>
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
						<input type="text" id="mTotal" class="validate" placeholder="합계" readonly="readonly" style="font-size:medium; color: black;">
					</div>					
				</div>		
			</div>
			
			<div class="row">
				<div class="input-field col s6 l6 right-align"><h5>합계</h5></div>
				<div class="input-field col s6 l6">
					<input type="text"  id="total" name="total" class="validate center-align" value="0" readonly="readonly" style="font-size:xx-large;color: black;"> 
				</div>
			</div>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<button class="btn waves-effect waves-light" type="submit">등록
			    	<i class="material-icons right">send</i>
				</button>
			</sec:authorize>
		</form>
	</div>
</div>

<!-- Modal Structure -->
  <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>거래처 검색</h4>
      <div class="row">
		<div class="input-field col s9 l10">
			<input type="text"  id="contact" name="contact" class="validate" maxlength="40" length="40" placeholder="거래처를 입력하세요."> 
		</div>
		<div class="input-field col s3 l2">
			<button class="btn" onclick="searchC()"><i class="material-icons">search</i></button>
		</div>
	</div>
	<table id="sTable" class="bordered"></table>
    </div>
    <div class="modal-footer">
      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
  </div>
</main>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="/resources/datepicker/js/moment.js"></script>
              
<link rel="stylesheet" href="/resources/datepicker/css/bootstrap-material-datetimepicker.css">
<script src="/resources/datepicker/js/bootstrap-material-datetimepicker.js"></script>

<script>
	var availableTags = [];
	
	$('#constructionDate').bootstrapMaterialDatePicker({
		lang : 'ko',
		weekStart : 0, 
		time: false
	});
	
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
						'<input type="text" id="mTotal" class="validate" placeholder="합계" readonly="readonly">'+
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
	}
 
	function fn_submit(e){
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
	$('#num').on('focusout',function(e){
		$('#contactNo').val( $(this).val() );
		$('#name').val( 'mobile' );
	});
	
	function openM(){
		$('#modal1').openModal({
			complete: function() { $('#sTable').html(''); } // Callback for Modal close
		});
	}
	
	function searchC(){
		if($('#contact').val()==''||$('#contact').val()==null){
			alert('검색어를 입력하세요.');
			return false;
		}
		$.ajax({
			url:'/contactListAjax',
			data:{ 'contact' : $('#contact').val() },
			type: "post",
			dataType :'json',
			success:function(data){
				var html='';
				$.each(data, function( index, value ) {
					var obj = {};
					obj.value = data[index].name;
					obj.no = data[index].no;
					html+='<tr><td id="'+data[index].no+'">'+data[index].name+'</td></tr>';
					
				});	
				
				$('#sTable').html(html);
				$('#sTable tr td').on('click',function(){
					$('#contactNo').val(this.id);
					$('#name').val($(this).text());
					$('#modal1').closeModal();
				});
				
			},error:function(){
				
			}	
		});
	}
	
  </script>
