import java.io.*;  
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Home extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException,IOException {

response.setContentType("text/html");
RequestDispatcher rd=request.getRequestDispatcher("/admin.html");  
        rd.include(request, response); 
//req.getRequestDispatcher("/").include(req, res);
}








public void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out =response.getWriter();
if(request.getParameter("adminid").equals("rehana@mom.com") ){
if( request.getParameter("adminpwd").equals("naresh@123")){
out.print("login done");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
ResultSet rs=null;
Statement ps=con.createStatement();


rs=ps.executeQuery("select videoid,url,name,category from talent where isapproved='no'");
String hr;

out.print("</iframe height='100%' width='50%' align='right'><form action='hom' method='post'>");
while(rs.next()){
hr=rs.getString(2);
out.print("<br><iframe src=\"");
out.print(hr);
out.print("\" height='315' width='420'>");
out.print("</iframe>"+"<br>");
Statement stat=con.createStatement();
ResultSet rset=stat.executeQuery("select distinct category from talent");
out.print("<select name='");
out.print(rs.getString(1)+"_cat' >");
while(rset.next()){
out.print("<option value='");
out.print(rset.getString(1)+"'");
if(rs.getString(4).equals(rset.getString(1)))
 out.print(" selected");
out.print(">");
out.print(rset.getString(1));
out.print("</option>");
}
out.print("</select>");
rset.close();
stat.close();
out.println();

out.print("approve?\nyes");
out.print("<input type='radio' value='yes' name='");
out.print(rs.getString(1));
out.print("' checked //>");
out.print("\nno");
out.print("<input type='radio' value='no' name='");
out.print(rs.getString(1));
out.print("' //>");
}
out.print("\n");
out.print("<input type='submit' value='save'>");
out.print("<//form></iframe>");
rs.close();
ps.close();
con.close();
}catch(Exception e){
out.print(e);
}
}else
out.print("wrong password");
}else
out.print("wrong id");
/*
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");

Statement ps=con.createStatement();
ResultSet rs=ps.executeQuery("select * from talent");
String hr;

out.print("<iframe align="right" height="100" width="50%"><form action='home2' method='post'>");
while(rs.next()){
hr=rs.getString(2);
out.print("<br><iframe src=\"");
out.print(hr);
out.print("\" height='315' width='420'>");
out.print("</iframe>"+"<br>");

out.print("<input type='text' size='45' name='");
out.print(rs.getString(1));
out.print("'><input type='submit' name='");
out.print(rs.getString(1));
out.print("' value='add comment'><br>");
String val=hr.substring(30);
Statement st1=con.createStatement();

ResultSet rs1=st1.executeQuery("select * from "+rs.getString(1));
while(rs1.next()){
out.println(rs1.getString(2));
out.print("<br>");
}
rs1.close();
st1.close();
}
out.print("</form></iframe>");
ps.close();
rs.close();

}catch (Exception e2) {System.out.println(e2);}
out.close(); */
}
}