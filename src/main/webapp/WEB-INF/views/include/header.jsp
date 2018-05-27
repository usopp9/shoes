<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		height: 130px;
		margin: 0 auto;   
	}
	#headernavbar_form{
		margin-top: 50px !important;
		margin-right: 200px !important;   
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
</style>    
<script type="text/javascript">
	$(function() {
		$("#navbrand").click(function(){
			$("#brand_div").slideToggle(500);
		})    
	})  
</script>
</head>
<body>
	<nav class="navbar navbar-inverse" id="headernavbar">
  <div class="container-fluid">
   <!--  <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div> -->
   <!--  <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul> -->
    <ul class="nav navbar-nav navbar-right" id="headernavbar_nav">
   		<li><a href="#"><span class="glyphicon glyphicon-log-in nav_img"></span> <span class="nav_modal" data-toggle="modal" data-target="#myModal">  로그인</span></a></li>
     	<li><a href="#"><span class="glyphicon glyphicon-user nav_img"></span> <span class="nav_modal">  회원가입</span></a></li>
    </ul>
  </div>
</nav>
	<header>
		<a href="#"><img src="resources/images/1.PNG"></a>    
		   <form class="navbar-form navbar-right" action="/action_page.php" id="headernavbar_form">
			  <div class="input-group">
			    <input type="text" class="form-control" placeholder="Search" id="headerInput">
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
		  <!-- db foreach -->
		    <li><a href="#" class="nav_nav_a">운동화</a></li>
		    <li><a href="#" class="nav_nav_a">스포츠/레저</a></li>
		    <li><a href="#" class="nav_nav_a">구두</a></li>  
		    <li><a href="#" class="nav_nav_a">샌들</a></li>
		    <li><a href="#" class="nav_nav_a">부츠</a></li>
		  </ul>
		  <button type="button" class="btn navbar-btn" id="navbrand">브랜드</button>
		  <div id="brand_div">
		  	<div id="brand_div_div">
			브랜드 내용<br>
			브랜드 내용<br>  
			브랜드 내용<br>
			브랜드 내용<br>
			브랜드 내용<br>
			브랜드 내용<br>
			브랜드 내용<br>
			브랜드 내용<br>
			브랜드 내용<br>
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
          <button type="button" class="btn btn-primary">로그인</button>
          <button type="button" class="btn btn-success">네이버 로그인</button><br><br>
          <span><a href="#">아이디 찾기</a></span> / <span><a href="#">비밀번호 찾기</a></span>
        </div>
      </div>
      
    </div>
  </div>
	
</body>
</html>