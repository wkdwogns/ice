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
		<form class="col s12" action="/diaryInsertAction" method="post" enctype="multipart/form-data">
			<input type="hidden" id="contactNo" name="contactNo"> <input
				type="hidden" id="contents" name="contents">
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i> 
					<input type="text" id="title" name="title" class="validate" maxlength="45" length="45" required="required">
					<label for="title">제목</label>
				</div>
			</div>

			<div class="row">
				<div class="row">
					<div class="input-field col s10 l12">
						<i class="material-icons prefix">mode_edit</i>
						<textarea id="content" name="content" class="materialize-textarea" maxlength="2000" length="2000" required="required"></textarea>
						<label for="content">내용</label>
					</div>
				</div>
			</div>

			<div class="file-field input-field">
				<div class="btn">
					<span>File</span>
					<input type="file" id="files" name="files" multiple>
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text" placeholder="Upload one or more files">
				</div>
			</div>

			<button class="btn waves-effect waves-light" type="submit">
				등록 <i class="material-icons right">send</i>
			</button>
		</form>
	</div>
</div>
</main>



