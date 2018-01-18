<?php
require_once("../../init.php");	

function insertProduct(){
	global $conn;
	$uid=$_REQUEST["uid"];
	$pid=$_REQUEST["pid"];
	$count=$_REQUEST["count"];
	$sql="select * from shoppingcart where uid=$uid and pid=$pid";
	$res=mysqli_fetch_row(mysqli_query($conn,$sql));
	//var_dump($res);
	if(count($res)!=0){
		if($count>0){
			$sql="update shoppingcart set count=$count where uid=$uid and pid=$pid";
		}else{
			$sql="delete from shoppingcart where uid=$uid and pid=$pid";
		}
	}else{
		$sql="insert into shoppingcart values(null,$uid,$pid,$count,1)";
	}
	//var_dump($sql);
	mysqli_query($conn,$sql);
}

function getProduct(){
	global $conn;
	$uid=$_REQUEST["uid"];//也可以用SESSION
	//var_dump($uid);
	$sql="select pid,count from shoppingcart where uid=$uid and count>0";
	$result=mysqli_query($conn,$sql);
	$pids=mysqli_fetch_all($result,1);
	$output=[];
	//var_dump($pids);
	//if($pids)
	for($i=0;$i<count($pids);$i++){
		$p=$pids[$i]["pid"];
		$sql="select styleId,number,price from product where pid=$p";
		$outs=mysqli_fetch_row(mysqli_query($conn,$sql));
		//var_dump($outs);
		$sql="select sname from style where styleId=($outs[0])";
		$styleId=mysqli_fetch_row(mysqli_query($conn,$sql));
		$sql="select maximg from productimg where pid=$p";
		$img=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]=[
			"pid"=>$pids[$i]["pid"],
			"number"=>$outs[1],
			"price"=>$outs[2],
			"minimg"=>$img[0],
			"style"=>$styleId[0],
			"count"=>$pids[$i]["count"]
		];
	}
	echo json_encode($output);
}

/*function deleteproduct(){
	global $conn;
	$uid=$_REQUEST["uid"];
	$pid=$_REQUEST["pid"];
	$sql="delete from shoppingcart where uid=$uid and pid=$pid";
	$result=mysqli_query($conn,$sql);
}*/
?>