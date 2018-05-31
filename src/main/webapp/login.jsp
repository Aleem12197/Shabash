
<!DOCTYPE html>
<html>
<head>
<script >

</script>
 
<title>SignIn</title>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="771107126085-f7l9lcs13i72mi95gdcfmv5rsqah6uj1.apps.googleusercontent.com">

</head>
<body>

<div class="g-signin2" data-onsuccess="onSignIn"></div>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
 alert("signedin");
var fName=profile.getName();
var email=profile.getEmail();
var url="sessiontrack.jsp?uname="+fName+"&emid="+email;
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
alert(al);
//parent.display.location.reload(true);
}
}

</script>



<br>

<br>
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
alert("signedout");
    });
var url="logout.jsp";


if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getIn;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
function getIn(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
//parent.display.location.reload(true);
//document.getElementById(v).value="added to cart";
}
}
</script>
<br><br>


Upload YouTube Video Url Here:
<input type="text" value="" size="50" id="videourl" name="userName"/>
<br/><br/>


Category:<select id="cate" name="category">

  <option value="entertainment">entertainment</option>

  <option value="news">news</option>

  <option value="history">history</option>

  <option value="shortfilms">shortfilms</option>

 <option value="television">television</option>

<option value="knowledge">knowledge</option>

<option value="other">other</option>

</select>

<br/><br/>

Name:<input type="text" size="25" id="vid" value="" name="videoname"/>

<br/><br/>

Description:<input type="text" size="50" value="" id="desc" name="description"/>

<input type='button' value='upload' onclick="validate()"/>



</body>
<script>
function validate(){


var url=document.getElementById("videourl").value;

var nm=document.getElementById("vid").value;

var des=document.getElementById("desc").value;

var cat=document.getElementById("cate").value;

//alert(url);
var valid=0;
var ab=0;

if(url==""||url==null||url=="null"){
}
if(url!=""&&url!=null&&url!="null"){


var ind=url.indexOf('=');

var len=url.length;

//alert(ind);

//alert(len);

var su=url.substring(0,ind+1);

//alert(su);


if(ind<=len-12&&(su=="https://www.youtube.com/watch?v="||su=="youtube.com/watch?v="||su=="www.youtube.com/watch?v=")){

valid=1;

//alert("valid url");

}

if(valid==0){

alert("invalid url");

}else if(nm==""||des==""){

ab=1;
alert("video name or video description cannot be empty");

}

}

if(valid==1&&ab==0){

alert("send");
var url="save.jsp?videoid="+url+"&category="+cat+"&name="+nm+"&desc="+des;

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


//document.form.submit();
return true;

}

}


function getInfo(){

if(request.readyState==4){

var al=request.responseText;

b=al.substring(2,14);
//alert(b);
if(b=="please login")
alert(b);
else
alert(al);
}
}



</script>
</html>