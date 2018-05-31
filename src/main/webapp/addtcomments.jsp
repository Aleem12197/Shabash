<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


<%
String em=(String)session.getAttribute("email");
String un=(String)session.getAttribute("uname");
if(em!=null){
//String idstr=(String)session.getAttribute("itemid");
String vid=request.getParameter("videoid");
String co=request.getParameter("comment");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
//out.print("connected");
Statement st=con.createStatement();
st.executeUpdate("insert into comments values('"+vid+"','"+em+"','"+un+"','"+co+"')");
ResultSet rs1=st.executeQuery("select username,comment from comments where videoid='"+vid+"'");
while(rs1.next()){
out.print(rs1.getString(1)+": "+rs1.getString(2)+"<br>");

}
con.close();
}catch(Exception ex){
out.print(ex);
}
}
else
out.print("please login");
%>