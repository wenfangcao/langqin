function getshopcart2(){
  return new Promise(function(callback){	
	var uid=getCookie("uid");
	if(uid)
	ajax({
		type:"get",
		url:"data/routes/cart/getproduct.php",
		data:"uid="+uid,
		dataType:"json"
	}).then(data=>{
		if(data.length!=0){
			var needcount1=document.querySelector("[data-shop='count2']"),
				needcount2=document.querySelector("[data-shop='count3']"),
				totalprice = 0,
				totalcount = 0,
				html = "",
				insertnode=document.querySelector("[data-shop='youwin']"),
				righttotalprice=document.querySelector("[data-shop='totalprice']"),
				righttotalprice2=document.querySelector("[data-shop='totalprice2']");
			for(var p of data){
				totalprice += (p.count-0)*(p.price-0);
				totalcount += p.count-0;
				html+=`<div class="shopcartproduct">
					<img src="${p.minimg}" alt="">
					<span>${p.style}</span>
					<span class="cartnubmer">${p.number}</span>
					<ul>
						<li>
							<span class="line1">数量</span><br>
							<select name="" data-shop="select" onchange="setshoppingcart(this.dataset.pid,this.value)" data-pid="${p.pid}">	
								<option value="1" ${p.count==1?"selected":""}>1</option>
								<option value="2" ${p.count==2?"selected":""}>2</option>
								<option value="3" ${p.count==3?"selected":""}>3</option>
								<option value="4" ${p.count==4?"selected":""}>4</option>
								<option value="5" ${p.count==5?"selected":""}>5</option>
								<option value="6" ${p.count==6?"selected":""}>6</option>
								<option value="7" ${p.count==7?"selected":""}>7</option>
								<option value="8" ${p.count==8?"selected":""}>8</option>
								<option value="9" ${p.count==9?"selected":""}>9</option>
								<option value="10" ${p.count==10?"selected":""}>10</option>
							</select>
						</li>
						<li>
							<span class="line1">表带尺寸(厘米)</span><br>
							<span>13</span>
						</li>
						<li>
							<span class="line1">价格</span><br>
							<span>￥${priceToThousands(p.price)}</span>
						</li>
						<li>
							<span class="line1">小计</span><br>
							<b>￥${priceToThousands((p.price-0)*(p.count-0))}</b>
						</li>
					</ul>

					<span class="removespan" data-shop="closediv" data-target="${p.pid}"><b>×</b>移除</span>
				</div>`;
				//console.log(p.price);
			}
			needcount1.innerHTML=`( ${totalcount} )`;
			righttotalprice.innerHTML="￥"+priceToThousands(totalprice);
			righttotalprice2.innerHTML="￥"+priceToThousands(totalprice);
			needcount2.innerHTML=`${totalcount} 腕表`;
			insertnode.innerHTML=html;
			var cs=document.querySelectorAll("[data-shop='closediv']");
			for(var c of cs){
				c.onclick=(e)=>{
					setshoppingcart(e.target.dataset.target,0).then(()=>{location.reload(true);});
				}
			}
			
		}
	})
  });
  callback();
}
getshopcart2();





//head 改变，触发页面改变，存在BUG...待续...
/*setTimeout(()=>{	
	substract=document.querySelector("[data-shop='subtract']"),
	add=document.querySelector("[data-shop='add']");
	//console.log(substract);
	substract.addEventListener("click",getshopcart2);
	add.addEventListener("click",getshopcart2);
	
},500);*/
