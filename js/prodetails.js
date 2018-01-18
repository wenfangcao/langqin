(()=>{
	var arr=location.search.split("=");
	//console.log(arr);
	var pid=arr[1].split("&")[0];
	var locat=location.search.split("locat=")[1];
	ajax({
		type:"get",
		url:"data/routes/products/prodetails.php",
		data:"pid="+pid,
		dataType:"json"
	}).then(data=>{
		var snames=document.querySelectorAll("[data-sname='sname']"),
			details=document.querySelector("[data-product='details']"),
			nums=document.querySelectorAll("[ data-number='num']"),
			returnbtn=document.querySelector("[data-target='return']");
		//console.log(nums);
		returnbtn.href=locat;
		//console.log(returnbtn.href);
		for(var num of nums)
			num.innerHTML=data.number;
		for(var sname of snames)
			sname.innerHTML=data.sname;
		var html=`<div class="fl" data-imgdiv="img">
				<img src="${data.minimg}" alt="" data-largeimg="${data.maximg}"
				id="minimghover">
				<div class="largeimg" style="background:url('${data.maximg}')"></div>
			</div>
			<div class="fr mainright">
				<div class="fl">
					<p>￥${data.price}</p>
					<div>
						<a >表带尺寸（厘米）</a>
						<a >i</a>
						<span>如何测量您的手腕尺寸</span>
					</div>	
					<a data-target="minimghover">加入购物车</a>
					<a data-tar="buy">现在购买</a>
					<p class="twop">
						<img src="img/product_img/1.png" alt="">
						我们可以通过电话帮您找到想要的商品，请拨打 400-821-3270
						<a >	
							<img src="img/product_img/2.png" alt="">
							<span>在线聊天</span>
						</a>
					</p>
					<div class="middiv">
						<a ></a>
						<a ></a>
						<a ></a>
						<br>
						<span>分享</span>
						<span>加入心愿单</span>&nbsp; &nbsp;
						<span>表款比较</span>
					</div>
					<div class="detailsdiv">
						<p>
							<span data-ul="#ul1">表壳</span>
							<span data-ul="#ul2">表盘和指针</span>
							<span data-ul="#ul3">机芯和功能</span>
							<span data-ul="#ul4">表链</span>
							<b></b>
						</p>
						<ul class="show" id="ul1">
							<li><span>表壳: </span>${data.grass}</li>
							<li><span>尺寸: </span>Ø ${data.size}</li>
							<li><span>防水性能: </span>${data.water}</li>
							<li><span>材质: </span>${data.quantityone}</li>
							<li><span>形状: </span>${data.form}</li>
							<li><span>钻石: </span>${data.diamond}</li>
							<li><span>克拉: </span>${data.weight}</li>
						</ul>
						<ul id="ul2">
							<li><span>指针: </span>${data.finger}</li>
							<li><span>颜色: </span>${data.colorone}</li>
							<li><span>运行时间: </span>${data.time}</li>
						</ul>
						<ul id="ul3">
							<li><span>机芯: </span>${data.moduleone}</li>
							<li><span>机芯: </span>${data.moduletwo}</li>
							<li><span>计时码表机芯: </span>${data.modulethree}</li>
							<li><span>机芯类型: </span>${data.moduletype}</li>
							<li><span>功能: </span>${data.function}</li>
						</ul>
						<ul id="ul4">
							<li><span>材质: </span>${data.quantitytwo}</li>
							<li><span>表扣: </span>${data.buckle}</li>
							<li><span>颜色: </span>${data.colortwo}</li>
						</ul>
					</div>
					
				</div>
			</div>`;
		details.innerHTML+=html;

		var btn=document.querySelector("[data-target='minimghover']"),
			buy=document.querySelector("[data-tar='buy']"),
			img=document.getElementById("minimghover"),
			canbtn=true;
			
		btn.onclick=()=>{
			if(canbtn){
				document.getElementById("header").style.marginTop="0";
				img.className="imgg";
				canbtn=false;
				setTimeout(()=>{
					img.className="";
					canbtn=true;
					addcart1(pid);
				},1500);
			}
		}
		buy.onclick=()=>{
			addcart1(pid).then(setTimeout(()=>{location.href="shoppingcart.html";},50));	
		}
	});
	
})();

function delay(){//放大镜
		
		var imgdiv=document.querySelector("[data-imgdiv='img']"),
			largeimg=document.getElementsByClassName("largeimg")[0];
		//console.log(largeimg);
		imgdiv.onmouseover=function(e){
			largeimg.style.display="block";
			var WIDTH=250,imgleft=0,imgtop=0;
			window.onmousemove=function(e){
				imgleft=e.offsetX;
				//console.log(imgleft);
				imgtop=e.offsetY;
				largeimg.style.backgroundPosition=`${-imgleft*(32/7)+WIDTH}px ${-imgtop*(329/72)+WIDTH}px`;
			}
		};
		imgdiv.onmouseout=function(){
			largeimg.style.display="none";
		}
	

	
		var datas=document.querySelectorAll(".detailsdiv>p>span"), 
			uline=document.querySelector(".detailsdiv>P>b"),
			detailsdiv=document.querySelector(".detailsdiv");
		for(var data of datas){
			data.onclick=e=>{
				var tar=e.target,
					id=tar.dataset.ul,
					ul=document.querySelector(id);
				if(ul.className!="show"){
					document.querySelector("ul.show").className="";
					ul.className="show";
				}
				if(tar==datas[0]){
					uline.style.width="30px";
					uline.style.left="";
					detailsdiv.style.height="320px";
				}else if(tar==datas[1]){
					uline.style.width="75px";
					uline.style.left="45px";
					detailsdiv.style.height="180px";
				}else if(tar==datas[2]){
					uline.style.width="75px";
					uline.style.left="140px";
					detailsdiv.style.height="250px";
				}else{
					uline.style.width="30px";
					uline.style.left="230px";
					detailsdiv.style.height="180px";
				}
			}
		}
};
setTimeout(delay,500);
