<?php
require_once("../../init.php");
	
function searchProMsg(){
	global $conn;
	@$keyword=$_REQUEST["keyword"];
	$sql="select pid,number from product where";
	
	$kws=explode(" ",$keyword);
		for($i=0;$i<count($kws);$i++){
		$kws[$i]=" title like '%".$kws[$i]."%'";
	}

	$keyword=implode("and",$kws);
	$sql.= $keyword."limit 0,5";
	//var_dump($sql);
	$result=mysqli_query($conn,$sql);
	$arr=mysqli_fetch_all($result,1);
	//var_dump($arr);
	echo json_encode($arr);
}
function product(){
	global $conn;
	@$styleId=$_REQUEST["styleId"];
	@$pno=$_REQUEST["pno"];
	@$keyword=$_REQUEST["keyword"];
	@$order=$_REQUEST["order"];
	$styleId=8;
	if($styleId=="" || $styleId==null){$styleId=8;}
	
	if($pno=="" || $pno==null){$pno=1;}
	$sql="select count(*) from product where styleId=$styleId";
	if($keyword){
		 $kws=explode(" ",$keyword);
		 for($i=0;$i<count($kws);$i++){
			$kws[$i]=" and title like '%".$kws[$i]."%'";
		 }
		 $keyword=implode("",$kws);
		 $sql.= $keyword;
	}
	
	$count=mysqli_fetch_assoc(mysqli_query($conn,$sql));
		//var_dump($count);
	
	if($count['count(*)']<=6){
		$pagesize=$count['count(*)']-0;
	}else{
		$pagesize=6-0;
	}
	//var_dump($pagesize);
	$totalpage=ceil($count["count(*)"]/$pagesize);//得出分页数
	$start=$pagesize*($pno-1);
	$output=[];
	$sql="select pid,styleId,number,FORMAT(price,2) as price from product where styleId=$styleId";
	if($keyword){
		$sql.= $keyword;
	}
	if($order){
		$sql.=" order by $order";
	}
	$sql.=" limit $start,$pagesize";
	//var_dump($sql);
	$products=mysqli_fetch_all(mysqli_query($conn,$sql),1);
	//var_dump($products);
	$output=$products;
	for($i=0;$i<count($products);$i++){
		$pid=$products[$i]["pid"];
		$sql="select midimg from productimg where pid='$pid'";
		$result=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]["midimg"]=$result;

		$sql="select sname from style where styleId=(select styleId from product where pid='$pid')";
		$result=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]["style"]=$result;
	}
	$prepage=1;//打包分页信息
	$pno>1 && $prepage=$pno-1;
	$nextpage=$totalpage;
	$pno<$totalpage && $nextpage=$pno+1;
	$prenext=["prepage"=>$prepage,"pno"=>$pno,"totalpage"=>$totalpage,"nextpage"=>$nextpage];
	//var_dump($output);
	Array_push($output,$prenext);
	echo json_encode($output);
}	

function topsale(){
	global $conn;
	$output=[];
		/*$output[
		
		];*/
	
	$sql="select pid from topsale order by salecount desc limit 3";
	$pids=mysqli_fetch_all(mysqli_query($conn,$sql),1);
	//var_dump($pids);
	
	for($i=0;$i<count($pids);$i++){
		$pid=$pids[$i]["pid"];
		//echo $pid;
		$sql="select number from product where pid='$pid'";
		$result=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]["pid"]=$pid;
		$output[$i]["number"]=$result;

		$sql="select midimg from productimg where pid='$pid'";
		$result=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]["midimg"]=$result;

		$sql="select sname from style where styleId=(select styleId from product where pid='$pid')";
		$result=mysqli_fetch_row(mysqli_query($conn,$sql));
		$output[$i]["style"]=$result;
	}
	//var_dump($output);
	echo json_encode($output);
}

function prodetails(){
	global $conn;
	@$pid=$_REQUEST['pid'];
	if($pid){
		//$sql="select * from product,productimg,product_details where product.pid=productimg.pid=product_details.pid=$pid";	
		$sql="select * from product left join productimg on product.pid=productimg.pid
		left join product_details on productimg.pid=product_details.pid where product.pid=$pid";
		$output=mysqli_fetch_assoc(mysqli_query($conn,$sql));
		
		$sql="select sname from style where styleId=(select styleId from product where pid=$pid)";
		$row=mysqli_fetch_assoc(mysqli_query($conn,$sql));
		$output=array_merge($output,$row);
		//var_dump ($output);
		//var_dump ($row);
		echo json_encode($output);
	}
}


?>	