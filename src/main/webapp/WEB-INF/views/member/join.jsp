<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>NekoShoes</title>
</head>
<style>
	section{
		width: 40%;
		min-height: 800px;
		margin: 0 auto;  
	}  
	#joinStH1{
		border-bottom: 2px solid purple;  
		padding: 5px;
	}
	#cId, #cName,#phone1,#phone2,#phone3{
		width: 150px !important;   
	}
	#cPassword, #checkcPassword, #cBirth,#mail1,#mail2,#mail3,#add1{
		width: 200px !important;     
	}
	#phone1,#phone2,#phone3,#cId,#mail1,#mail2,#mail3,#add1{  
		display: inline-block;   
	}
	#add2,#add3{
		width: 600px !important;     
		margin-top: 10px !important;      
	}
	#btn_last{
		margin-top:30px;
		text-align: center;
	}
	.sub{
		display:inline-block;
		margin: 5px;
		color:#5F00FF;
		font-size: 8px;  
	}
</style>

<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
	$(function(){
		
		/* 중복체크 */
		var idchk = false;
		
		$("#duplicationBtn").click(function(){
			var id = $("#cId").val();
			
			var idReg=/^[a-z0-9]{6,12}$/i;
			if(idReg.test(id)==false || id.length==0){
				$("#cId").val(""); 
				alert("사용할 수 없는 아이디입니다.");
				 
				return;    
			}   		
			
				$.ajax({ 
					type:"get",
					url:"${pageContext.request.contextPath}/member/duplication?id="+id,      
					dataType:"json",    
					success:function(result){			
		               if(result == true){
		            	   alert("사용할 수 있는 아이디입니다.");   
		            	   idchk = true;
		               }else{
		            	   alert("사용할 수 없는 아이디입니다.");
		            	   $("#cId").val(""); 
		            	   return;
		               }
					}
				})		
			})
			
			$("#joinBtn").click(function(){
				if(idchk==false){
					alert("중복체크를 해주세요.");
					return;
				}
				/* 이름체크 */
				var name = $("#cName").val();
				if(name.length==0){
					alert("이름을 입력하세요.");
					return;  
				}
				
				/* 비밀번호확인  */
				var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%*-]).{10,16}$/i;
				   
				$("#cPassword").on("keyup", function() { 
					alert("ddd");  
					var password = $("#cPassword").val();  
					if(passReg.test(password)==false){
						$("#cPassword").val("");
						alert("정규식 사용");		      
					}		    
				}); 
				
			})
			
			
			
	})
</script>
	<section>
		<h1 id="joinStH1">회원가입</h1>    
		<form action="">
			<!-- <div class="form-group"> -->
			  	<div class="form-group">
				  <label for="cId">아이디</label><br>   
				  <input type="text" class="form-control" id="cId">   
				  <button type="button" class="btn btn-danger" id="duplicationBtn">중복체크</button><br>
				  <span class="sub">＊ 6-12자 이내로 입력하세요.</span>
				</div>
				<div class="form-group">
				  <label for="cName">이름</label>
				  <input type="text" class="form-control" id="cName">
				</div>
			     <div class="form-group">
				  <label for="cPassword">비밀번호 </label>
				  <input type="password" class="form-control" id="cPassword">
				  <span class="sub">＊ 10~16자리 영문+숫자+특수문자[불가능문자:^,;,:,&,',',/]</span>
				</div>
				<div class="form-group">
				  <label for="checkcPassword">비밀번호 확인</label>
				  <input type="password" class="form-control" id="checkcPassword">
				  <span class="sub">＊ 입력 오류 방지를 위하여 똑같이 한번 더 입력합니다.</span>
				</div>
			  	<div class="form-group">
				  <label for="cBirth">생년월일</label>
				  <input type="date" class="form-control" id="cBirth">
				</div>
				<div class="form-group">
				   <label for="phone2">전화번호</label><br> 
					  <select class="form-control" id="phone1">
					    <option>010</option>
					    <option>000</option>
					    <option>011</option>
					  </select>
					  -
				  <input type="text" class="form-control" id="phone2"> -
				  <input type="text" class="form-control" id="phone3">
				</div>
				<div class="form-group">
					<label for="mail1">메일</label><br>
				 	<input type="text" class="form-control" id="mail1"> @
				 	<input type="text" class="form-control" id="mail2">
				 	<select class="form-control" id="mail3">
					    <option>직접입력</option>
						<option>naver.com</option>
						<option>chol.com</option>
						<option>dreamwiz.com</option>
						<option>empal.com</option>
						<option>freechal.com</option>
						<option>gmail.com</option>
						<option>hanafos.com</option>
						<option>hanmail.net</option>
						<option>hanmir.com</option>
						<option>hitel.net</option>
						<option>hotmail.com</option>
						<option>korea.com</option>
						<option>lycos.co.kr</option>
						<option>nate.com</option>
						<option>netian.com</option>
						<option>paran.com</option>
					  </select>
				</div>
				<div class="form-group">
					  <label for="add1">주소</label><br>
					  <input type="password" class="form-control" id="add1">
					  <button type="button" class="btn btn-success">주소찾기</button>
					  <input type="password" class="form-control" id="add2">
					  <input type="password" class="form-control" id="add3">
				</div>
			  <!-- </div> -->  
			 <div class="form-group" id="btn_last">
				<button type="button" class="btn btn-primary" id="joinBtn">회원가입</button>
				<button type="button" class="btn btn-default">취소</button>
			 </div>
		</form>
	</section>
	<%@ include file="../include/footer.jsp"%>
</html>