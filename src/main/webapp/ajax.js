var v;


var idv;
function like(clicked_id)
{

    //alert(clicked_id);


v=clicked_id;


var url="likes.jsp?videoid="+v;


if(window.XMLHttpRequest){

request=new XMLHttpRequest();

}
else if(window.ActiveXObject){

request=new ActiveXObject("Microsoft.XMLHTTP");

}


try
{

request.onreadystatechange=getInfo;

request.open("GET",url,true);

request.send();

}

catch(e)
{

alert("Unable to connect to server");

}

}


function getInfo(){

if(request.readyState==4){

var al=request.responseText;

//alert(al);


var num=parseInt(al);

//alert(num);

var v1=v.concat("divlikes");
//alert(v1);
var b=al.substring(4,16);
//alert(b);
if(b=="please login")
alert(b);
else if(isNaN(num)||num==NaN)

alert("you have already liked this video");


else{

var node=document.getElementById(v1);


//var a=node.textContent;
//alert(a);
//var num1=parseInt(a);

//alert(num1);

//if (num1==num-1)
//{

//alert("hi bro");

document.getElementById(v1).innerHTML=al;
//alert("middle");
//document.getElementById(v1).innerHTML=num;

//alert("bye");
//}

}

}
}



















function addcomment(vid){
idv=vid;
//alert(idv);
var co=document.getElementById(idv.concat("comment")).value;
var len=co.split(' ').length-1;
//alert(len);

if(co==null||co==""||len==co.length){

alert("this comment is not allowed");

}
else{

//alert(co);
var url="addtcomments.jsp?comment="+co+"&videoid="+idv;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInf;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
}


function getInf(){
if(request.readyState==4){
var al=request.responseText;
//alert(al);
//var al=request.responseHTML;
var b=al.substring(8,20);
//alert(b);
if(b=="please login"){
alert(b);
}
else{
document.getElementById(idv.concat("comment")).value="";
document.getElementById(idv.concat("divcomments")).innerHTML=al;
}
}
}

