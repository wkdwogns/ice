<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>일지 등록</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/diaryInsertAction" method="post" enctype="multipart/form-data" onsubmit="return fn_submit()">
			<input type="hidden" id="contactNo" name="contactNo"> 
			
			<!-- <div class="row">
				<div class="input-field col s10 l12 hide-on-large-only">
					<i class="material-icons prefix">add</i> 
					<input type="number" id="num" name="num" class="validate" maxlength="11" length="11">
					<label for="num">거래처 번호</label>
				</div>
			</div> -->
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i> 
					<input type="text" id="conDt" name="conDt" class="validate" maxlength="45" length="45" required="required">
					<label for="name">시공일</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s7 l10">
					<i class="material-icons prefix">account_circle</i>
					<input type="text" id="name" name="name" class="validate" maxlength="45" length="45" readonly="readonly" placeholder="거래처명"> 
					<!-- <label for="name">거래처 명</label> -->
				</div>
				<div class="input-field col s2 l2">
					<button type="button" class="btn-floating" onclick="openM()">검색</button>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i> 
					<input type="text" id="title" name="title" class="validate" maxlength="45" length="45" required="required">
					<label for="title">제목</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">mode_edit</i>
					<textarea id="content" name="content" class="materialize-textarea" maxlength="2000" length="2000" required="required"></textarea>
					<label for="content">내용</label>
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
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<button class="btn waves-effect waves-light" type="submit">
					등록 <i class="material-icons right">send</i>
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
	$('#conDt').bootstrapMaterialDatePicker({
		lang : 'ko',
		weekStart : 0, 
		time: false
	});

	$('input').on('keydown',function(e){
		if(e.keyCode==13){e.preventDefault();} 
	});
	
	$('#num').on('focusout',function(e){
		$('#contactNo').val( $(this).val() );
	});
	
	function fn_submit(){
		var contactNo = $('#contactNo').val();
		if(contactNo=='' || contactNo==null){
			alert('거래처명을 다시 입력하세요.');
			return false;
		}
		return true;
	}
	
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