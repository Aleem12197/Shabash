<%@ page import="java.sql.*" %>
<%
String vid=request.getParameter("videoid");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
Statement st=con.createStatement();
st.executeUpdate("delete from talent where videoid='"+vid+"'");
out.print("deleted");
con.close();
}catch(Exception e){
out.print(e);
}
%>