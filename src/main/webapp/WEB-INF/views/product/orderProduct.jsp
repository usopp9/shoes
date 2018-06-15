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
		min-height: 600px;   
	}     
	#orderP{  
		width: 40%;   
		margin: 0 auto; 
	}
	#order_h1{
		margin-top:50px; 
		margin-bottom:50px; 
		width: 100%;
		height:50px;   
		border-bottom: 1px solid #C2B7F1; 
	}
	#order_Num{
		font-size: 20px;
		font-weight: bold;
		color: #C2B7F1;  
	}
	#order_btn{
		margin-top:50px; 
		text-align: center; 
	}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
		$(function(){
			$("#shopping_btn").click(function(){
				location.href="/shoes";        
			})   
			$("#mypageId").click(function(){
				location.href="/shoes/product/mypage";      
			})
			$("#nonmember").click(function(){
				location.href="/shoes/product/nonmember";     
			})

		})   
	
	</script>    
	<section>
		<div id="orderP">  
			<h1 id="order_h1">주문완료</h1>
			<div>
				<p>주문번호 : <span id="order_Num">${orderNum}</span></p>
				<p>주문이 완료되었습니다.</p>
				<p>NekoShoes를 이용해 주셔서 감사합니다.</p>
				<br>
				<p id="order_btn">
					<button type="button" class="btn btn-default" id="shopping_btn">계속 쇼핑하기</button>
					<c:if test="${id !=null }">
						<button type="button" class="btn btn-warning" id="mypageId">마이 페이지</button>
					</c:if>	
					<c:if test="${id ==null }">		 	  
					<button type="button" class="btn btn-danger" id="nonmember">마이 페이지</button>
					</c:if>	
				</p> 
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>	
</body>
</html>