<%@ page import="java.sql.*" %>
<%
String em=(String)session.getAttribute("email");
String u=request.getParameter("videoid");
String ur=u.replace("watch?v=","embed/");
String nm=request.getParameter("name");
String des=request.getParameter("desc");
String cate=request.getParameter("category");
if(em!=null){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from talent");
while(rs2.next()){
if(rs2.getString(2).equals(ur)){
String warnin="url, which you're trying to upload already exists";
out.println(warnin);

ur="already exist";
break;
}
}
if(ur!="already exist"){
PreparedStatement ps=con.prepareStatement(
"insert into talent values(?,?,?,?,?,?,?,?,?)");
String vid=em+System.currentTimeMillis();
ps.setString(1,vid);
ps.setString(3,em);
ps.setString(2,ur);
ps.setString(4,nm);
ps.setString(5,des);
ps.setString(6,cate);
ps.setString(7,"no");
ps.setInt(8,0);
ps.setInt(9,0);

ps.executeUpdate();
out.print("You have successfully uploaded...");
}
con.close();
}catch(Exception e){
out.print(e);
}
}
else
out.print("please login");
%>