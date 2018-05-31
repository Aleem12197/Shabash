import java.io.*;  
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Delete extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out =response.getWriter();
if(request.getParameter("adminid").equals("naresh@shab.com") ){
if( request.getParameter("adminpwd").equals("ShaBash@123")){
out.print("login done");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
ResultSet rs=null;
Statement ps=con.createStatement();
rs=ps.executeQuery("select videoid,url,name from talent");
while(rs.next()){
out.print(rs.getString(3)+"<br>");
out.print("<iframe src='"+rs.getString(2)+"'></iframe>");
out.print("<br><input type='button' id='"+rs.getString(1)+"' value='delete' onclick='deletevideo(this.id)'>");
out.print("<hr>");
}
out.print("<script src='ajax1.js'></script>");
con.close();
}catch(Exception e){
out.print(e);

}
}else
out.print("wrong password");
}else
out.print("wrong id");
}
}

