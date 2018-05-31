<%@ page import="java.sql.*"%>


<%

String s=request.getParameter("videoid");

String user=(String)session.getAttribute("uname");
if(user!=null){


try{

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");


PreparedStatement ps=con.prepareStatement("select videoid from likes where userid='"+user+"'");

int l=0;

ResultSet rs=ps.executeQuery();

while(rs.next()){

if(s.equals(rs.getString(1)))
   
l=1;

}

if(l==0){

ps=con.prepareStatement("insert into likes values(?,?)");

ps.setString(1,s);

ps.setString(2,user);

ps.executeUpdate();


 ps=con.prepareStatement("update talent set nolikes=nolikes+1 where videoid='"+s+"'");

ps.executeUpdate();



//out.print("updated");

ps=con.prepareStatement("select nolikes from talent where videoid='"+s+"'");

ResultSet rs1=ps.executeQuery();

rs1.next();

out.print(rs1.getInt(1));

}

else

out.print("you already liked this video");

con.close();

}catch(Exception e){
e.printStackTrace();
}


}
else
out.print("please login");

%>