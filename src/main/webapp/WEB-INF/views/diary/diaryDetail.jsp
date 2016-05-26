<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div>
		<div class="row">
			<div class="col s12 l12">
				<h4 id="estimateTitle"></h4>
			</div>
		</div>
		<div class="row">
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">description</i> 
					<input type="text" id="title" name="title" class="validate" maxlength="45" length="45" value="${info.title}" required="required">
					<label for="title">제목</label>
				</div>
			</div>

			<div class="row">
				<div class="row">
					<div class="input-field col s10 l12">
						<i class="material-icons prefix">mode_edit</i>
						<textarea id="content" name="content" class="materialize-textarea" maxlength="2000" length="2000" required="required">${info.contents}</textarea>
						<label for="content">내용</label>
					</div>
				</div>
			</div>
			
			<div class="carousel">
				<c:forEach var ="image" items="${images}">
					<a class="carousel-item" href="#one!"><img src="/img/${image.virtualNm}"></a>
				</c:forEach>
			</div>
		</div>
	</div>
</main>
<script>
$(document).ready(function(){
    $('.carousel').carousel();
    
  });
</script>