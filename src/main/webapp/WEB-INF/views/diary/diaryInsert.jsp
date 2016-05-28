<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			
			<div class="row">
				<div class="input-field col s10 l12 hide-on-large-only">
					<i class="material-icons prefix">add</i> 
					<input type="number" id="num" name="num" class="validate" maxlength="11" length="11">
					<label for="num">거래처 번호</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12 hide-on-med-and-down">
					<i class="material-icons prefix">account_circle</i> 
					<input type="text" id="name" name="name" class="validate" maxlength="45" length="45">
					<label for="name">거래처 명</label>
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
			<button class="btn waves-effect waves-light" type="submit">
				등록 <i class="material-icons right">send</i>
			</button>
		</form>
	</div>
</div>
</main>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	var availableTags = [];

	$.ajax({
		url:'/contactListAjax',
		data:{ 'temp' : '' },
		type: "post",
		dataType :'json',
		success:function(data){
			$.each(data, function( index, value ) {
				var obj = {};
				obj.value = data[index].name;
				obj.no = data[index].no;
				availableTags.push(obj);
			});	
			console.log(availableTags[0]);
			$( "#name" ).autocomplete({
		      source: availableTags,
		      select: function( event, ui ) {
		          $("#contactNo").val( ui.item.no ); 
		          return false;
		        }
		    });
		},error:function(){
			
		}	
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
  </script>