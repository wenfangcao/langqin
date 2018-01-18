<?php
require_once("../../init.php");	


function login(){
	global $conn;
	@$phone=$_REQUEST["phone"];
	@$email=$_REQUEST["email"];
	@$upwd=$_REQUEST["upwd"];
	$upwd="md5($upwd)";
	if($phone){
		$sql="select uid from user where phone='$phone' and upwd=md5('$upwd')";
	}else{
		$sql="select uid from user where email='$email' and upwd=md5('$upwd')";
	}	
		$rel=mysqli_fetch_row(mysqli_query($conn,$sql));
		if($rel){
			session_start();
			$_SESSION["uid"]=$rel[0];
			echo json_encode(["ok"=>1,"uid"=>$rel[0]]);
		}else{
			echo json_encode(["ok"=>0]);
		}
}
	
function islogin(){
	global $conn;
	session_start();
	@$uid=$_SESSION["uid"];
	if($uid){
		$sql="select uname from user where uid='$uid'";
		$uname=mysqli_fetch_row($result=mysqli_query($conn,$sql))[0];
		echo json_encode(["ok"=>1,"uname"=>$uname,"uid"=>$uid]);
	}else{
		echo json_encode(["ok"=>0]);
	}
}

function register(){
	global $conn;
	@$uname=$_REQUEST["uname"];
	@$upwd=$_REQUEST["upwd"];
	@$sex=$_REQUEST["sex"];
	@$phone=$_REQUEST["phone"];
	@$email=$_REQUEST["email"];
	$upwd="md5($upwd)";
	if($email){
		$sql="insert into user values(null,'$uname',md5('$upwd'),$sex,null,'$email')";
	}else if($phone){
		$sql="insert into user values(null,'$uname',md5('$upwd'),$sex,'$phone',null)";
	}
	$result=mysqli_query($conn,$sql);
	if($email){
		$sql="select uid from user where email='$email'";
	}else if($phone){
		$sql="select uid from user where phone='$phone'";
	}
	$uid=mysqli_fetch_row(mysqli_query($conn,$sql));
	session_start();
	$_SESSION["uid"]=$uid[0];

	if($result){
		echo json_encode(["ok"=>1]);
	}else{
		echo json_encode(["ok"=>0]);
	}
}

function logout(){
	session_start();
	session_unset();
	session_destroy();
}

function checkphone(){
	global $conn;
	@$phone=$_REQUEST["phone"];
	@$email=$_REQUEST["email"];
	if($phone){
		$sql="select uid from user where phone='$phone'";
	}else{
		$sql="select uid from user where email='$email'";
	}
	$row=mysqli_fetch_row(mysqli_query($conn,$sql));
	if($row){
		echo json_encode(["ok"=>1]);
	}else{
		echo json_encode(["ok"=>0]);
	}
}

function checkphpcode(){
	global $conn;
	@$captcha=$_REQUEST["captcha"];
	session_start();
	if(strcasecmp($_SESSION["captcha"],$captcha)==0){
		echo json_encode(["ok"=>1]);
	}else{
		echo json_encode(["ok"=>0]);
	}
}
?>	