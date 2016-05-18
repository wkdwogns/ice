<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h3>자재</h3></div>
			<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="materialInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		
		<table class="striped centered">
        <thead>
          <tr>
              <th data-field="name">자재명</th>
              <th data-field="quantity">수량</th>
          </tr>
        </thead>

        <tbody>
          <tr onclick="detail(0)">
            <td>Alvin</td>
            <td>1</td>
            
          </tr>
          <tr>
            <td>Alan</td>
            <td>2</td>
            
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>4</td>
            
          </tr>
        </tbody>
      </table>
	</div>
</main>
<script>
	function goList(no){
		location.href = '/getEstimateListByNum/'+no;
	}
	
	function contactInsert(){
		location.href = '/contactInsert';
	}
</script>