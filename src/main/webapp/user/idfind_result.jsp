<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
     String tel = request.getParameter("tel");
     
LoginDAO dao = new LoginDAO();
 String member_mid = dao.findId_tel(name, tel); //아이디를 디비에서 가져옴..실패시 널
 
%>
<%
 request.setCharacterEncoding("UTF-8");
    String name1 = request.getParameter("name");
     String email = request.getParameter("tel");
     
LoginDAO dao1 = new LoginDAO();
 String member_mid1 = dao.findId_email(name, email); //아이디를 디비에서 가져옴..실패시 널
 
%>

  <form name="idsearch" method="post">
      <%
       if (member_mid != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=member_mid%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="로그인" onClick = 'login()'/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onclick="location=window.open('join.do')"/>
 		   
       	</div>
       </div>
       
       <%
  }
 %> 
      </form>
</body>
</html>