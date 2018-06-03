<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NekoShoes</title>
<style>
	section{
		width: 100%;
		min-height: 1000px;                                         
	}
	#section_orderNow{
		width: 55%;
		margin: 0 auto;
		height: 1000px;                        
	}         
	#section_orderNow_h1{
		width: 100%;
		text-align: center; 
		border-bottom: 1px solid gray;     
		padding-bottom: 10px;  
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

	#section_basket_table td:NTH-CHILD(2) {
		text-align: left !important;   
		padding-left: 10px;        
	}            
	#input_text{
		width: 20px;  
		text-align: center; 
	}
	#basketPrice{
		text-decoration: line-through; 
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
	#member{
		width: 100%;
		height: 700px;       
		margin-top: 50px;         
	}
	#member_h4{
		width: 100%;
		padding-left: 20px;
		height: 15px; 
		font-weight: bold;
	}
	#cId, #cName,#phone1,#phone2,#phone3,#point{
		width: 150px !important;   
	}
	#cPassword, #checkcPassword, #cBirth,#mail1,#mail2,#mail3,#add1{
		width: 200px !important;     
	}  
	#phone1,#phone2,#phone3,#cId,#mail1,#mail2,#mail3,#add1,#cPassword,#checkcPassword,#point{  
		display: inline-block;      
	}
	#add2,#add3{
		width: 600px !important;     
		margin-top: 10px !important;      
	} 
	.st{
		color: red;
	}
	#chepw,#chepw2{
		color: red;
		font-weight: bold;
		font-size: 8px; 
		margin-left: 10px;
		/* visibility: hidden; */ 
	}
	form{
		margin: 20px;       
	}   
	#btnGroup{
		margin-top: 50px;
		text-align: center;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
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
			/* 콤마 */
			function nc(n) {  
				return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");   
			}
			
			var delivery =$(".delivery").html(); 
			var price = $(".sumPrice").html()
			var sum = Number(delivery) + Number(price.replace(",",""));
			$("#total_div_span_total").html(nc(sum));
			
			
			
			
			
		})
	</script>
	<section>
		<div id="section_orderNow">   
			<h1 id="section_orderNow_h1">주문서 작성/결제</h1> 
			<table id="section_basket_table">
					<tr>
						<th colspan="2">상품명/옵셥</th>  
						<th>판매가</th>
						<th>수량</th>
						<th>주문금액/<br>
							적립예정 포인트</th>
					</tr>
				
							<tr>        							      
							<td><img src="${pageContext.request.contextPath }/resources/main/${basket.detailProduct.product.brand.bNameEng }_${basket.detailProduct.product.pNameEng}.PNG"> </td>
								<td>${basket.detailProduct.product.pNameKor }<br>
									${basket.detailProduct.product.pNameEng}<br>
									옵션:${basket.detailProduct.dColor}/${basket.detailProduct.dSize}</td>
								<fmt:formatNumber value="${basket.detailProduct.product.pTotalPrice }" type="number" var="pTotalPrice"/>
								<fmt:formatNumber value="${basket.detailProduct.product.pPrice }" type="number" var="pPrice"/>
								<fmt:formatNumber value="${(basket.detailProduct.product.pTotalPrice*basket.bCount)*0.01 }" type="number" var="pPoint"/>	
								<td><span class="totalPrice">${pTotalPrice}</span><br>
								<c:if test="${basket.detailProduct.product.pRate > 0 }">
									<span id="basketPrice">${pPrice}</span>
								</c:if>
								</td>
								<td><input type="text"  value="${basket.bCount }" readonly="readonly" id="input_text"></td>
								<fmt:formatNumber value="${basket.detailProduct.product.pTotalPrice * basket.bCount }" type="number" var="pSum"/>
								
								<td><span class="sumPrice">${pSum}</span><br>  
									<span class="point">${pPoint }</span><br>
									<span>비회원 구매시 적립X</span></td>
							</tr>						
				</table>  
				<div id="total_div">
					<span>주문금액&nbsp;&nbsp; <span class="total_div_span" id="price">${pSum}</span>원</span>&nbsp;&nbsp;+&nbsp;&nbsp;
					<span>배송비&nbsp;&nbsp;     
					<span class="total_div_span" id="deliveryPr">
					<c:if test="${(basket.detailProduct.product.pTotalPrice * basket.bCount) < 20000 }">
						<span class="delivery">2000</span>
					</c:if>
					<c:if test="${(basket.detailProduct.product.pTotalPrice * basket.bCount) > 20000 }">
						<span class="delivery">0</span>
					</c:if>
					</span>원</span> 
					&nbsp;&nbsp;=&nbsp;&nbsp;<span>총 결제금액&nbsp;&nbsp; <span id="total_div_span_total">0</span>원</span>	
				</div>
				<!-- 주문정보 -->
				<div id="member">
					<h4 id="member_h4">주문 정보</h4> 
						<form action="">
							<div class="form-group">
							  <span class="st">★ </span><label for="cName"> 이름</label>
							  <input type="text" class="form-control" id="cName" name="cName">
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
							<c:if test="${coustomer.cId == null}">   
								<div class="form-group">
								  <span class="st">★ </span><label for="cPassword">주문비밀번호 </label><br>
								  <input type="password" class="form-control" id="cPassword" name="cPassword"><span id="chepw">사용할수 없는 비밀번호입니다.</span>
								</div>
								<div class="form-group">       
								  <span class="st">★ </span><label for="checkcPassword">주문비밀번호 확인</label><br> 
								  <input type="password" class="form-control" id="checkcPassword"><span id="chepw2">비밀번호가 일치하지 않습니다.</span>
								</div>
							</c:if>
							 <div class="form-group">
								  <span class="st">★ </span><label for="add1"> 주소</label><br>
								  <input type="text" class="form-control" id="add1" readonly="readonly">
								  <button type="button" class="btn btn-success" onclick="PostCode();">주소찾기</button>
								  <input type="text" class="form-control" id="add2" readonly="readonly" >
								  <input type="text" class="form-control" id="add3" > 
							</div>  
							
							<c:if test="${coustomer.cId != null}">     
							<div class="form-group">
								<label for="point">포인트사용</label>
							  <input type="text" class="form-control" id="point" name="cName" placeholder="1,000이상 사용">
							    사용가능포인트:24214p &nbsp &nbsp &nbsp <input type="checkbox"> &nbsp 모두사용
							</div> 
							</c:if>
							<div class="form-group" id="btnGroup">
								 <button type="button" class="btn btn-primary">결제하기</button>
								 <button type="button" class="btn btn-default">취소</button>
							</div>  
						</form>
					</div>

				
				
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>