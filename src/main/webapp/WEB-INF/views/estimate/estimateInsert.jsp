<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<main>

<div class="container">
	<div class="row">
		<div class="col s12 m6">
			<h3>견적서 등록</h3>
		</div>
	</div>

	<div class="row">
		<form class="col s12">
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">account_circle</i>
					<input id="tags" type="text" class="validate" length="50"> 
					<label for="first_name">거래처 명</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">phone</i>
					<input type="tel" id="disabled" class="validate"> 
					<label for="disabled">전화번호</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">email</i>
					<input id="email" type="email" class="validate"> 
					<label for="email">이메일</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">today</i>
					<input type="date" id="date" class="datepicker" value="">
					<label for="date">기간</label>
				</div>
			</div>
			<button class="btn waves-effect waves-light" type="submit" name="action">Submit
			    <i class="material-icons right">send</i>
			  </button>
		</form>
	</div>
</div>
</main>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<script src="/resources/pickadate.js-3.5.6/lib/picker.js"></script>
  	<script src="/resources/pickadate.js-3.5.6/lib/picker.date.js"></script>
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
  $('.datepicker').pickadate({
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15 // Creates a dropdown of 15 years to control year
	  });
  </script>