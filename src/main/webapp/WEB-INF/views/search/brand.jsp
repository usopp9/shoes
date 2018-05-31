<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 60%;
		margin: 0 auto;  
		min-height:700px;
		border: 1px solid red;  
	}
	.div_position{
		width: 210px;  
		height: 230px;
		position: relative;	
		float: left;
		margin-left: 12px;   
	}  
	.best_img{   
		width: 210px;  
		height: 230px;
		margin-left: 15px;  	
		position: absolute;
		top: 0;
		left: 0;
	}
	.best_img_img{
		width: 200px;
		height: 150px;     
		margin:5px; 	
		
	}
	.item_stock{
		position: absolute;
		width: 210px;  
		height: 230px;  
		top: 0;
		left: 0;
		background-color: rgba(0,0,0,0.3);
	}
	.item_stock_p{
		position: absolute;
		top: 80px;
		left: 80px;
		font-size: 20px;
		font-weight: bold;
		color: #FF3636;  
	}
	.best_model_kor{
		text-align: center; 
		font-weight: bold;
		color: #021C51;
		padding: 0;
		margin: 0;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}  
	.best_model_eng{
		text-align: center; 
		color: #747474;
		padding: 0;
		margin: 0;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.best_model_discount{
		text-align: center;
	}
	.best_price{
		text-decoration: line-through;
		color:  #747474;
	}
	.best_a{   
		text-decoration: none;
		color: black;  
	} 
	.best_img:HOVER {
		border: 1px solid #C2B7F1;  
	}   
	#brand_name_h1{  
		width: 350px;    
		color: #021C51;
		border-bottom: 2px solid #C2B7F1;  
		padding: 5px;  
	}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<div id="brand_name">
			<h1 id="brand_name_h1">${brand}</h1>
		</div>
	   
	 
		
		<c:if test="${list==null}"> 
			<p>검색 결과가 없습니다.</p>
		</c:if>
		<c:if test="${list !=null }">
			 <c:forEach var="item" items="${list}">
			 <div class="div_position">
			 
			 	<c:if test="${item.pTf == true }"> 
			 	<a href="#" class="best_a">
			 	</c:if>
					<div class="best_img">			    
					<img src="${pageContext.request.contextPath}/resources/main/${item.brand.bNameEng}_${item.pNameEng }.PNG" class="best_img_img">
					<p class="best_model_kor">${item.pNameKor }</p>
					<p class="best_model_eng">${item.pNameEng }</p> 
				
					<c:choose>
						<c:when test="${item.pRate > 0 }">
							<p class="best_model_discount"><span class="best_price">${item.pPrice }</span>&nbsp;&nbsp;${item.pTotalPrice }<p>  
						</c:when>  
						<c:otherwise>
							<p class="best_model_discount">${item.pTotalPrice }<p>
						</c:otherwise>
					</c:choose>
 
					<c:if test="${item.pTf == false }"> 
						<div class="item_stock">
						<p class="item_stock_p">품절</p>
						</div>
					</c:if>   
					</div>  
				<c:if test="${item.pTf == true }"> 
				</a>
				</c:if>  
				</div>
			 </c:forEach>	
		</c:if>
	
	
	
	
	
	
	
	
	
		
		
	
		
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>