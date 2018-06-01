<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	#headernavbar{
		background-color: white !important; 
		border: 1px solid white !important;
	} 
	.nav_modal, .nav_img{   
		color: #021C51 !important;    
		font-weight: bold !important;         
	}  
	header{   
		width: 40%;
		min-width:930px;            
		height: 130px;
		margin: 0 auto;   
	}
	#headerimg{
		margin-left: 100px;  
	}
	#headernavbar_form{
		margin-top: 50px !important;
		margin-right: 150px !important;          
	}
	#headerInput{
		width: 350px !important;   
		height: 40px !important;
	}
	#headerButton{  
		height: 40px !important;     
	}     
	#navbar_navbar{
		background-color: #C2B7F1 !important; 
		border: 1px solid white !important;  
	} 
	.nav_nav_a{
		color: #021C51 !important;    
		font-weight: bold !important;    
	} 
	 #nav_nav{
		width: 40%;     
		margin-left: 550px;  
	} 
	#navbrand{
		background-color: #C2B7F1 !important; 
		border: 1px solid #021C51 !important;
		padding-top: 10px;
		font-weight: bold;
	}
	#brand_div{
		width:100%;
		background-color: white;   
		display: none;	  
	}
	#brand_div_div{
		width: 50%;
		margin: 0 auto;     
		overflow: auto;   
		height: 140px; 	
	}   
	.brand_div_img{
		width: 150px;     
		height: 80px;       
		float: left;
		margin-top: 10px;
		margin-right: 36px;     
	}      
	.brand_div_img img{   
		float: left;
	}  
	.brand_div_img1{
		width: 100%;
		height: 50px;   
	}
	.brand_div_p{
		text-align: center;
		margin-top: 8px;
		font-weight: bold;  
		color:#021C51;    
	}
</style>    
<script type="text/javascript">
	$(function() {
		
		/* category */
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/header",   
			dataType:"json",
			headers:{"Content-Type":"application/json"},
			success:function(result){			
               for(var i = 0; i<result.length; i++){
            	   $li="<li><a href='${pageContext.request.contextPath}/search/brand?search="+result[i].cName+"&type=category'' class='nav_nav_a'>"+result[i].cName+"</a></li>";        
                   $("#nav_nav").append($li);   
               }
			}
		})
		
		/* brand */
		$("#navbrand").click(function(){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/header/brand",   
				dataType:"json",
				headers:{"Content-Type":"application/json"},
				success:function(result){	
					console.log(result);  
					$("#brand_div_div").empty();  
	                for(var i = 0; i<result.length; i++){      
	                	
	                   $div= $("<div class='brand_div_img'>");   
	                   $a = $("<a href='${pageContext.request.contextPath}/search/brand?search="+result[i].bNameKor+"&type=brand'>");                    
	            	   $img="<img src='${pageContext.request.contextPath}/resources/logo/"+result[i].bNameEng+"_logo.PNG' class='brand_div_img1'>";        
	                   $p="<p class='brand_div_p'>"+result[i].bNameKor+"</p>"; 	
	                   $a.append($img).append($p);
	                   $div.append($a);  
	                   $("#brand_div_div").append($div);                      
	               }   
				}
			})
		$("#brand_div").slideToggle(500);
		})   
		/* 회원가입이동 */	
		$("#joingo").click(function(){
			location.href="${pageContext.request.contextPath}/member/join";   
		})   
		
		/* 로그인 */	
		$("#main_login").click(function(){
			var id = $("#usr").val();
			var pw = $("#pwd").val();
					
			if(id.length==0 ||pw.length==0){
				alert("아이디와 비밀번호를 입력해주세요.");   
				return;
			}else{
				var sendData = {id:id, password:pw}; 
				$.ajax({ 
					type:"post",
					url:"${pageContext.request.contextPath}/header/login",
					data: JSON.stringify(sendData), //json 형태로 바꿔줌
					dataType:"text",//xml,text,json
					headers:{"Content-Type":"application/json"},
					success:function(result){
						console.log(result);     
						if(result=="fail"){
							alert("아이디 또는 비밀번호를 다시 확인하세요.");
							return;  
						}else if(result="success"){
							/*  $(".close").trigger("click");  */
							location.href="${pageContext.request.contextPath}/"; 
						}	 
					}
				})
			}
		})
		
		/* 로그아웃 */
		$("#logout").click(function(){
			location.href="${pageContext.request.contextPath}/logout";
		})
		
	})  
</script>
</head>
<body>
	<nav class="navbar navbar-inverse" id="headernavbar">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav navbar-right" id="headernavbar_nav">
 
    	 <c:choose>
    		<c:when test="${name != null }">
    			<li><a href="#" id="logout"><span class="glyphicon glyphicon-heart nav_img"></span><span class="nav_modal">[${name }님] 로그아웃</span></a></li>
     			<li><a href="#"><span class="glyphicon glyphicon-user nav_img"></span> <span class="nav_modal">마이페이지</span></a></li>
    			<li><a href="#"><span class="glyphicon glyphicon-shopping-cart nav_img"></span> <span class="nav_modal">장바구니</span></a></li>
    		</c:when> 
    		<c:otherwise>
    			<li><a href="#"><span class="glyphicon glyphicon-log-in nav_img"></span> <span class="nav_modal" data-toggle="modal" data-target="#myModal">  로그인</span></a></li>
     			<li><a href="#" id="joingo"><span class="glyphicon glyphicon-user nav_img"></span> <span class="nav_modal">회원가입</span></a></li>
    		</c:otherwise>
    	</c:choose> 
   		
    </ul>  
  </div>     
</nav>
	<header>
		<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/1.PNG" id="headerimg"></a>    
		   <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/search/brand" method="post" id="headernavbar_form">
			  <div class="input-group">
			    <input type="text" class="form-control" placeholder="Search" id="headerInput" name="search"> 
			    <div class="input-group-btn">
			      <button class="btn btn-default" type="submit" id="headerButton">
			        <i class="glyphicon glyphicon-search"></i>
			      </button>
			    </div>
			  </div>
			</form>
	</header>
	<nav class="navbar navbar-inverse" id="navbar_navbar">
		  <ul class="nav navbar-nav" id="nav_nav">    
		
		  </ul>
		  <button type="button" class="btn navbar-btn" id="navbrand">브랜드</button>
		  <div id="brand_div">
		  	<div id="brand_div_div">
			  		
			</div>
		</div>
		</nav>
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
			  <label for="usr">아이디</label>
			  <input type="text" class="form-control" id="usr">
			</div>
			<div class="form-group">
			  <label for="pwd">비밀번호</label>
			  <input type="password" class="form-control" id="pwd">
			</div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" id="main_login">로그인</button>
          <button type="button" class="btn btn-success">네이버 로그인</button><br><br>
          <span><a href="#">아이디 찾기</a></span> / <span><a href="#">비밀번호 찾기</a></span>
        </div>
      </div>
    </div>
  </div>
	
</body>
</html>