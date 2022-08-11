<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<form id="loginForm">
		<section>
			
			<div id="article" class="text-center ">
				<h1 class="pt-5">로그인</h1>
				 <input type="text" id="idInput" class="form-control  mt-3 " placeholder="아이디">
				 <input type="password"  id="passwordInput" class="form-control  mt-3" placeholder="비밀번호">
				<button  id="loginBtn" type="submit" class="btn bg-primary text-white btn-block mt-3">로그인</button>		
			</div>
			<div class="text-center">
				<a href="/user/signup/view" class="text-center">회원가입</a> 	
			</div>	
		</section>
		</form>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit",function(e){
				
				// 해당하는 이벤트에 포함된 모든 기능을 중단한다!!
				e.preventDefault();
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요!!");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요!");
					return;
				}
			
				$.ajax({
					
					type:"post",
					url:"/user/signin",
					data:{"loginId":id,"password":password},
					success:function(data){
						
						if(data.result == "success"){
							location.href="/post/list/view";
						}else{
							alert("아이디/비밀번호를 확인해주세요!!");
						}
						
					},
					error:function(){
						alert("로그인 에러!!");
					}
				});	
			});
		});
	</script>
</body>
</html>