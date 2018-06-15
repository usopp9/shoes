<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NekoShoes</title>
<style type="text/css">
	section{
		width: 100%;
		min-height: 645px;       
	}          
	#non_div{
		width: 50%;
		height: 500px;  
		margin: 0 auto;  
		text-align: center;  
	}
	#non_div_h2{   
		text-align:left;     
		border-bottom: 1px solid #C2B7F1; 
		padding-bottom: 10px; 
		margin-bottom: 50px; 
	}
	.inp{   
		width: 200px !important;     
		margin: 0 auto;          
	}     
	
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
		$(function(){
			$("#nonBtn").click(function(){
				var no = $("#no").val();
				var pw = $("#pw").val();
			
				if(no.length==0 || pw.length==0){
					alert("정보를 입력해주세요.");  
					return;    
				}     
				var sendData = {no:no, pw:pw}; 
				$.ajax({ 
					type:"post",
					url:"${pageContext.request.contextPath}/header/noneOrder",   
					data: JSON.stringify(sendData), 
					dataType:"text",       
					headers:{"Content-Type":"application/json"},
					success:function(result){			
		              	console.log(result); 
		              	if(result=="fail"){
		              		alert("해당하는 주문이 존재하지 않습니다.");
		              		$("#no").val("");
		              		$("#pw").val("");
		              		return;
		              	}else{
		              		location.href="mypageDetail?no="+result;   
		              	}
					}
				})
			}) 
		})
	</script>
	<section>
		<div id="non_div">
			<h2 id="non_div_h2">비회원 주문조회</h2> 
				<div class="form-group">
				  <label for="no">주문번호</label>
				  <input type="text" class="form-control inp" id="no">
				</div>
				<div class="form-group">
				  <label for="pw">주문 비밀번호</label>  
				  <input type="password" class="form-control inp" id="pw">
				</div>
				<button type="button" class="btn btn-danger" id="nonBtn">주문조회</button> 		  		  
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>		
</body>
</html>