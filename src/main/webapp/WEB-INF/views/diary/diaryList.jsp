<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h2>일지</h2></div>
			<div class="col s6"><button class="btn right" style="margin-top:20px;" onclick="estimateInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		
		<div class="row">
			<form id="sForm" action="/estimateList" method="post">
				<input type="hidden" id="pIndex" name="pIndex">
				<div class="col s6 l2"><input type="text" id="sDm" name="sDm" placeholder="시작일"></div>
				<div class="col s6 l2"><input type="text" id="eDm" name="eDm" placeholder="종료일"></div>
				<div class="col s5 l3">
					<select name="search">
						<option value="" disabled selected>선택</option>
						<option value="contactNo">거래처 번호</option>
						<option value="name">거래처 명</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword"></div>
				<div class="col s4 l2"><button class="btn right" onclick="estimateInsert()">검색</button></div>
			</form>
		</div>
		<table class="striped centered">
        <thead>
			<tr>
				<th data-field="contactNo">거래처 번호</th>
			    <th data-field="name">거래처명</th>
			    <th data-field="constructionDate">시공일</th>
			</tr>
        </thead>

        <tbody>
          <c:forEach var="estimate" items="${list}">
          	<tr onclick="detail(${estimate.contactNo},'${estimate.constructionDate}')" style="cursor:pointer;">
          		<td>${estimate.contactNo}</td>
	            <td>${estimate.name}</td>
	            <td>${estimate.constructionDate}</td>
			</tr>
          </c:forEach>
        </tbody>
      </table>
	</div>
	<form id="eForm" action="" method="post">
		<input type="hidden" id="constructionDate" name="constructionDate">
	</form>
</main>
<link rel="stylesheet" href="/resources/datepicker/css/bootstrap-material-datetimepicker.css">
<script src="/resources/datepicker/js/moment.js"></script>        
<script src="/resources/datepicker/js/bootstrap-material-datetimepicker.js"></script>
<script>
	$('select').material_select();
	$('#eDm').bootstrapMaterialDatePicker({ weekStart : 0 ,time:false});
	$('#sDm').bootstrapMaterialDatePicker({ weekStart : 0,time:false }).on('change', function(e, date)
	{
	$('#eDm').bootstrapMaterialDatePicker('setMinDate', date);
	});
	function detail(no,d){
		$('#constructionDate').val(d);
		$('#eForm').attr('action','/getEstimateListByNum/'+no);
		$('#eForm').submit();
	}
	function estimateInsert(){
		location.href = '/estimateInsert';
	}
</script>