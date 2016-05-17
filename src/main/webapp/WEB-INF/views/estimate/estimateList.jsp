<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>
	
	<div class="container">
		<div class="row">
			<div class="col s6"><h2>견적서</h2></div>
			<div class="col s6"><button class="waves-effect waves-light btn-large right" style="margin-top: 20px;" onclick="estimateInsert()"><i class="material-icons left">cloud</i>등록</button></div>
		</div>
		<table class="striped centered">
        <thead>
          <tr>
              <th data-field="id">Name</th>
              <th data-field="name">Item Name</th>
              <th data-field="price">Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr onclick="detail(0)">
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	</div>
</main>
<script>
	function detail(no){
		location.href = '/getEstimateListByNum/'+no;
	}
	function estimateInsert(){
		location.href = '/estimateInsert';
	}
</script>