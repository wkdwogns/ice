<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
   //치환 변수 선언
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6">
				<h4 id="estimateTitle"></h4>
			</div>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<div class="col s6">
					<button class="btn right red" style="margin-top: 20px; margin-right:10px;" onclick="del('${info.no}');"><i class="material-icons left">cloud</i>삭제</button>
					<button class="btn right" style="margin-top: 20px; margin-right:10px;" onclick="update('${info.no}');"><i class="material-icons left">cloud</i>수정</button>
				</div>
			</sec:authorize>
		</div>
			<div class="row">
				<div class="input-field col s6 l6">
					<h5>거래처</h5>
					<p>${info.name}</p>
				</div>
				<div class="input-field col s6 l6">
					<h5>시공일</h5>
					<p>${info.conDt}</p>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<h5>제목</h5>
					<p>${info.title}</p>
					
				</div>
			</div>

			
			<div class="row">
				<div class="input-field col s10 l12">
					<h5>내용</h5>
					<p class="light italic">${fn:replace( info.contents , crcn, br)}</p>
				</div>
			</div>
		
			
			<c:if test="${fn:length(images) ne 0}">
				<div class="carousel">
					<c:forEach var ="image" items="${images}">
						<a class="carousel-item"><img src="/img/${image.virtualNm}"></a>
					</c:forEach>
				</div>
			</c:if>
		
	</div>
</main>
<script>
$(document).ready(function(){
    $('.carousel').carousel();
  });
  
  function del(no){
	  var letitgo = confirm('삭제하시겠습니까?');
	  if(letitgo){
		  location.href='/diaryDelete/'+no;
	  }  
  }
  
  function update(no){
	  
	location.href='/diaryUpdate/'+no;
	   
  }
</script>