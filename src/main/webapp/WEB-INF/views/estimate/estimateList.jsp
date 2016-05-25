<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h2>견적서</h2></div>
			<div class="col s6"><button class="btn right" style="margin-top:20px;" onclick="estimateInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		
		<div class="row">
			<form id="sForm" action="/estimateList" method="post">
				<input type="hidden" id="pIndex" name="pIndex">
				<div class="col s6 l2"><input type="text" id="sDm" name="sDm" value="${info.sDm}" placeholder="시작일"></div>
				<div class="col s6 l2"><input type="text" id="eDm" name="eDm" value="${info.eDm}" placeholder="종료일"></div>
				<div class="col s5 l3">
					<select name="search">
						<option>선택</option>
						<option value="contactNo" <c:if test="${info.search eq 'contactNo'}">selected</c:if>>거래처 번호</option>
						<option value="name" <c:if test="${info.search eq 'name'}">selected</c:if>>거래처 명</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword" value="${info.searchKeyword}"></div>
				<div class="col s4 l2"><button type="submit" class="btn right">검색</button></div>
			</form>
		</div>
		<table class="bordered centered">
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
	
	<ul class="pagination center-align">
		<c:if test="${info.pNo ne  '1'}">
			<li><a href='javascript:page(${info.pNo-1});'><i class="material-icons">chevron_left</i></a></li>
		</c:if>
		<c:forEach var="idx" begin="${info.pageStart}" end="${info.pageEnd}">
			<c:if test="${idx == info.pNo}"><li class="active teal"><a href="#!">${idx}</a></li></c:if>
			<c:if test="${idx != info.pNo}"><li><a href='javascript:page(${idx});'>${idx}</a></li></c:if>
		</c:forEach>
		<c:if test="${info.pNo ne info.pageEnd}">
			<li class="waves-effect"><a href="javascript:page(${info.pNo+1});"><i class="material-icons">chevron_right</i></a></li>
		</c:if>
	</ul>
	
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
	function page(no){
		$('#pIndex').val(no);
		$('#sForm').submit();
	}
</script>