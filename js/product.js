var btn=document.querySelector(".main>.seldiv>select");
	var order="";
	btn.onchange=function (){
		order=this.value;
		getmsg();
	}

getmsg();
function getmsg(pno){
	var arr=location.search.split("=");
	var locat=location.href;
	if(arr[1]){
		var styleId=arr[1].split("&")[0];
	}else{
		var styleId=8;
	}
	var keyword=arr[2] || "";
	var pno=pno ||1;

	ajax({
		type:"get",
		url:"data/routes/products/product.php",
		data:"styleId="+styleId+"&pno="+pno+"&keyword="+keyword+"&order="+order,
		dataType:"json"
	}).then(data=>{
		var html="";
		for(var i=0;i<data.length-1;i++){	
			html+=`<div>
					<a href="prodetails.html?id=${data[i].pid}&locat=${locat}">
						<img src="${data[i].midimg}" alt="" />
						<p class="productPrice">
							<a href="prodetails.html?id=${data[i].pid}">
								￥${data[i].price}
							</a>
						</p>
						<p class="productNumber">
							<a href="prodetails.html?id=${data[i].pid}">
								${data[i].number}
							</a>
						</p>
						<p class="productStyle">${data[i].style}</p>
					</a>
					<a href="javascript:addcart1(${data[i].pid})">加入<br>心愿单</a>
					<a href="">表款比较</a>
				</div>`;
		}
		document.querySelector("[data-product='pro']").innerHTML=html;
		var msg=data[data.length-1],
			pro="";
		pro+=`<a ${msg.pno==1?"":"href='javascript:getmsg(1)'"} data-opa="pre">首页</a>
			<a ${msg.pno==1 || "href='javascript:getmsg("+msg.prepage+")'"} data-opa="pre">上一页</a>`;
		for(var i=1;i<=msg.totalpage;i++){
			pro+=`<a href="javascript:getmsg(${i})">${i}</a>`;
		}
		pro+=`<a ${msg.pno==msg.totalpage || "href='javascript:getmsg("+msg.nextpage+")'"} data-opa="next">下一页</a>
			<a ${msg.pno==msg.totalpage || "href='javascript:getmsg("+msg.totalpage+")'"} data-opa="next">尾页</a>`;
		document.querySelector("[data-pronext='msg']").innerHTML=pro;

		if(msg.pno==1){
			var pres=document.querySelectorAll("[data-opa='pre']");
			for(var pre of pres)
				pre.style.opacity="0.3";
		}
		if(msg.pno==msg.totalpage){
			var pres=document.querySelectorAll("[data-opa='next']");
			for(var pre of pres)
				pre.style.opacity="0.3";
		} 
		/*document.querySelectorAll(".pronext>a")
			[parseInt(msg.pno)+1].className="pnohover";*/  //本页下标特殊显示
		
		//分页小飘框
		var page=document.querySelector(".pronext"), 
			pageborder=document.querySelector(".outi");
			var WIDTH=25.39;	
			pageborder.style.right=-WIDTH*(msg.pno-1)+msg.totalpage*WIDTH+248.05+"px";
	
		//console.log("刷新一次");
	});
}



	
	