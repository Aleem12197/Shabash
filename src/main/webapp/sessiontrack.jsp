
<%@ page import="java.io.*" %>
<% 
int flag=0;
String username=request.getParameter("uname");
String em=request.getParameter("emid");        
session.setAttribute("uname",username);  
session.setAttribute("email",em);
out.print("login done");
%>