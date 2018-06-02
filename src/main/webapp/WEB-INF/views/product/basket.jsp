<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NekoShoes</title>
<style>
	section{
		width: 100%;
		min-height: 800px;
		margin-top:50px;   
	}
	#section_basket{
		width: 50%;
		margin: 0 auto;
		min-height: 600px;
	}
	#section_basket_h1{
		width: 100%;
		text-align: center;
		margin-bottom: 20px;  
	}
	#section_basket_table,tr{
		border-top:1px solid #EAEAEA;
		border-bottom:1px solid #EAEAEA;
		border-collapse: collapse;
		
	}
	#section_basket_table tr:FIRST-CHILD{
		background: rgba(0,0,0,0.1);   
	}
	#section_basket_table{
		width: 100%;
		text-align: center;
	}
	#section_basket_table img{
		width: 100px;
		height: 100px; 
	}
	#section_basket_table th{
		text-align: center;
	}
	#section_basket_table td:NTH-CHILD(1) {
		width: 50px; 
	} 
	#section_basket_table td:NTH-CHILD(2) {
		width: 100px;    
	}    
	#section_basket_table td:NTH-CHILD(3) {
		text-align: left !important;   
		padding-left: 10px;  
	}    
	#section_basket_table td:NTH-CHILD(5) {
		width: 80px;  
	}
	#section_basket_table td:NTH-CHILD(6) {
		width: 150px;
	}
	#section_basket_table td:NTH-CHILD(7) {
		width: 100px; 
	}
	.btnsize{
		width: 80px !important;      
	}
	#selectChb{
		margin: 15px;      
	}
	.table_input{
		text-align: center;
		width: 50px;        
	}
	#total_div{
		width: 100%;
		height: 50px;
		line-height: 50px; 
		text-align: center;
		font-size: 20px;
	}
	.total_div_span{
		font-weight: bold;
		font-size: 25px;		
	}
	#total_div_span_total{
		font-weight: bold;
		font-size: 25px;	
		color: red; 
		word-spacing: 50px;
	}
	#selectOrder{
		width: 100%;
		height: 50px;
		margin-top: 30px;
		text-align: center;
	}
	.btnselOrder{ 
		width: 150px !importanet;
		margin: 10px;  
	}
	#slectbtnO{
		border: 1px solid #FF4848 !important;         
	}  
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
		$(function(){
			$(".table_input").change(function(){
				var cnt = $(this).val();
				alert(cnt);   
			})
		})
	</script>
	<section>
		<div id="section_basket">
			<h1 id="section_basket_h1">장바구니</h1>
			<div id="section_basket_div">
				<table id="section_basket_table">
					<tr>
						<th><input type="checkbox"></th>
						<th colspan="2">상품명/옵셥</th>  
						<th>판매가</th>
						<th>수량</th>
						<th>주문금액/<br>
							적립예정 포인트</th>
						<th>선택</th>
					</tr>
					<c:if test="${vo.size()==0 }">
						<tr>
							<p>상품이 없습니다.</p>
						</tr>
					</c:if> 
					<c:if test="${vo.size()>0 }">
					<tr>
						<td><input type="checkbox"></td>
						<td><img src="${pageContext.request.contextPath }/resources/main/Adidas_ZX 8000.PNG"> </td>
						<td>나이키/<br>
							nike<br>
							옵션:베이지/230</td>
						<td>119000</td>
						<td><input type="number"  value="1" size="2" class="table_input"><button type="button">변경</button></td>
						<td>119000/<br>  
							1000</td>
						<td><button type="button" class="btn btn-danger btnsize">바로구매</button><br>
						<button type="button" class="btn btn-default btnsize">삭제</button></td>
					</tr>	
					<tr>
						<td><input type="checkbox"></td>
						<td><img src="${pageContext.request.contextPath }/resources/main/Adidas_ZX 8000.PNG"> </td>
						<td>나이키/<br>
							nike<br>
							옵션:베이지/230</td>
						<td>119000</td>
						<td><input type="number" value="1" size="2" class="table_input"><button type="button">변경</button></td>
						<td>119000/<br>  
							1000</td>
						<td><button type="button" class="btn btn-danger btnsize">바로구매</button><br>
						<button type="button" class="btn btn-default btnsize">삭제</button></td>
					</tr>	
					</c:if>
					
						
				</table>
				<div id="selectChb">
					<input type="checkbox"><button type="button" class="btn btn-default">선택상품 삭제</button>
				</div>
				<div id="total_div">
					<span>주문금액&nbsp;&nbsp; <span class="total_div_span">100000</span>원</span>&nbsp;&nbsp;+&nbsp;&nbsp;<span>배송비&nbsp;&nbsp; <span class="total_div_span">0</span>원</span>&nbsp;&nbsp;=&nbsp;&nbsp;<span>총 결제금액&nbsp;&nbsp; <span id="total_div_span_total">402414</span>원</span>	
				</div>
				<div id="selectOrder">
					<button type="button" class="btn btn-default btnselOrder">계속 쇼핑</button>
					<button type="button" class="btn btn-default btnselOrder" id="slectbtnO">선택상품 주문하기</button>
					<button type="button" class="btn btn-danger btnselOrder">전체상품 주문하기</button>
				</div>
			</div>
			
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>