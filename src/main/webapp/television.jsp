<html>
<head>
<script src="ajax.js">
</script>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String srt=(String)session.getAttribute("sortby");
if(srt==null||srt=="null")
srt="least";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learning","shabaash","ShaBash@123");
Statement st=con.createStatement();
ResultSet rs=null;
if(srt.equals("least"))
rs=st.executeQuery("select videoid,url,name,description,nolikes from talent where category='television' and isapproved='yes' order by right(videoid,13)");
else if(srt.equals("most"))
rs=st.executeQuery("select videoid,url,name,description,nolikes from talent where category='television' and isapproved='yes' order by right(videoid,13) desc");
else if(srt.equals("likes"))
rs=st.executeQuery("select videoid,url,name,description,nolikes from talent where category='television' and isapproved='yes' order by nolikes desc");
while(rs.next()){
out.print(rs.getString(3));
out.print("<br><iframe allowfullscreen='allowfullscreen' src='"+rs.getString(2)+"'></iframe>");
out.print("<br>"+rs.getString(4));
out.print("<br><div id='"+rs.getString(1)+"divlikes'>"+rs.getInt(5)+"</div>");
out.print("<input type='button' onclick='like(this.id)' value='like' id='"+rs.getString(1)+"'>");
out.print("<br><input type='text' id='"+rs.getString(1)+"comment' size='50'>");
out.print("<input type='button' onclick='addcomment(this.id)' id='"+rs.getString(1)+"' value='Add Comment'><br>");
out.print("<div id='"+rs.getString(1)+"divcomments'>");
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select username,comment from comments where videoid='"+rs.getString(1)+"'");
while(rs1.next())
out.print(rs1.getString(1)+":"+rs1.getString(2)+"<br>");
out.print("</div><br>");

}
con.close();
}catch(Exception ex){
out.print(ex);
}
%>
</body>
</html>