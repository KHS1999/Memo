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
		<section>
			<div id="article" class="text-center ">
				<h1 class="pt-5">회원가입</h1>
				 <input type="text" id="idInput" class="form-control  mt-3 " placeholder="아이디">
				 <input type="text"  id="passwordInput" class="form-control  mt-3" placeholder="비밀번호">
				<button  id="joinBtn" class="btn bg-primary text-white btn-block mt-3">로그인</button>		
			</div>
			<div class="text-center mt-3">
				<a href="/user/signup/view" class="text-center">회원가입</a>	
			</div>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(doucument).ready(function(){
			$("#joinBtn").on("click",function(){
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요!!");
					return;
				}
				
				if(password == ""{
					alert("비밀번호를 입력하세요!");
					return;
				})
			
				$.ajax({
					
					type:"post",
					url:"/user/sign",
					data:{"loginId":id,"password":password},
					success:funcion(){
						
						if(data.result == "success"){
							location.href=
						}else{
							alert("회원가입 실패");
						}
						
					},
					error:function(){
						alert("회원가입 에러발생!!");
					}
				})	
			});
		});
	</script>
</body>
</html>