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
	#section_detail{
		width:60%;
		margin: 0 auto;  	
		overflow: hidden;       
		min-height: 500px;      
	}    
	#section_detail_left{   
		width: 48%;
		height: 450px;
		float: left;
		margin-top: 60px;   
	}
	#section_detail_right{
		width: 50%;
		height: 450px;   
		float: right; 
	}
	#section_detail_left_wrap{
		width: 100%;
		height: 250px; 
	}
	#section_detail_left_smallImg{
		width: 100%;
		height: 100px;
		margin-top:40px;   
		overflow: hidden;
	}
	.smallPic{
		width: 100px;
		height: 100px; 
		margin-left: 5px;         
	}  
	.smallPic:HOVER {
		border: 1px solid #C2B7F1;
	}
	.bigPic{
		width: 400px;         
		height: 230px; 
		margin-left: 80px;                         
	}
	#section_detail_right_wrap{  
		width: 100%;
		height: 70px;
		border-bottom:2px solid black; 
		overflow: hidden;   
	}
	#logopic{
		float: left;   
		height: 70px;     
	}
	#productKor{
		font-size: 20px;   
		font-weight: bold;
		color: #021C51; 
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	#productEng{
		color: #747474;
		font-weight: bold;
		font-size: 15px; 
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	#section_datail_right_price{
		width: 100%;
		height: 50px;      
		overflow: hidden;   
		border-bottom: 1px dotted gray;
	}
	.section_datail_right_price_div1{
		width: 25%;
		height: 50px; 
		float: left; 
	}
	.section_datail_right_price_div1_span{
		display:inline-block; 
		line-height: 50px;    
		margin-left:30px;       
		color: #747474;     
		font-weight: bold;      		
	}
	.section_datail_right_price_div2{
		width: 100%;     
		height: 50px;       
		border-bottom: 1px dotted gray;
	}
	#section_datail_right_price_div2_total_price{
		font-size: 18px;
		margin-left: 50px;
	}
	#section_datail_right_price_div2_price{
		font-size: 20px;
		text-decoration:line-through;
	}
	#section_datail_right_price_div2_point{
		font-size: 13px;
		margin-left: 50px;  
		color: #C2B7F1; 
		font-weight: bold; 
	}
	#section_datail_right_delivery_span{
		font-size: 15px;
		line-height: 50px; 
		margin-left: 50px; 
	}
	#section_datail_right_color{
		width: 100%;
		height: 50px;
		border-bottom: 1px dotted gray;
		overflow: hidden; 
	}
	#section_datail_right_color_div{
		width: 66%;        
		height: 50px;
		float: right; 
	}
	.section_datail_right_color_span{
		display: inline-block;
		width: 50px;
		height: 30px;
		border: 1px solid #D5D5D5;  
		margin-top: 10px; 
		line-height: 30px;   
		text-align: center;  
	}
		
	/* display: none;   */
	#section_datail_right_size{
		width: 100%;
		height: 90px;
		border-bottom: 1px dotted gray;
		overflow: hidden; 
		display: none;     
	}
	#section_datail_right_size_div1{
		width: 24%;
		height: 89px;   
		float: left;  
	}
	#section_datail_right_size_div2{
		width: 70%;    
		height: 89px;    
		float: right;   
	}
	.section_datail_right_price_div1_size{
		display: inline-block;
		width: 50px;
		height: 30px;
		border: 1px solid #D5D5D5;          
		margin-top: 10px; 
		text-align: center; 
		margin-left: 20px;   
		line-height: 30px;     
	} 
	#section_datail_right_size_div1_span{
		display:inline-block; 
		line-height: 90px;    
		margin-left:30px;         
		color: #747474;     
		font-weight: bold;
	}
	/* display: none;   */
	#section_datail_right_oder{
		width: 100%;            
		height:110px;        
		border-bottom: 2px solid black;   
		display: none;
		overflow: auto;     
	}
	.section_datail_right_oder_div1{
		width: 99%;
		height: 20px; 
		line-height: 20px;     
		background-color: #CACACA; 
		margin: 2px;  
		overflow: hidden;
	} 
	.section_datail_right_oder_span1{
		display: inline-block;
		width: 330px;   
		height: 20px;   
		text-align: center;  
		font-weight: bold;  
		float: left;     
		text-overflow: ellipsis;
		overflow: hidden;  
		white-space: nowrap;
	} 
	.section_datail_right_oder_span2{ 
		display: inline-block;
		width: 20px; 
		height: 20px;     
		border: 1px solid gray;     
		background-color: white;   
		text-align: center;     
		float: left;   
	} 
	.section_datail_right_oder_span3{
		display: inline-block;
		width: 40px;   
		height: 20px;         
		border: 1px solid gray;    
		background-color: white;    
		text-align: center;     
		float: left; 
	}
	.section_datail_right_oder_span4{
		display: inline-block;
		width: 20px; 
		height: 20px;       
		border: 1px solid gray;      
		background-color: white;  
		text-align: center;     
		float: left; 
	}
	.section_datail_right_oder_span5{
		display: inline-block;
		margin-left: 50px;   
		color: #021C51; 
	}
	#section_datail_right_total{
		width: 99%;
		height: 40px;      
	}   
	#section_datail_right_total_p{
		text-align: right;
		font-size: 20px;
		line-height: 40px; 
		margin-right: 10px;  
	}
	#section_datail_right_total_span{
		color: red;
		font-weight: bold; 
	}
	#section_datail_right_button{
		width: 100%;
	}
	#section_datail_right_button{
		text-align: right;  
	}
	#btnOrder{
		margin-right: 20px; 
		margin-left: 20px; 
	}
	#btnBasket{
		border:1px solid #FF3636 !important;    
	}
		/* display: none; */
	#section_detail_page{
		width: 60%; 
		margin: 0 auto; 
		display: none;
	}   

	.detail_page{
		width: 100%;  
		
	}
	.btnColor:HOVER ,.btnSize,.deleteOrder,.btnPlus{
		cursor: pointer;
		/* background-color: rgba(0,0,0,0.3);    */  
	}
	#section_detail_select{
		width: 30%;
		margin:0 auto;       
		height: 50px;   
		margin-bottom: 50px;  
	}

	.section_detail_select_span{
		display: inline-block;
		width: 50%;
		text-align: center;
		line-height: 50px;
		background-color: #C2B7F1;     
		border: 1px solid white;   
		color: white;  
		font-size: 20px;    	
	}  
	.section_detail_select_span:HOVER {   
		cursor: pointer;  
	}
			/* display: none; */
	#section_detail_review{
		width: 50%;
		margin:0 auto; 
		height: 600px;
		border: 1px solid red ;
		display: none;	
	}
	#section_detail_review_div{
		width: 100%;
		height: 50px;
		border-bottom: 1px solid #C2B7F1; 
		padding-bottom: 10px; 
		text-align: center; 
	}
	#review_title{
		width: 75%; 
		height: 50px;
		margin:0 auto;  
		margin-top: 20px; 
		background-color: rgba(0,0,0,0.2);    
	}
	.review_title_span{
		text-align: center;
		line-height: 50px;  
		display: inline-block;
		width: 120px;    
		height: 50px;    
		font-weight: bold;     
	}
	.span1{   
		width: 300px;        	              		        
	}    
	.review_title_1{
		width: 75%;
		height: 40px;
		margin:0 auto;  
		border-bottom: 1px dotted gray;  
		text-overflow: ellipsis;        
		overflow: hidden;       
		white-space: nowrap; 
	}
	.review_title_span1{
		line-height: 40px;    
		display: inline-block;
		width: 120px;       
		height: 40px;    	
		 
	}
	.span11{
		width: 300px;    
		text-align: left; 
		
	}
	.span11:HOVER{
		display:inline-block;  
		cursor: pointer;   
		font-weight: bold; 
	}
	/* display: none; */
	.review_content{
		width: 75%;
		min-height: 100px;
		margin:0 auto;   
		text-align: left;  
		display: none;
		border: 1px solid gray;
		border-radius: 30px; 
		margin-top: 5px;  
		padding: 20px;      
	}
	.review_content_pic{ 
		width: 150px;
		height: 150px;    
	}
	#writerBtn{
		margin-top:10px; 
		text-align: center;  
	} 
	
