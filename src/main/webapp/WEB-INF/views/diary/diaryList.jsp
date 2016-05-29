<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h2>일지</h2></div>
			<div class="col s6"><button class="btn right" style="margin-top:20px;" onclick="estimateInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		
		<div class="row">
			<form id="sForm" action="/diaryList" method="post">
				<input type="hidden" id="pIndex" name="pIndex">
				<div class="col s6 l2"><input type="text" id="sDm" name="sDm" value="${info.sDm}" placeholder="시작일"></div>
				<div class="col s6 l2"><input type="text" id="eDm" name="eDm" value="${info.eDm}" placeholder="종료일"></div>
				<div class="col s5 l3">
					<select name="search">
						<option>선택</option>
						<option value="title" <c:if test="${info.search eq 'title'}">selected</c:if>>제목</option>
						<option value="name" <c:if test="${info.search eq 'name'}">selected</c:if>>거레처명</option>
				    </select>
			    </div>
				<div class="col s3 l3"><input type="text" name="searchKeyword" value="${info.searchKeyword}"></div>
				<div class="col s4 l2"><button class="btn right" onclick="estimateInsert()">검색</button></div>
			</form>
		</div>
		<table class="striped centered">
        <thead>
			<tr>
				<th data-field="title">거래처</th>
				<th data-field="title">제목</th>
			    <th data-field="regDate">작성일</th>
			</tr>
        </thead>

        <tbody>
          <c:forEach var="diary" items="${list}">
          	<tr onclick="detail(${diary.no})">
          		<td>${diary.name}</td>
          		<td>${diary.title}</td>
	            <td>${diary.regDate}</td>
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
			<c:if test="${idx == info.pNo}"><li class="active teal"><a>${idx}</a></li></c:if>
			<c:if test="${idx != info.pNo}"><li><a href='javascript:page(${idx});'>${idx}</a></li></c:if>
		</c:forEach>
		<c:if test="${info.pNo ne info.pageEnd}">
			<li class="waves-effect"><a href="javascript:page(${info.pNo+1});"><i class="material-icons">chevron_right</i></a></li>
		</c:if>
	</ul>
	
	<form id="eForm" action="" method="post">
		<input type="hidden" id="no" name="no">
		<input type="hidden" id="type" name="type" value="d">
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
	function detail(no){
		$('#no').val(no);
		$('#eForm').attr('action','/diaryDetail');
		$('#eForm').submit();
	}
	function estimateInsert(){
		location.href = '/diaryInsert';
	}
	function page(no){
		$('#pIndex').val(no);
		$('#sForm').submit();
	}
</script>