<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" >
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section id="section" class="d-flex justify-content-center ">
			<div id="article" class="text-center ">
				<h1 class="pt-5">회원가입</h1>
				 <input type="text" id="idInput" class="form-control  mt-3 " placeholder="아이디">
				 <input type="text"  id="passwordInput" class="form-control  mt-3" placeholder="비밀번호"><br>
				 <input type="password"  id="psdcheckInput"class="form-control  mt-3" placeholder="비밀번호 확인"><br>
				 <input type="text"  id="nameInput" class="form-control  mt-3" placeholder="이름"><br>
				 <input type="text"  id="emailInput" class="form-control   mt-3" placeholder="이메일">
				<button  id="joinBtn" class="btn bg-primary text-white btn-block mt-3">회원가입</button><br>
			
			</div>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			$("#joinBtn").on("click",function(){
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let psdcheck = $("#psdcheckInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == ""){
					alert("id를 입력하세요!!");
					return;
				}
				
				if(password != psdcheck ){
					alert("비밀번호가 일치하지 않습니다!");
					return;
					
				}
				
				if(name == ""){
					alert("이름을 입력하세요!!");
					return;
				}
				
				if(email == ""){
					alert("이메일을 입력하세요!!");
					return;
				}
				
				// 입력된 데이터를 회원 가입 api 로 가입을 진행한다.
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":id, "password":password, "name":name, "email":email},
					success:function(data){
						if(data.result == "success"){
							location.href = "/user/sign/view";
						}else{
							alert("회원가입 실패");
						}
					},
					error:function(){
						alert("회원가입 에러!!");
					}
				});
			});
			
		});
	</script>

</body>
</html>