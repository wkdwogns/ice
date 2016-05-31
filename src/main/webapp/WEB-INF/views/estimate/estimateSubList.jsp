<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h2>업체 견적서 이력</h2></div>
			<div class="col s6"><a class="btn right" style="margin-top:20px;" href="/excel?contactNo=${contactNo}&constructionDate=${constructionDate}"><i class="material-icons left">business</i>엑셀</a></div>
		</div>
		<table class="striped centered">
        <thead>
          <tr>
              <th data-field="id">제목</th>
              <th data-field="name">시공일</th>
          </tr>
        </thead>

        <tbody>
        <c:forEach var="estimate" items="${list}">
			<tr onclick="detail('${estimate.no}','${estimate.constructionDate}')">
				<td>${estimate.estimateTitle}</td>
				<td>${estimate.constructionDate}</td>
			</tr>
        </c:forEach>
        </tbody>
      </table>
	</div>
	<form id="eForm" action="" method="post">
		<input type="hidden" id="contactNo" name="contactNo" value="${contactNo}">
		<input type="hidden" id="constructionDate" name="constructionDate">
	</form>
</main>
<script>
	function detail(no,d){
		$('#constructionDate').val(d);
		$('#eForm').attr('action','/getDetailByNum/'+no);
		$('#eForm').submit();
	}
</script>