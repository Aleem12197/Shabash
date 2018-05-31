function deletevideo(id){
//alert(id);
var url="delete.jsp?videoid="+id;

if(window.XMLHttpRequest){

request=new XMLHttpRequest();

}
else if(window.ActiveXObject){

request=new ActiveXObject("Microsoft.XMLHTTP");

}


try
{

request.onreadystatechange=getinfo;

request.open("GET",url,true);

request.send();

}

catch(e)
{

alert("Unable to connect to server");

}


}
function getinfo(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
location.reload(true);
}
}

