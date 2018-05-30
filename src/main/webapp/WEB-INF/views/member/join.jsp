<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>NekoShoes_회원가입</title>
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
	#phone1,#phone2,#phone3,#cId,#mail1,#mail2,#mail3,#add1,#cPassword,#checkcPassword{  
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
	#chepw,#chepw2{
		color: red;
		font-weight: bold;
		font-size: 8px; 
		margin-left: 10px;
		visibility: hidden;
	}
	.st{
		color: red;
	}
	#h5{
		font-size: 12px;     
	}  
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<body>
	<%@ include file="../include/header.jsp"%>	
	<script type="text/javascript">
	
	function PostCode(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	 $("#add1").val(data.zonecode);
	        	 $("#add2").val(data.address);       
	        }  
	    }).open();
	}
	
	
	
	
	$(function(){
		
		/* 비밀번호확인  */
		var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%*-]).{10,16}$/i;
		   
		var tfpw = false;
		$("#cPassword").on("keyup", function() { 
			var pass = $("#cPassword").val();	    	  
			if(passReg.test(pass)==false){
				$("#chepw").css("visibility","visible");	
			}else{  
				$("#chepw").css("visibility","hidden");	
			}
			
		})
		   
		$("#checkcPassword").on("keyup", function() { 
			var pass = $("#cPassword").val();	
			var ch = $("#checkcPassword").val();   
			if(pass!=ch){    
				$("#chepw2").css("visibility","visible");	
				tfpw=false;
			}else{    
				$("#chepw2").css("visibility","hidden");	
				tfpw=true;
			}  
			
		})	
		
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
			
			/* 메일확인 */
			
			$("#mail3").change(function(){
				var m = $("#mail3").val();
				$("#mail2").val(m);    
				
			})
			
			
			
			$("#joinBtn").click(function(){
							
				if(idchk==false){   
					alert("중복체크를 해주세요.");
					return false;
				}
				if(tfpw==false){
					alert("비밀번호를 확인해주세요");
					return false; 
				}
				/* 이름체크 */
				var name = $("#cName").val();
				if(name.length==0){
					alert("이름을 입력하세요.");
					return false;  
				}

				/*  생년월일  */
				var d = $("#cBirth").val();  
				if(d.length==0 || d.length!=8){
					alert("생년월일을 입력해주세요.");
					return false; 
				}      
				
				/* 휴대전화 */
				var ph1 = $("#phone1").val();
				var ph2 = $("#phone2").val();
				var ph3 = $("#phone3").val();
				
				if(ph2.length == 0 || ph3.length == 0){
					alert("전화번호를 입력해주세요.");
					return false;
				}  
				
				var phone = ph1+"-"+ph2+"-"+ph3; 
				var $input1 ="<input type='hidden' name='cPhone' value='"+phone+"'>"; 
				/* 메일 확인 */
				var m1= $("#mail1").val();    
				var m2= $("#mail2").val();    
				if(m1.length==0 || m2.length==0){
					alert("메일을 입력해주세요.");
					return false;
				}	
				var mail = m1+"@"+m2;
				var $input2 ="<input type='hidden' name='cMail' value='"+mail+"'>";
				
				/* 주소 확인 */
				var add1 = $("#add1").val();
				var add2 = $("#add2").val();
				var add3 = $("#add3").val();
				if(add1.length==0 || add3.length==0){
					alert("주소를 입력해주세요."); 
					return false; 
				}
				var add = add1+","+add2+","+add3;
			 	var $input3 ="<input type='hidden' name='cAddress' value='"+add+"'>";
				
				/* div_hidden */
				$("#div_hidden").append($input1).append($input2).append($input3);
			})
			
			
			
	})
</script>
	<section>
		<h1 id="joinStH1">회원가입 &nbsp &nbsp &nbsp <span id="h5"> <span class="st">★ </span>은 필수입력란 입니다. </span></h1>
		<form action="join" method="post">   
			<!-- <div class="form-group"> --> 
			  	<div class="form-group">      
				  <span class="st">★ </span><label for="cId"> 아이디</label><br>   
				  <input type="text" class="form-control" id="cId" name="cId">   
				  <button type="button" class="btn btn-danger" id="duplicationBtn">중복체크</button><br>
				  <span class="sub">＊ 6-12자 이내로 입력하세요.</span>
				</div>
				<div class="form-group">
				  <span class="st">★ </span><label for="cName"> 이름</label>
				  <input type="text" class="form-control" id="cName" name="cName">
				</div>
			     <div class="form-group">
				  <span class="st">★ </span><label for="cPassword"> 비밀번호 </label><br>
				  <input type="password" class="form-control" id="cPassword" name="cPassword"><span id="chepw">사용할수 없는 비밀번호입니다.</span><br>
				  <span class="sub">＊ 10~16자리 영문+숫자+특수문자[불가능문자:^,;,:,&,',',/]</span>
				</div>
				<div class="form-group">       
				  <span class="st">★ </span><label for="checkcPassword"> 비밀번호 확인</label><br> 
				  <input type="password" class="form-control" id="checkcPassword"><span id="chepw2">비밀번호가 일치하지 않습니다.</span><br>
				  <span class="sub">＊ 입력 오류 방지를 위하여 똑같이 한번 더 입력합니다.</span>
				</div>
			  <div class="form-group">
				  <span class="st">★ </span><label for="cBirth"> 생년월일</label>
				  <input type="text" class="form-control" id="cBirth" name="birth" placeholder="19900213">
				</div> 
				<div class="form-group">
				   <span class="st">★ </span><label for="phone2"> 전화번호</label><br> 
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
					<span class="st">★ </span><label for="mail1"> 메일</label><br>
				 	<input type="text" class="form-control" id="mail1" > @
				 	<input type="text" class="form-control" id="mail2" >
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
					  <span class="st">★ </span><label for="add1"> 주소</label><br>
					  <input type="text" class="form-control" id="add1" readonly="readonly">
					  <button type="button" class="btn btn-success" onclick="PostCode();">주소찾기</button>
					  <input type="text" class="form-control" id="add2" readonly="readonly" >
					  <input type="text" class="form-control" id="add3" > 
				</div>
				<div id="div_hidden"></div>
			  <!-- </div> -->  
			 <div class="form-group" id="btn_last">
				<button type="submit" class="btn btn-primary" id="joinBtn">회원가입</button>
				<button type="button" class="btn btn-default">취소</button>
			 </div>
		</form>
	</section>
	<%@ include file="../include/footer.jsp"%>
</html>