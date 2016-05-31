<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main>
	<div class="container">
		<h1 class="thin">
			Hello world!  
		</h1>
		<P>  The time on the server is ${serverTime}. </P>
		<p>현 재고량</p>
		<table class="centered">
			<thead>
				<tr>
					<th data-field="name">자재명</th>
					<th data-field="quantity">수량</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td>${material.quantity}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</main>