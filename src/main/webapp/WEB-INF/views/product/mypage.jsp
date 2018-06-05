<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NekoShoes</title>
<style>
	section{
		width: 100%;
		min-height: 800px;   
	}
	#mypage_list{
		width: 50%;
		margin: 0 auto;
	}
	#mypage_list_h1{
		border-bottom: 1px solid #C2B7F1; 
		padding-bottom: 10px; 
	}
	table{
		border-top: 1px solid gray; 
		border-collapse: collapse;   
		border-bottom:    1px solid gray; 
	  
	}
	table {  
		margin-top:50px;     
		width: 80%;		
		margin-left: 100px;               
	}
    tr{
    	height: 40px;         
    	border-bottom:1px dotted gray;
    	text-align: center;  
    }
    table tr:FIRST-CHILD{
    	background-color: rgba(0,0,0,0.2);  
    }  
    table th{   
    	text-align: center;    
    }
	td:NTH-CHILD(3) {
		text-align: right; 
	}
	.list_order{
		color: #C2B7F1; 
	}
	.list_order:HOVER{
		color: #C2B7F1;
		font-weight: bold;   
		text-decoration: none;  
	}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<div id="mypage_list">
			<h1 id="mypage_list_h1">주문내역</h1>
			<table>
				<tr>
					<th>주문 일자</th>
					<th>주문 번호</th>
					<th>주문 금액</th>
				</tr>   
			<c:if test="${mypageList.size() < 0}">
				<tr>  
				<td>주문내역이 없습니다.</td>
				</tr> 
			</c:if>	   
			<c:if test="${mypageList.size() > 0}">   
				<c:forEach var="list" items="${mypageList}">
					<tr>   
						<fmt:formatDate value="${list.oDate }" pattern="yyyy-MM-dd" var="date"/>
						<td>${date}</td> 
						<td><a href="${pageContext.request.contextPath}/product/mypageDetail?no=${list.oNum}" class="list_order">${list.oNum}</a></td>  
						<fmt:formatNumber value="${list.oPrice}" type="number" var="price"/>
						<td>${price }원</td>
					</tr>
				</c:forEach>	
			</c:if>
			</table>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>	
</body>
</html>