<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s12">
			<h3>견적서 등록</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12">
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input id="tags" type="text" class="validate" length="50"> 
					<label for="first_name">거래처 명</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="price_kr" name="price_kr" class="validate" maxlength="50" length="50"> 
					<label for="first_name">금액 한글</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="validity" name="validity" class="validate" maxlength="10" length="10"> 
					<label for="first_name">유효기간</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="deliveryDate" name="deliveryDate" class="validate" maxlength="10" length="10"> 
					<label for="first_name">deliveryDate</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="deliveryPlace" name="deliveryPlace" class="validate" maxlength="40" length="40"> 
					<label for="first_name">deliveryPlace</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="paymentType" name="paymentType" class="validate" lmaxlength="10" ength="10"> 
					<label for="first_name">paymentType</label>
				</div>
			</div>
			
			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">account_circle</i>
					<input type="text"  id="constructionDate" name="constructionDate" class="validate" maxlength="20" length="20"> 
					<label for="first_name">constructionDate</label>
				</div>
			</div>
			
			
			
			<a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
			<div class="container">
				<div class="row">
					<div class="input-field col s12">
							<div class="row">
								<div class="input-field col s10 l12">
									<input type="text"  id="title" name="title" class="validate" maxlength="100" length="100" placeholder="제목"> 
								</div>
							</div>
						
							<div class="row">
								<div class="input-field col s6">
									<input type="text" id="" class="mName" placeholder="자재명">
								</div>
								<div class="input-field col s2">
									<input type="number" id="" class="mPrice" placeholder="가격">
								</div>
								<div class="input-field col s2">
									<input type="number" id="" class="mQuantity" placeholder="수량">
								</div>
								<div class="input-field col s2">
									<input type="text" id="" class="mTotal" placeholder="합계" readonly="readonly">
								</div>
							</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10 l12">
					<i class="material-icons prefix">today</i>
					<input type="text" id="date" class="datepicker" data-role="date">
					<label for="date">기간</label>
				</div>
			</div>
			<button class="btn waves-effect waves-light" type="submit" name="action">
			    <i class="material-icons right">등록</i>
			  </button>
		</form>
	</div>
</div>
</main>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
	<script src="/resources/datepicker/js/moment.js"></script>
               
	<link rel="stylesheet" href="/resources/datepicker/css/bootstrap-material-datetimepicker.css">
	<script src="/resources/datepicker/js/bootstrap-material-datetimepicker.js"></script>
	
	
	
<script>
var availableTags = [
                     "장재훈",
                     "AppleScript",
                     "Asp",
                     "BASIC",
                     "C",
                     "C++",
                     "Clojure",
                     "COBOL",
                     "ColdFusion",
                     "Erlang",
                     "Fortran",
                     "Groovy",
                     "Haskell",
                     "Java",
                     "JavaScript",
                     "Lisp",
                     "Perl",
                     "PHP",
                     "Python",
                     "Ruby",
                     "Scala",
                     "Scheme"
                   ];

  $( "#tags" ).autocomplete({
      source: availableTags
    });
  //$(".datepicker").datepicker();
  $('.datepicker').bootstrapMaterialDatePicker({ 
	  weekStart : 0, 
	  time: false
	  });
  </script>