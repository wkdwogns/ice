<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<main>
	<div class="container">
		<sec:authorize access="!isAuthenticated()">
			<div id="login-page" class="row">
			    <div class="col s12 card-panel">
			      <form class="login-form" action="/j_spring_security_check" method="post">
			        <div class="row">
			          <div class="input-field col s12">
			            <h5 class="center">한국냉동설비</h5>
			          </div>
			        </div>
			        <div class="row">
			          <div class="input-field col s12">
			          	<i class="material-icons prefix">perm_identity</i>
			            <input id="username"  name="username" type="text">
			            <label for="username">Username</label>
			          </div>
			        </div>
			        <div class="row margin">
			          <div class="input-field col s12">
			            <i class="material-icons prefix">vpn_key</i>
			            <input id="password" name="password" type="password">
			            <label for="password">Password</label>
			          </div>
			        </div>
			        <div class="row">
			          <div class="input-field col s12">
			            <input type="submit" class="btn waves-effect waves-light col s12" value="login">
			          </div>
			        </div>
			      </form>
			    </div>
			  </div>
		</sec:authorize>
	</div>
</main>