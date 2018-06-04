<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		width: 60%;    
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
		width: 200px;      
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
	.basketPrice{
		text-decoration: line-through;
	}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
		/* 콤마 */
		function nc(n) {  
			return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");   
		}
		/* 총계산금액 */	
		function sumPrice() {  
				var sum = 0;	
				var sumlength= $(".sumPrice").length; 	
			    
					for(var i =0; i<sumlength;i++){
						var price = $(".sumPrice").eq(i).html();
						  
						sum+=Number(price.replace(",",""));
					}
					/* 배송비 결제 */
					if(sum < 20000){
						$("#deliveryPr").html(nc(2000));   
					}
					$("#tPrice").html(nc(sum));  
		            
					var deliveryP = $("#deliveryPr").html();
					var totalSum = sum+ Number(deliveryP.replace(",",""));
					$("#total_div_span_total").html(nc(totalSum)); 
		}
		  
		
		
		/* 수량변경 */  
		$(function(){
			
			 sumPrice();          
			
			$(".updateBasket").click(function(){
				var index = $(".updateBasket").index(this);  
				var cnt =$(this).parent().parent().find(".table_input").val();
				var bNo = $(this).parent().parent().find(".hiddenBno").val();
				var sendData = {bNo:bNo, bCount:cnt}; 
				 $.ajax({ 
					type:"post",
					url:"${pageContext.request.contextPath}/product/updateBasket",    
					data: JSON.stringify(sendData),
					dataType:"text",     
					headers:{"Content-Type":"application/json"},
					success:function(result){		
		            	if(result=="success"){    
		            		var cnt =$(".updateBasket").eq(index).parent().parent().find(".table_input").val();
		            		var price =$(".updateBasket").eq(index).parent().parent().find(".totalPrice").html();		            		
		            		var sum = Number(cnt)*Number(price.replace(",",""));
		            		var point = (Number(cnt)*Number(price.replace(",",""))*0.01);
		            		
		            		
		            		$(".updateBasket").eq(index).parent().parent().find(".sumPrice").html(nc(sum)); 
		            		$(".updateBasket").eq(index).parent().parent().find(".point").html(nc(point)); 
		            		sumPrice(); 		            	
		            	}  		               
					}  
				})	    				
			})
		
		function deleteBasket(bNo){
				$.ajax({ 
					type:"get",
					url:"${pageContext.request.contextPath}/product/deleleBasket?bNo="+bNo,       
					dataType:"text",     
					success:function(result){			  
		            	/* if(result=="success"){            	
		            		$(".btndelete").eq(index).parent().parent().remove();   
		            		sumPrice(); 		
		            	}    */
					}  
				})		     
			}
		$(".btndelete").click(function(){
			var index = $(".btndelete").index(this);
			var bNo = $(this).parent().parent().find(".hiddenBno").val();
			var price = $(this).parent().parent().find(".sumPrice").html();	   
			deleteBasket(bNo);  
			$(".btndelete").eq(index).parent().parent().remove();   
    		sumPrice(); 	
			/* $.ajax({ 
				type:"get",
				url:"${pageContext.request.contextPath}/product/deleleBasket?bNo="+bNo,       
				dataType:"text",     
				success:function(result){			  
	            	if(result=="success"){            	
	            		$(".btndelete").eq(index).parent().parent().remove();   
	            		sumPrice(); 		
	            	}   
				}  
			})		 */
		})		
		
		

		$("#allChk").click(function(){
			if($("#allChk").prop("checked")==true){
				$("input[type='checkbox']").prop("checked", true);    
			}else{
				$("input[type='checkbox']").prop("checked", false); 	
			}
		})  
		
		
		$("#selectDeleteBtn").click(function(){
		    $(".selectChk:checked").each(function (i,obj) {
		    	var bNo = $(obj).val();   
		    	 deleteBasket(bNo); 	   
			    $(obj).parent().parent().remove();  
		    	 sumPrice(); 
		    	 $("input[type='checkbox']").prop("checked", false); 	 		    	 
		    })	   
		})
		
		/* 바로구매 */
		$(".btnNow").click(function(){
					      
			$("input[type='checkbox']").prop("checked", false);    	           
			$(this).parent().parent().find(".selectChk").prop("checked",true);    
			
			/* var length = $(".selectChk").length;       
			
			for(var i = 0; i<length;i++){
				 var bNo = $(".selectChk:checked").eq(i).parent().parent().find(".hiddenBno").val();    
				var input = "<input type='hidden' name='bNo' value='"+phone+"'>";  
			  
			}    */
			var bNo = $(this).parent().parent().find(".hiddenBno").val();  
			var input = "<input type='hidden' name='bNo' value='"+bNo+"'>";  
			$("#f1").append(input);
			$("#f1").attr("action","orderNow"); 
			$("#f1").submit();
			/* var bNo = $(this).parent().parent().find(".hiddenBno").val();  
			location.href="${pageContext.request.contextPath}/product/orderNow?bNo="+bNo; */		
		})
		/* 전체상품구매 */
		$("#allBtnOrder").click(function(){
			var length = $(".selectChk").length;       
			
			for(var i = 0; i<length;i++){
				 var bNo = $(".selectChk").eq(i).parent().parent().find(".hiddenBno").val();    
				var input = "<input type='hidden' name='bNo' value='"+bNo+"'>";  	  
				$("#f1").append(input);
			}    
			$("#f1").attr("action","orderNow"); 
			$("#f1").submit();  
		})   
		
		/* 선택상품구매 */
		$("#slectbtnO").click(function(){
			var length = $(".selectChk:checked").length;       
			
			for(var i = 0; i<length;i++){
				 var bNo = $(".selectChk:checked").eq(i).parent().parent().find(".hiddenBno").val();    
				var input = "<input type='hidden' name='bNo' value='"+bNo+"'>";  	  
				$("#f1").append(input);  
			}     
			$("#f1").attr("action","orderNow"); 
			$("#f1").submit();  
		})
	})   
	</script>
	<section>
		<div id="section_basket">
			<h1 id="section_basket_h1">장바구니</h1>
			<div id="section_basket_div">
				<table id="section_basket_table">
					<tr>
						<th><input type="checkbox" id="allChk"></th>
						<th colspan="2">상품명/옵셥</th>  
						<th>판매가</th>
						<th>수량</th>
						<th>주문금액/<br>
							적립예정 포인트</th>
						<th>선택</th>
					</tr>
					<c:if test="${vo.size()==0 }">
						<tr>
							상품이 없습니다.  
						</tr> 
					</c:if> 
					<c:if test="${vo.size()>0 }">
					
						<c:forEach var="item" items="${vo }">
							<tr>        							      
								<td><input type="checkbox" class="selectChk" value="${item.bNo}"> 
								<input type="hidden" value="${item.bNo}" class="hiddenBno"></td>
								  
								<td><img src="${pageContext.request.contextPath }/resources/main/${item.detailProduct.product.brand.bNameEng }_${item.detailProduct.product.pNameEng}.PNG"> </td>
								<td>${item.detailProduct.product.pNameKor }<br>
									${item.detailProduct.product.pNameEng}<br>
									옵션:${item.detailProduct.dColor}/${item.detailProduct.dSize}</td>
								<fmt:formatNumber value="${item.detailProduct.product.pTotalPrice }" type="number" var="pTotalPrice"/>
								<fmt:formatNumber value="${item.detailProduct.product.pPrice }" type="number" var="pPrice"/>
								<fmt:formatNumber value="${(item.detailProduct.product.pTotalPrice*item.bCount)*0.01 }" type="number" var="pPoint"/>	
								<td><span class="totalPrice">${pTotalPrice}</span><br>
								<c:if test="${item.detailProduct.product.pRate > 0 }">
									<span class="basketPrice">${pPrice}</span>
								</c:if>
								</td>
								<td><input type="number"  value="${item.bCount }" size="2" class="table_input" min="1"><button type="button" class="updateBasket">변경</button></td>
								<fmt:formatNumber value="${item.detailProduct.product.pTotalPrice * item.bCount }" type="number" var="pSum"/>
								
								<td><span class="sumPrice">${pSum}</span><br>  
									<span class="point">${pPoint }</span><br>
									<span>비회원 구매시 적립X</span></td>
								<td><button type="button" class="btn btn-danger btnsize btnNow">바로구매</button><br>
								<button type="button" class="btn btn-default btnsize btndelete">삭제</button></td>
							</tr>
						</c:forEach>	
					</c:if>					
				</table>
				<div id="selectChb">
					<input type="checkbox"><button type="button" class="btn btn-default" id="selectDeleteBtn">선택상품 삭제</button>
				</div>
				<div id="total_div">
					<span>주문금액&nbsp;&nbsp; <span class="total_div_span" id="tPrice">100000</span>원</span>&nbsp;&nbsp;+&nbsp;&nbsp;<span>배송비&nbsp;&nbsp; <span class="total_div_span" id="deliveryPr">0</span>원</span>&nbsp;&nbsp;=&nbsp;&nbsp;<span>총 결제금액&nbsp;&nbsp; <span id="total_div_span_total">402414</span>원</span>	
				</div>
				<div id="selectOrder">
					<button type="button" class="btn btn-default btnselOrder">계속 쇼핑</button>
					<button type="button" class="btn btn-default btnselOrder" id="slectbtnO">선택상품 주문하기</button>
					<button type="button" class="btn btn-danger btnselOrder" id="allBtnOrder">전체상품 주문하기</button>
				</div>
			</div>
			<form id="f1" method="post">
			</form>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>