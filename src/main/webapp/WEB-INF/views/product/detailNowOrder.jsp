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
	.input_text{
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
	#cId, #cName,#phone1,#phone2,#phone3,#point_input{
		width: 150px !important;   
	}
	#cPassword, #checkcPassword, #cBirth,#mail1,#mail2,#mail3,#add1{
		width: 200px !important;     
	}  
	#phone1,#phone2,#phone3,#cId,#mail1,#mail2,#mail3,#add1,#cPassword,#checkcPassword,#point_input{  
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
	#pointchk{
		font-size: 10px;
		color: red; 
		visibility: hidden; 
	}
	#chepw2{
		color: red;
		font-weight: bold;
		font-size: 8px; 
		margin-left: 10px;
		visibility: hidden;
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
			
			var sum =0;
			var sumlength = $(".sumPrice").length;
			for(var i= 0;i<sumlength;i++){
				var price = $(".sumPrice").eq(i).html(); 
				sum+= Number(price.replace(",",""));
			}   
			
			$("#price").html(nc(sum)); 
			$("#total_div_span_total").html(nc(sum+Number(delivery)));
			
			/* 휴대폰 */
			var p = "${coustomer.cPhone}"; 
			var phone = p.split("-");
			$("#phone1").val(phone[0]);
			$("#phone2").val(phone[1]);  
			$("#phone3").val(phone[2]);    
			         
			/* 메일 */
			var m = "${coustomer.cMail}";
			var mail = m.split("@");
			$("#mail1").val(mail[0]);        
			$("#mail2").val(mail[1]);        

			/* 주소 */  
			var a = "${coustomer.cAddress}";
			var address = a.split(",");
			$("#add1").val(address[0]);     
			$("#add2").val(address[1]);
			$("#add3").val(address[2]); 
			
			/* 포인트사용 */
			
	
			$("#allPoint").click(function(){
				var pointSpan = $("#point_span").html(); 
				var total = $("#total_div_span_total").html(); 
				if($("#allPoint").prop("checked")==true){				
					if(Number(pointSpan.replace(",","")) > 1000){ 
						                   
						$("#point_input").val(pointSpan);      
			   			$("#total_div_span_total").html(nc(Number(total.replace(",",""))-Number(pointSpan.replace(",",""))));   
					}   
				}else if($("#allPoint").prop("checked")==false){          
					$("#total_div_span_total").html(nc(Number(total.replace(",",""))+Number(pointSpan.replace(",",""))));  
					$("#point_input").val("");      
				}         			
			})
			
			/* 포인트입력 */
			/* var price = $("#total_div_span_total").html();
			$("#point_input").on("keyup", function() { 
			
				var tf = false;
				var point = $("#point_input").val();
				var pointSpan = $("#point_span").html();
				 var total = price; 
				if(Number(point) < 1000 || Number(point) >  Number(pointSpan.replace(",",""))){  
					$("#pointchk").css("visibility","visible");	

					tf=false;
				}else if(Number(point) > 1000 || Number(point) <  Number(pointSpan.replace(",",""))){  
					$("#pointchk").css("visibility","hidden");	  
					     
					tf=true;    
					point = $("#point_input").val();
					total = $("#total_div_span_total").html(); 
				}
				 
				if(tf){
					$("#total_div_span_total").html(nc(Number(total.replace(",",""))-Number(point.replace(",",""))));   				
				} 	  
				 
			})	 */
			
			
			/* 비회원 비밀번호 */
			
			var tfpw=false;  
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
		
			
			$(".btnOrder").click(function(){
			
				var name =$("#cName").val();
				
				var ph1 = $("#phone1").val();
				var ph2 = $("#phone2").val();
				var ph3 = $("#phone3").val();			
						
				var m1= $("#mail1").val();    
				var m2= $("#mail2").val();    			
				
				var add1 = $("#add1").val();
				var add2 = $("#add2").val();
				var add3 = $("#add3").val();
							
				/* 공백체크 */
				if(name.length==0 ||ph2.length==0 ||m2.length==0 ||add1.length==0){
					alert("정보를 입력해주세요.");
					return;       
				}     
			 
				var phone = ph1+"-"+ph2+"-"+ph3; 
				var mail = m1+"@"+m2;
				var add = add1+","+add2+","+add3;
				
				/* 비회원 비밀번호 */
				var password = $("#cPassword").val();
				if(typeof(password)!="undefined"){
					if(password.length==0){
						alert("비밀번호를 입력해주세요."); 
						return; 
					}
					if(tfpw==false){
						return;  
					}
				}
			    
				var length = $(".point").length;
				var point = 0;
				
				for(var i =0;i<length;i++){
					
					var dNo = $(".point").eq(i).parent().parent().find(".hiddendNo").val();  		
					var detailNo = $(".point").eq(i).parent().parent().find(".hiddendDetailNo").val();  
					var count = $(".point").eq(i).parent().parent().find(".input_text").val();  
					point += Number($(".point").eq(i).html().replace(",",""));    
					var input = "<input type='hidden' name='dNo' value='"+dNo+"'>"; 
					var inputNo = "<input type='hidden' name='detailNo' value='"+detailNo+"'>"; 
					var inputCount = "<input type='hidden' name='count' value='"+count+"'>"; 
					$("#f1").append(input).append(inputNo).append(inputCount);   
				}   
				/* 사용포인트 */
				var usePoint = $("#point_input").val();
					if(typeof(usePoint)=="undefined"){
						usePoint = 0;
					}else{
						usePoint = Number(usePoint.replace(",",""));   	
					}
				    
				
				
				var price =	Number($("#total_div_span_total").html().replace(",","").replace(",","").replace(",",""));
				var $input1 ="<input type='hidden' name='oPhone' value='"+phone+"'>"; 
				var $input2 ="<input type='hidden' name='oMail' value='"+mail+"'>";
				var $input3 ="<input type='hidden' name='oAddress' value='"+add+"'>";  
				var $input4 ="<input type='hidden' name='oName' value='"+name+"'>"; 
				var $input5 ="<input type='hidden' name='oPassword' value='"+password+"'>"; 
				var $input6 ="<input type='hidden' name='oPoint' value='"+point+"'>"; 
				var $input7 ="<input type='hidden' name='oPrice' value='"+price+"'>"; 
				var $input8 ="<input type='hidden' name='oUpoint' value='"+usePoint+"'>"; 	
				 $("#f1").append($input1).append($input2).append($input3).append($input4).append($input5).append($input6).append($input7).append($input8); 
				$("#f1").attr("action","orderProduct");  
				$("#f1").submit();      
				 
			})
			$("#cancelOrder").click(function(){
				location.href="${pageContext.request.contextPath}/";
			})     
			  
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
				<c:forEach var="list" items="${detail}" varStatus="s">
							<tr>        							      
							<td><img src="${pageContext.request.contextPath }/resources/main/${list.product.brand.bNameEng }_${list.product.pNameEng}.PNG"> </td>
							 	<td>${list.product.pNameKor }<br>
									${list.product.pNameEng}<br>
									옵션:${list.dColor}/${list.dSize}
									<input type="hidden" class="hiddendNo" value="0">   
									<input type="hidden" class="hiddendDetailNo" value="${list.dNo}"></td>
									
								<fmt:formatNumber value="${list.product.pTotalPrice }" type="number" var="pTotalPrice"/>
								<fmt:formatNumber value="${list.product.pPrice }" type="number" var="pPrice"/>
								<fmt:formatNumber value="${(list.product.pTotalPrice * count[s.index] *0.01) }" type="number" var="pPoint"/>	
								<td><span class="totalPrice">${pTotalPrice}</span><br>
								<c:if test="${list.product.pRate > 0 }"> 
									<span id="basketPrice">${pPrice}</span>
								</c:if>
								</td>  
								<td><input type="text"  value="${count[s.index]}" readonly="readonly" class="input_text"></td>
								<fmt:formatNumber value="${list.product.pTotalPrice * count[s.index]}" type="number" var="pSum"/>
								
								<td><span class="sumPrice">${pSum}</span><br>  
									<span class="point">${pPoint }</span><br>  
									<span>비회원 구매시 적립X</span></td> 
							</tr>	
				</c:forEach>					
				</table>  
				<div id="total_div">
					<span>주문금액&nbsp;&nbsp; <span class="total_div_span" id="price">0</span>원</span>&nbsp;&nbsp;+&nbsp;&nbsp;
					<span>배송비&nbsp;&nbsp;     
					<span class="total_div_span" id="deliveryPr">
					<span class="delivery">0</span>
					<%-- <c:if test="${(list.detailProduct.product.pTotalPrice * list.bCount) < 20000 }">
						<span class="delivery">2000</span>
					</c:if>
					<c:if test="${(list.detailProduct.product.pTotalPrice * list.bCount) > 20000 }">
						
					</c:if> --%>
					</span>원</span> 
					&nbsp;&nbsp;=&nbsp;&nbsp;<span>총 결제금액&nbsp;&nbsp; <span id="total_div_span_total">0</span>원</span>	
				</div>
				<!-- 주문정보 -->
				<div id="member">
					<h4 id="member_h4">주문 정보</h4> 
							<div class="form-group">
							  <span class="st">★ </span><label for="cName"> 이름</label>
							  <input type="text" class="form-control" id="cName" name="cName" value="${coustomer.cName}">
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
							<c:if test="${coustomer.cName == null}">   
								<div class="form-group">
								  <span class="st">★ </span><label for="cPassword">주문비밀번호 </label><br>
								  <input type="password" class="form-control" id="cPassword" name="cPassword">
								</div>
								<div class="form-group">       
								  <span class="st">★ </span><label for="checkcPassword">주문비밀번호 확인</label><br> 
								  <input type="password" class="form-control" id="checkcPassword"><span id="chepw2">비밀번호가 일치하지 않습니다.</span>
								</div>
							</c:if>
							 <div class="form-group">
								  <span class="st">★ </span><label for="add1"> 주소</label><br>
								  <input type="text" class="form-control" id="add1">
								  <button type="button" class="btn btn-success" onclick="PostCode();">주소찾기</button>
								  <input type="text" class="form-control" id="add2">
								  <input type="text" class="form-control" id="add3" > 
							</div>  
							
							<c:if test="${coustomer.cName != null}">       
							<div class="form-group">   
								<label for="point">포인트사용</label>
								<fmt:formatNumber value="${coustomer.cPoint}" type="number" var="pPoint"/>
							  <input type="text" class="form-control" id="point_input" name="cName" placeholder="1,000이상 사용" readonly="readonly">
							    사용가능포인트:<span id="point_span">${pPoint}</span>p &nbsp &nbsp &nbsp <input type="checkbox" id="allPoint"> &nbsp 모두사용
								<br><span id="pointchk">사용 할 수 없습니다.</span>   
							</div> 
							</c:if>
						<form id="f1" method="post">
							<div class="form-group" id="btnGroup">
								 <button type="button" class="btn btn-primary btnOrder">결제하기</button>
								 <button type="button" class="btn btn-default" id="cancelOrder">취소</button>
							</div>  
						</form>
					</div>

				
				
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>