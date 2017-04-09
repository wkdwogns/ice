<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>일지 수정</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12" action="/diaryUpdateAction" method="post" enctype="multipart/form-data" onsubmit="return fn_submit()">
			<input type="hidden" id="no" name="no" value="${info.no}"> 
			<input type="hidden" id="contactNo" name="contactNo" value="${info.contactNo}">
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i> 
					<input type="text" id="conDt" name="conDt" class="validate" maxlength="45" length="45" value="${info.conDt}" disabled="disabled">
					<label for="name">시공일</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i> 
					<input type="text" id="title" name="title" class="validate" maxlength="45" length="45" value="${info.title}" required="required">
					<label for="title">제목</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">mode_edit</i>
					<textarea id="content" name="content" class="materialize-textarea" ${info.contents}maxlength="2000" length="2000" required="required">${info.contents}</textarea>
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
					수정 <i class="material-icons right">send</i>
				</button>
			</sec:authorize>
		</form>
	</div>
	
	<div class="row">
		<div class="col s10 l12">
			<table class="bordered">
				<thead>
					<tr>
						<th data-field="title">파일명</th>
					    <th data-field="regDate">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="image" items="${images}"  varStatus="status">
					<tr>
						<td>
							<a id="image_${status.index }">${image.virtualNm}</a>
						</td>
					    <td><button class="btn red" type="button" onclick="del('${image.no}','${image.virtualNm}')">삭제 <i class="material-icons right">send</i></button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Modal Structure -->
	<div id="modal1" class="modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="col s12">
					<img id="modalImg" class="responsive-img" src="">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">close</a>
		</div>
	</div>
	
	<form id="eForm" action="" method="post">
		<input type="hidden" id="updateNo" name="updateNo" value="${updateNo }">
		<input type="hidden" id="imageNo" name="imageNo">
		<input type="hidden" id=virtualNm name="virtualNm">
	</form>
</div>
</main>

<script>
	$('input').on('keydown',function(e){
		if(e.keyCode==13){e.preventDefault();} 
	});
	
	function fn_submit(){
		var contactNo = $('#contactNo').val();
		if(contactNo=='' || contactNo==null){
			alert('거래처명을 다시 입력하세요.');
			return false;
		}
		return true;
	}
	
	function del(no,nm){
		$('#imageNo').val(no);
		$('#virtualNm').val(nm);
		$('#eForm').attr('action','/imageDelete');
		$('#eForm').submit();
	}
	  
	  $('[id^=image_]').on('click',function(){
		  $('#modalImg').attr('src', '/img/'+$('#'+this.id).text() );
		  $('#modal1').openModal();
	  });
  </script>