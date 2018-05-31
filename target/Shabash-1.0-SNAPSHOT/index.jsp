<html>
<head>
<script>
function changedis(){
var val=document.getElementById("sortby").value;
var url="sortsession.jsp?sortby="+val;
if(window.XMLHttpRequest){

request=new XMLHttpRequest();

}
else if(window.ActiveXObject){

request=new ActiveXObject("Microsoft.XMLHTTP");

}


try
{

request.onreadystatechange=getin;

request.open("GET",url,true);

request.send();

}

catch(e)
{

alert("Unable to connect to server");

}


}

function getin(){
if(request.readyState==4){
window.frames['display'].location.reload(true);

}
}

</script>
</head>
<body>
<center><h1>SHABASH</h1></center>
<a href="all.jsp" target="display">All</a>
<a href="entertainment.jsp" target="display">Entertainment</a>
<a href="news.jsp" target="display">News</a>
<a href="history.jsp" target="display">History</a>
<a href="shortfilms.jsp" target="display">Shortfilms</a>
<a href="television.jsp" target="display">Television</a>
<a href="knowledge.jsp" target="display">Knowledge</a>
<a href="other.jsp" target="display">Other</a>
sort by:
<select id="sortby" onchange="changedis()" name="sortby">
1-<option value="least">Least recently uploaded</option>
2-<option value="most">Most recently uploaded</option>
3-<option option value="likes">Number of Likes</option>
</select>

<iframe allowfullscreen="" frameborder="0" align="left" src="all.jsp" name="display" id="displayid" width="75%" height="100%"></iframe>
<iframe frameborder="0" align="right" name="login" src="login.jsp" width="25%" height="100%"></iframe>
</body>
</html>