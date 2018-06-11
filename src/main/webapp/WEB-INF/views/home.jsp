<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>NekoShoes</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/bxSlider/css/jquery.bxslider.css">
<style>
	section{
		width: 100%;
		min-height: 800px;
	}
	#section_best{
		width:60%;
		margin: 0 auto;  
		overflow: hidden;   
		margin-bottom: 80px;       
	}
	.setion_h1{  
		width: 100%;
		height: 50px; 
		margin: 0;
		padding: 0;
		margin-bottom: 10px;
		color: #021C51;
		border-bottom: 2px solid #C2B7F1;
	}	
	
	.best_img{
		width: 210px;  
		height: 230px;
		margin-left: 15px;  
		float: left;	 
	}     
	.best_img_img{
		width: 200px;
		height: 150px;     
		margin:5px; 	
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
	#weekItem{   
		width:60%;
		margin: 0 auto; 
	}
	#weekItem_slider{           
		width: 98%;  
		margin: 0 auto;   
	}
 	.bx-wrapper{      
		min-width: 1055px !important;     
		margin-top: 50px  !important;    
		margin-left: 30px !important;                         
	}                     
</style>  
</head>  
<body>
	<%@ include file="include/header.jsp"%>
	<script src="${pageContext.request.contextPath }/resources/bxSlider/jquery.bxslider.min.js"></script>
	 <script type="text/javascript">
	 $(document).ready(function(){
	      $('.slider').bxSlider({
	          auto: true,
	          autoControls: true,
	          stopAutoOnClick: true,
	          captions: true,
	          pause: 2000,
	          speend:1000,
	          slideMargin:5,     
	          maxSlides:5,  
	          slideWidth: 200   
	         });  
	    });
	</script> 
	<section>
		<div id="section_best">
			<h1 class="setion_h1">베스트 상품</h1>
			
			 <c:forEach var="item" items="${bestItem}">
			 	<a href="product/detail?no=${item.pNo }" class="best_a">
					<div class="best_img">			    
					<img src="${pageContext.request.contextPath}/resources/main/${item.brand.bNameEng}_${item.pNameEng }.PNG" class="best_img_img">
					<p class="best_model_kor">${item.pNameKor }</p>
					<p class="best_model_eng">${item.pNameEng }</p> 
				<fmt:formatNumber value="${item.pTotalPrice }" type="number" var="pTotalPrice"/>
				<fmt:formatNumber value="${item.pPrice }" type="number" var="pPrice"/>
					<c:choose>
						<c:when test="${item.pRate > 0 }">
							<p class="best_model_discount">
							
							<span class="best_price">${pPrice }</span>
							&nbsp;&nbsp;${pTotalPrice }<p>  
						</c:when>  
						<c:otherwise>
							<p class="best_model_discount">
							
							${pTotalPrice }
							<p>
						</c:otherwise>
					</c:choose>
					</div>
				</a>
			 </c:forEach>	
		</div>
		
		<div id="weekItem">
			<h1 class="setion_h1">이번주 신상품</h1>
			<div id="weekItem_slider">
				 <div class="slider">
				
					<c:forEach var="item" items="${weekItem}">
			 	<a href="product/detail?no=${item.pNo }" class="best_a">
					<div class="best_img">			    
					<img src="${pageContext.request.contextPath}/resources/main/${item.brand.bNameEng}_${item.pNameEng }.PNG" class="best_img_img">
					<p class="best_model_kor">${item.pNameKor }</p>
					<p class="best_model_eng">${item.pNameEng }</p> 
					<fmt:formatNumber value="${item.pTotalPrice }" type="number" var="pTotalPrice"/>
					<fmt:formatNumber value="${item.pPrice }" type="number" var="pPrice"/>
					<c:choose>
						<c:when test="${item.pRate > 0 }">
							<p class="best_model_discount"><span class="best_price">${pPrice}</span>&nbsp;&nbsp;${pTotalPrice}<p>  
						</c:when>    
						<c:otherwise> 
							<p class="best_model_discount">${pTotalPrice }<p>
						</c:otherwise>
					</c:choose>
					</div>
				</a>
			 </c:forEach>	
								
				</div>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
