<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NekoShoes_회원가입</title>
<style>
	section{
		width: 50%;
		margin: 0 auto;
	}
	#joinResult_p{
		text-align: center;
		font-size: 20px;
		position: relative;
	}
	#name_span{
		font-weight: bold;
		color: #5F00FF;
	}
	#btnlogin{
		position: absolute;
		top: 350px;  
		right: 200px;     
	}      
</style>
</head>
<body>
<%@ include file="../include/header.jsp"%>	
	
		<section>
			
			<p id="joinResult_p">
			<img src="${pageContext.request.contextPath}/resources/images/cat.png" id="joinResult_img">   
			<span id="name_span">${name }님</span>의 회원가입이 완료되었습니다.
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="btnlogin">로그인</button>
			   
			</p>   		  
		</section>
	
<%@ include file="../include/footer.jsp"%>
</body>
</html>  