</style>   
</head>  
<body>
	
	<%@ include file="../include/header.jsp"%>
	<!--  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>    -->  
	<script type="text/javascript">
		$(function(){  
			/* 콤마 */
			function nc(n) {  
				return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");   
			}
			  
			/* 총가격 */
			var totalSum=0;
			
			/* 사진이미지 */ 
			$(".smallPic").click(function(){
				$("#section_detail_left_wrap").empty();    
				$(".smallPic").css("border","1px solid white");    
				$(this).css("border","1px solid #C2B7F1"); 
				var srcPath = $(this).attr("src"); 
				
				$img="<img src='"+srcPath +"'class=bigPic>"; 
				$("#section_detail_left_wrap").append($img);  		
			})
			$(".smallPic").eq(0).trigger("click");         
			/* 색상클릭 */
			var color="";
			$(".btnColor").click(function(){
				color = $(this).html(); //베이지  	
				$(".btnColor").css("backgroundColor","rgb(255,255,255)");             
				$(this).css("backgroundColor","rgba(0,0,0,0.3)");  
				
				  
				$.ajax({ 
					type:"get",
					url:"${pageContext.request.contextPath}/product/size?pNo="+${product.pNo}+"&color="+color,       
					dataType:"json",     
					success:function(result){			 
		               $("#section_datail_right_size_div2").empty(); 
		               if(result.length>0){       
		            	  $(result).each(function(i,obj){
		                     if(obj.dStock > 0){  
		                    	 var  $span = "<span class='section_datail_right_price_div1_size btnSize'>"+obj.dSize+"</span>";
		                    	 /* detailProduct  번호*/ 
		                    	var $detailNo = "<input type='hidden' value='"+obj.dNo+"' class='size_dNo'>"; 
		                    	 $("#section_datail_right_size_div2").append($span).append($detailNo);    
		                     }	                          
		                  })	
		           		}
					}
				})			
				$("#section_datail_right_size").show();        
			})
				$(".btnColor").eq(0).trigger("click");       
			/* 가격 */
				var price = 0; 
			/* 사이즈클릭 */
			$(document).on("click",".btnSize",function(){      
				price =$("#span_total").html();//49000
				price =price.replace(",",""); 
				var model = $("#productKor").html();
				var size = $(this).html();
				var dNo = $(this).next().val();     
				
				
				var classLength= $(".section_datail_right_oder_span1").length; 

				for(var i =0;i<classLength;i++){  
					var duplication_new = model+"/"+size+"/"+color;  
					var duplication_old =  $(".section_datail_right_oder_span1").eq(i).html(); 		
					if(duplication_new == duplication_old){
						alert("이미 추가되어 있습니다.");
						return;      
					}     
				} 
				
				var $div = $("<div class='section_datail_right_oder_div1'>");   
				var $span1 = $("<span class='section_datail_right_oder_span1'>").html(model+"/"+size+"/"+color);    
				var $span2 = $("<span class='section_datail_right_oder_span2 btnPlus'>").html("+");
				var $span3 = $("<span class='section_datail_right_oder_span3 cntSize'>").html("1");  
				var $span4 = $("<span class='section_datail_right_oder_span4 btnMinus'>").html("-");
				var $span5 = "<span class='section_datail_right_oder_span5'><span class='size_total'>"+nc(price)+"</span>원</span>&nbsp;";
				var $span6 = $("<span class='glyphicon glyphicon-remove nav_img deleteOrder'>");
				var $hiddendNo = "<input type='hidden' value='"+dNo+"' class='dNo'>"; 
				 $div.append($span1).append($span4).append($span3).append($span2).append($span5).append($span6).append($hiddendNo); 
				$("#section_datail_right_oder").append($div);   
				$("#section_datail_right_oder").show();    	
				    
				totalSum += Number(price.replace(",",""));        
		       
				/* 총가격 */     
				$("#section_datail_right_total_span").html(nc(totalSum));     
				
				
			})
			/* 사이즈삭제 */  
			$(document).on("click",".deleteOrder",function(){  
			
	  			var size_total= $(this).parent().find(".size_total").html();
				totalSum -= Number(size_total.replace(",",""));          
				/* 총가격 */
				$("#section_datail_right_total_span").html(nc(totalSum));      
				$(this).parent().remove();
				
			})    
		   /* 수량플러스 */   
			$(document).on("click",".btnPlus",function(){
				var cnt = $(this).parent().find(".cntSize").html();
				var sizeTotal = $(this).parent().find(".size_total").html(); 
					if(Number(cnt)== 10){     
						  	return;    
		 				}         
				var sum = Number(sizeTotal.replace(",",""));    
					sum += Number(price);    
					
				$(this).parent().find(".size_total").html(nc(sum));  
				$(this).parent().find(".cntSize").html(Number(cnt)+1);  
			/* 	alert( typeof (price ));     */  
				totalSum = totalSum+Number(price)
				$("#section_datail_right_total_span").html(nc(totalSum));       
			})  
			/* 수량마이너스 */
			$(document).on("click",".btnMinus",function(){
				var cnt = $(this).parent().find(".cntSize").html();
				if(Number(cnt)== 1){   
				/* 	alert("삭제버튼을 눌러주세요"); */
				  	return;    
 				}        
				
				var sizeTotal = $(this).parent().find(".size_total").html(); 
				var sum = Number(sizeTotal.replace(",",""));    
					sum -= Number(price);           
				$(this).parent().find(".size_total").html(nc(sum));    
				$(this).parent().find(".cntSize").html(Number(cnt)-1); 
				 
				totalSum = totalSum-Number(price)
				$("#section_datail_right_total_span").html(nc(totalSum));     
			})  
			
			/* 장바구니 */
			$("#btnBasket").click(function(){
				
				var classLength= $(".section_datail_right_oder_span1").length; 
					if(classLength==0){
						alert("주문 수량이 없습니다.");
						return; 
					}
					for(var i =0;i<classLength;i++){  
						
						var cnt =  $(".section_datail_right_oder_div1").eq(i).find(".cntSize").html(); 	
						var dNo =  $(".section_datail_right_oder_div1").eq(i).find(".dNo").val(); 	
					         /*  form태그안에 넣어야함 */  
											         
					    /* var hiddendNo ="<input type='hidden' value='"+dNo+"' name='dNo'>"; 
					    var hiddencnt ="<input type='hidden' value='"+cnt+"' name='cnt'>";  */
					 /*    $("#f1").append(hiddendNo).append(hiddencnt);   
					    $("#f1").attr("action","basket"); 
						$("#f1").submit();   */ 
						/* var sendData = {dNo:hiddendNo, cnt:hiddencnt}; */ 
						$.ajax({ 
							type:"get",
							url:"${pageContext.request.contextPath}/product/basketOder?dNo="+dNo+"&cnt="+cnt,  
							dataType:"text",     
							success:function(result){			 
				               console.log(result);  
				               
							}
						})					
					}
					
					var con = confirm("장바구니로 이동하시겠습니까?");
						if(con==false){
							return;
						}else if(con==true){
							location.href="basket";
						}
			})
			/* 바로구매 */
			$("#btnOrder").click(function(){
				
				var classLength= $(".section_datail_right_oder_span1").length; 
				if(classLength==0){
					alert("주문 수량이 없습니다.");
					return; 
				}
				for(var i =0;i<classLength;i++){  
					
					var cnt =  $(".section_datail_right_oder_div1").eq(i).find(".cntSize").html(); 	
					var dNo =  $(".section_datail_right_oder_div1").eq(i).find(".dNo").val(); 	
					var input1 = "<input type='hidden' name='bNo' value='"+dNo+"'>";  	  
					var input2 = "<input type='hidden' name='cnt' value='"+cnt+"'>";  
					$("#f1").append(input1).append(input2); 
				}
				    
				 
				
				$("#f1").attr("action","detailNowOrder"); 
				$("#f1").submit();  		
			})
		   	/* 상품정보 */
		   	$(".section_detail_select_span").eq(0).click(function(){
		   		$("#section_detail_review").css("display","none");  
		   		$("#section_detail_page").show();
		   	})  
		   	 	$(".section_detail_select_span").eq(1).click(function(){
		   		$("#section_detail_page").css("display","none"); 
		   		$("#section_detail_review").show();
		   	})   
		   		$(".section_detail_select_span").eq(1).trigger("click"); 
			
	
			/* 내용보여주기 */
			$(".span11").click(function(){
				  
				var index = $(".span11").index(this); 
				$(".review_content").eq(index).slideToggle(100);        
			})  
			
			/* 글쓰기 */
			$("#rWriterBtn").click(function(){
				/* var sendData = {rTitle:title, rContent:content,file;file};  */
				
				
				var title =$("#rTitle").val();
				
				var content = $("#comment").val().replace(/(^\s*)|(\s*$)/gi, "");
					if(title.lenth==0 ||content.length==0){
						alert("내용을 입력해주세요.");
						return false;
					}
				
					
			
				var form = $("#reviewForm")[0];
				var formDate = new FormData(form);
					/* formDate.append("fileObj",$("#rPic")[0].files[0]);
					formDate.append("rTitle",$("#rTitle").val());
					formDate.append("rContent",$("#comment").val());
					 */
					$.ajax({         
						type:"post",
						url:"${pageContext.request.contextPath}/review/write",
						data: formDate, //json 형태로 바꿔줌
						dataType:"text",//xml,text,json   
						/* headers:{"Content-Type":"application/json"},     */  
						processData: false,  // file전송시 필수   
 	    	         	contentType: false,    
						success:function(result){    
							console.log(result);             
				    		if(result=="success"){
				    			$("#rTitle").val("");  
				    			$("#comment").val("");  
				    			$(".closeW").trigger("click"); 
				    			location.href="detail?no=${dNo}";  
				    		}   
						}        
					})	 
			})
		
			/* 글쓰기취소 */
			$("#cancelWBtn").click(function(){
				$(".closeW").trigger("click"); 
			})
			/* 댓글삭제 */
			$(".deleteReview").click(function(){
				
				var con = confirm("정말삭제하시겠습니까?");
				if(con==false){     
					return;    
				}
				var index = $(".deleteReview").index(this);
				var rNo = $(".rNo").eq(index).val();
				var rPic = $(".rPic").eq(index).val();
				$.ajax({         
					type:"get",
					url:"${pageContext.request.contextPath}/review/deleteReview?rNo="+rNo+"&rPic="+rPic,
					dataType:"text",//xml,text,json     
					success:function(result){    
						console.log(result);             
			    		if(result=="success"){
			    			$(".deleteReview").eq(index).parent().parent().remove();     
			    		}
					}        
				})	  
			})
		})           
	</script>      
	<section>  
		<div id="section_detail">
			<div id="section_detail_left">
				<div id="section_detail_left_wrap">
				
				</div>
				<div id="section_detail_left_smallImg"> 
					 <c:forEach  var="d" begin="1" end="${product.pCnt}" >         
						<img src="${pageContext.request.contextPath }/resources/pic/${product.brand.bNameEng}_${product.pNameEng}_pic${d}.PNG" class="smallPic"> 
					</c:forEach>  
				 
				     
					<%-- <img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_page_pic1.PNG" class="smallPic">
					<img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_page_pic2.PNG" class="smallPic">
					<img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_page_pic3.PNG" class="smallPic"> 
					<img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_page_pic4.PNG" class="smallPic">
					<img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_page_pic5.PNG" class="smallPic">   --%>
				</div>
			</div>
			<div id="section_detail_right">    
				<div id="section_detail_right_wrap">
					<img src="${pageContext.request.contextPath }/resources/logo/${product.brand.bNameEng}_logo.PNG" id="logopic">
					&nbsp;&nbsp;<span id="productKor">${product.pNameKor}</span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span id="productEng">${product.pNameEng}</span><br>     
					&nbsp;&nbsp;&nbsp;&nbsp;<span id="productCode">상품코드:${product.pCode}</span>   
 				</div>  
 				<!-- 가격 -->
 				<div id="section_datail_right_price">
 					<div class="section_datail_right_price_div1">
 						<span class="section_datail_right_price_div1_span">판매가</span>
 					</div> 
 					<div class="section_datail_right_price_div2">
 					<fmt:formatNumber value="${product.pTotalPrice }" type="number" var="pTotalPrice"/>
					<fmt:formatNumber value="${product.pPrice }" type="number" var="pPrice"/>
					<fmt:formatNumber value="${product.pTotalPrice*0.01 }" type="number" var="pPoint"/>
 						<span id="section_datail_right_price_div2_total_price">
 						<span id="span_total">${pTotalPrice}</span>원</span>&nbsp;&nbsp;
 						<c:if test="${product.pRate > 0 }">
 						<span id="section_datail_right_price_div2_price">${pPrice}원</span> 
 						</c:if>
 						<br><span id="section_datail_right_price_div2_point">상품구매시 <span id="point">${pPoint}</span>p</span>  
 					</div> 
 				</div>
 				<!-- 배송 -->
 				<div id="section_datail_right_delivery">
 					<div class="section_datail_right_price_div1">
 						<span class="section_datail_right_price_div1_span">배송비</span>
 					</div>
 					<div class="section_datail_right_price_div2">
 						<span id="section_datail_right_delivery_span">무료배송(20,000원 이상 구매시 무료배송)</span>				
 					</div>
 				<!-- 컬러 -->
 				<div id="section_datail_right_color">
 					<div class="section_datail_right_price_div1">
 						<span class="section_datail_right_price_div1_span">색상</span>
 					</div>
 					<div id="section_datail_right_color_div">
 						<c:forEach var="list" items="${color}">
 						<span class="section_datail_right_color_span btnColor" id="section_datail_right_color_spanid">${list}</span>&nbsp;
 						</c:forEach>  
 						<!-- <span class="section_datail_right_color_span btnColor" id="section_datail_right_color_spanid">베이지
 						</span>&nbsp;&nbsp;<span class="section_datail_right_color_span btnColor">블랙</span> -->
 					</div>	
 				</div>
 				<!-- 사이즈 -->
 				<div id="section_datail_right_size">	
 					<div id="section_datail_right_size_div1">
 						<span id="section_datail_right_size_div1_span">사이즈</span>  
 					</div>
 					<div id="section_datail_right_size_div2">
 						<!-- <span class="section_datail_right_price_div1_size btnSize">220</span>  
 						<span class="section_datail_right_price_div1_size btnSize">230</span> 
 						<span class="section_datail_right_price_div1_size btnSize">240</span>    
 						<span class="section_datail_right_price_div1_size btnSize">250</span> 
 						<span class="section_datail_right_price_div1_size btnSize">260</span> 
 						<span class="section_datail_right_price_div1_size btnSize">270</span> 
 						<span class="section_datail_right_price_div1_size btnSize">280</span> 
 						<span class="section_datail_right_price_div1_size btnSize">290</span> 			 -->		
 					</div>	
 				</div>
 				<!-- 주문 -->
 				<div id="section_datail_right_oder">
 					<!-- <div class="section_datail_right_oder_div1">
 					<span  class="section_datail_right_oder_span1">나이키/245</span>
 					<span class="section_datail_right_oder_span2">+</span>
 					<span class="section_datail_right_oder_span3">1</span>
 					<span class="section_datail_right_oder_span4">-</span>
 					<span class="section_datail_right_oder_span5">49000원</span>&nbsp;
					<span class="glyphicon glyphicon-remove nav_img"></span> 
 					</div>
 					<div class="section_datail_right_oder_div1">
 					<span  class="section_datail_right_oder_span1">나이키/245</span>
 					<span class="section_datail_right_oder_span2">+</span>
 					<span class="section_datail_right_oder_span3">1</span>
 					<span class="section_datail_right_oder_span4">-</span>
 					<span class="section_datail_right_oder_span5">49000원</span>&nbsp;
					<span class="glyphicon glyphicon-remove nav_img"></span> 
 					</div>	
 					<div class="section_datail_right_oder_div1">
 					<span  class="section_datail_right_oder_span1">나이키/245</span>
 					<span class="section_datail_right_oder_span2">+</span>
 					<span class="section_datail_right_oder_span3">1</span>
 					<span class="section_datail_right_oder_span4">-</span>
 					<span class="section_datail_right_oder_span5">49000원</span>&nbsp;
					<span class="glyphicon glyphicon-remove nav_img"></span> 
 					</div>				 -->
 				</div>
 				<!-- 총가격 -->
 				<div id="section_datail_right_total">
 					<p id="section_datail_right_total_p">총 가격 : <span id="section_datail_right_total_span">0</span>원</p>
 				</div>
 				<!-- 구매 -->
 				<div id="section_datail_right_button">
 					<form id="f1" method="post">
 						
 					<button type="button" class="btn btn-default" id="btnBasket">장바구니</button>
 					<button type="button" class="btn btn-danger" id="btnOrder">바로구매</button>  
 					</form>
 				</div>
 				
 				</div>				
			</div>
		</div>
		<div id="section_detail_select">
			<span class="section_detail_select_span">상품 정보</span><span class="section_detail_select_span">상품 후기</span>
		</div>
		<!-- page -->
		<div id="section_detail_page">
			<img src="${pageContext.request.contextPath }/resources/page/${product.brand.bNameEng}_${product.pNameEng}_page.jpg" class="detail_page">
		</div>
		<div id="section_detail_review">
			<div id="section_detail_review_div">
				<h2>상품후기</h2>
				<div id="review_title">
					<span class="review_title_span span1">제목</span><span class="review_title_span">아이디</span><span class="review_title_span">날짜</span><span class="review_title_span">&nbsp;&nbsp;</span>
				</div>   
				
				<c:forEach var="list" items="${reviews}">  
				<div class="review_title_1">
					<input type="hidden" value="${list.rNo}" class="rNo"> 
					<input type="hidden" value="${list.rPic}" class="rPic">
					<span class="review_title_span1 span11">${list.rTitle}</span><span class="review_title_span1">${list.rId}</span>
					<fmt:formatDate value="${list.date  }" pattern="yyyy-MM-dd" var="date"/>
					<span class="review_title_span1">${date}</span>
					<span class="review_title_span1"> 
						<button type="button" class="btn btn-warning">수정</button>   
						<button type="button" class="btn btn-danger deleteReview">삭제</button>
					</span>       
				</div>        
				<div class="review_content">
					<img src="displayFile?filename=${list.rPic}" class="review_content_pic"><br>
				       
				
					<%-- <img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_pic1.PNG" class="review_content_pic"><br> --%>
					<div>
						<pre>${list.rContent}</pre>    
					</div> 	
				</div>
				</c:forEach>
				
				<%-- <div class="review_title_1">
					<span class="review_title_span1 span11">제목은제목이요</span><span class="review_title_span1">김매미</span><span class="review_title_span1">2016-08-08</span>
					<span class="review_title_span1">
						<button type="button" class="btn btn-warning">수정</button>   
						<button type="button" class="btn btn-danger">삭제</button>
					</span>  
				</div>
				<div class="review_content">
					<img src="${pageContext.request.contextPath }/resources/pic/Adidas_ZX 8000_pic1.PNG" class="review_content_pic"><br>
					<div>
						dskdqlwd
						dwqkd <br>
						dwqkd <br>            
						dwqkd <br>
						dwqkd <br>
						dwqkd <br>
						wqd
					</div> 	
				</div> --%>
		
				<div id="writerBtn">
					<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myWriterModal">글쓰기</button>
				</div>
				
				
			</div>
		
		</div>
					<!-- Modal -->
			<div id="myWriterModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			   
			    <!-- Modal content-->    
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close closeW" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">후기 작성</h4>
			      </div>   
			      <div class="modal-body">
				      	<form id="reviewForm" enctype="multipart/form-data">
						  <div class="form-group"> 
						    <label for="rTitle">제목</label>  
						    <input type="text" class="form-control" id="rTitle" name="rTitle">
						  </div>
						   <div class="form-group">
						    <label for="rPic">사진</label>
						    <input type="file" class="form-control" id="rPic" name="file">
						  </div>
						 <div class="form-group">
							  <label for="comment">내용</label>
							   <textarea class="form-control" rows="5" id="comment" name="rContent"></textarea>
							  <input type="hidden" value="${dNo }" name="detailNo">
							  <input type="hidden" value="${id}" name="rId">
							</div>  
							<button type="button" class="btn btn-info" id="rWriterBtn">글작성</button>
						  <button type="button" class="btn btn-default" id="cancelWBtn">취소</button>
						</form>		       
			      </div>	 
			    </div>  
			
			  </div>
			</div>
		
	</section>
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>