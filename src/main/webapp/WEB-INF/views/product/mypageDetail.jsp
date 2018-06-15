<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NekoShoes</title>
<style>
	section{     
		width: 100%;
		min-height: 500px;    
	}    
	#detailList{
		width: 60%;
		margin: 0 auto;       
	}   
	#detailList_h2{
		border-bottom: 1px solid #C2B7F1; 
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
	#span_date{
		font-size: 15px;
		color: blue; 
	}
	#div_h3{
		text-align: center;       
	}
	#div_p{
		font-size: 15px;
		margin: 20px; 
	}
	#div_btn{
		text-align: center;  
	}
	#total_p{
		color: red;            
	}   
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script type="text/javascript">
		$(function(){
			var add = "${detailList[0].oAddress}";
			add= add.split(",");  
			$("#add1").html(add[0]);
			$("#add2").html(add[1]+" "+add[2]);    
			$("#goMypage").click(function(){
				location.href="mypage";    
			})
			$("#goNoneMypage").click(function(){
				location.href="nonmember";      
			})
		})
	</script>
	<section>
		<div id="detailList">
			<fmt:formatDate value="${detailList[0].oDate}" pattern="yyyy-MM-dd" var="date"/>
			<h2 id="detailList_h2">주문 상세내역 - <span id="span_date">주문날짜:${date}</span></h2>  
			<table id="section_basket_table">
					<tr>
						<th colspan="2">상품명/옵셥</th>    
						<th>판매가</th>
						<th>수량</th>
						<th>주문금액/<br>
							적립예정 포인트</th>
					</tr>
			
				   <c:forEach var="list" items="${size}" varStatus="s"> 
						<tr> 
						 <td><img src="${pageContext.request.contextPath }/resources/main/${list.product.brand.bNameEng}_${list.product.pNameEng}.PNG"> </td>
							<td>${list.product.pNameKor }<br>
									${list.product.pNameEng}<br>         
									옵션:${list.dColor}/${list.dSize}</td>
									  
								<fmt:formatNumber value="${list.product.pTotalPrice }" type="number" var="pTotalPrice"/>
								<fmt:formatNumber value="${list.product.pPrice }" type="number" var="pPrice"/>
								<fmt:formatNumber value="${(list.product.pTotalPrice*detailList[0].oCount)*0.01 }" type="number" var="pPoint"/>	
								<td><span class="totalPrice">${pTotalPrice}</span><br>
								<c:if test="${list.product.pRate > 0 }">
									<span id="basketPrice">${pPrice}</span>
								</c:if>
								</td>         
								<td><input type="text"  value="${detailList[0].oCount }" readonly="readonly" class="input_text"></td>
								<fmt:formatNumber value="${list.product.pTotalPrice * detailList[0].oCount }" type="number" var="pSum"/>
								        
								<td><span class="sumPrice">${pSum}</span><br>       
									<span class="point">${pPoint }</span><br>  
									<span>비회원 구매시 적립X</span></td>   
							</tr>	
				</c:forEach>	   
				</table>   
				<div id="div_h3">
				<fmt:formatNumber value="${detailList[0].oPrice}" type="number" var="price"/>
				<fmt:formatNumber value="${detailList[0].oPoint}" type="number" var="point"/>
				<fmt:formatNumber value="${detailList[0].oUpoint}" type="number" var="usepoint"/>
				<%-- <fmt:formatNumber value="${{detailList[0].oPrice - detailList[0].oUpoint}" type="number" var="total"/> --%>
				<c:if test="${detailList[0].oUpoint > 0}">
					<h3>사용포인트:${usepoint}p / 총 구입금액:<span id="total_p">${price}</span>원 /적립포인트:${point}p</h3> 
				</c:if>
				<c:if test="${detailList[0].oUpoint == 0}">  
					<h3>사용포인트:0p / 총 구입금액:<span id="total_p">${price}</span>원 /적립포인트:${point}p</h3> 
				</c:if>
				</div>          
				<div id="div_p">
					<p>주문자 이름:${detailList[0].oName} </p>
					<p>주문자 휴대전화:${detailList[0].oPhone} </p>
					<p>주문자 메일:${detailList[0].oMail} </p>
					<p>주문자 주소: <span id="add1"></span><br>
					<span id="add2"></span></p>				
				</div>
				<div id="div_btn">
					<c:if test="${id !=null }">
					<button type="button" class="btn btn-warning" id="goMypage">마이페이지</button>
					</c:if>
					<c:if test="${id ==null }">
					<button type="button" class="btn btn-danger" id="goNoneMypage">마이페이지</button>
					</c:if>
				</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>		
</body>
</html>