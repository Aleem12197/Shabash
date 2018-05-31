import java.io.*;  
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class Hom extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out =response.getWriter();
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
Statement pst=con.createStatement();
ResultSet rst=pst.executeQuery("select * from talent where isapproved='no'");
String vid,bo,ob;
while(rst.next()){
vid=rst.getString(1);

bo=request.getParameter(vid);
ob=request.getParameter(vid+"_cat");
out.print(bo);
Statement ps=con.createStatement();
ps.executeUpdate("update talent set category='"+ob+"', isapproved='"+bo+"' where videoid='"+vid+"'");
ps.close();
}
rst.close();
pst.close();
con.close();
}catch(Exception e){
out.print(e);
}
}
}
