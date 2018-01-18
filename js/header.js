(()=>{
	ajax({
		type:"get",
		url:"header.html"
	}).then(data=>{
		document.getElementById("header").innerHTML=data;
		window.onload=begin();
		search();
		globalserve();
		listfun();
		seesaw();
		setTimeout(getshoppingcart,100);
	});
})();

(()=>{
	ajax({
		type:"get",
		url:"footer.html"
	}).then(data=>{
		document.getElementById("footer").innerHTML=data;
		});
})();
function WindowResize(){//窗口自适应
	var bodyDiv=document.querySelector("body>div"),
		bodyWidth=document.body.clientWidth,
		header=document.querySelector("header");
	if(bodyWidth>1600){
		bodyDiv.style.width="1600px";
		header.style.width="1600px";
	}
	else{
		bodyDiv.style.width="100%";
		header.style.width="100%";
	}
			
}
WindowResize();
window.onresize=WindowResize;

(()=>{//header自动缩进
	window.onscroll=()=>{
		scrollTop=document.documentElement.scrollTop 
				||document.body.scrollTop;
		//console.log(scrollTop);
		if(scrollTop>300){	
			document.onmousewheel=function(e){
				var header=document.getElementById("header");
				e=e || window.event;
				var wheelDelta=e.wheelDelta;
				if(wheelDelta>0)
					header.style.marginTop="0";
				else{
					header.style.marginTop="-100%";
					document.querySelector("[class='login']").style.height="0";
					document.querySelector("[ data-div='serve']").style.height="0px";
					document.querySelector("[ data-div='servebtn']").style.backgroundColor="#ABB0B3";
				}
			}
		}else
			header.style.marginTop="0";
	}
})()

function begin(){
	var login=document.querySelector("[data-login='login']"),
		logindiv=document.querySelector(".login"),
		outdiv=document.querySelector(".login>b");
	//console.log(login);
	login.onclick=e=>{
		e.preventDefault();
		//console.log("0");
		console.log("1");
		if(logindiv.style.height!="600px"){
			logindiv.style.height="600px";
			logindiv.style.opacity="1";
			//console.log("1");
		}else if(logindiv.style.height=="600px"){
			logindiv.style.height="";
			logindiv.style.opacity="0";
			//console.log("2");
		}
	}
	var timer="";
	logindiv.onmouseleave=()=>{
		timer=setTimeout(()=>{
			logindiv.style.height="";
			//console.log("设置定时器")
		},3000);
		
	}
	logindiv.onmouseenter=()=>{
		if(timer!=""){
			clearInterval(timer);
			timer=null;
			//console.log("清除定时器");
		}
	}
	outdiv.onclick=()=>{
		
		logindiv.style.height="";
		logindiv.style.opacity="0";
	}

	//header提示DIV

	var compare=document.querySelector("[data-target='comparediv']"),
		shop=document.querySelector("[data-target='shopdiv']"),
		loginlist=document.querySelector("[data-target='loginlistdiv']");
	
	function showhidediv(obj){
		obj.onmouseenter=e=>{
			var tar=e.target,
				id=tar.dataset.target,
				div=document.getElementById(id);
			div.style.display="block";
		}
		obj.onmouseleave=e=>{
			var tar=e.target,
				id=tar.dataset.target,
				div=document.getElementById(id);
				div.style.display="none";
		}
	}
	showhidediv(compare);
	showhidediv(shop);
	showhidediv(loginlist);

	var bun=document.querySelector(".loginmiddiv>button");
	bun.onclick=funlogin;
	onkeydown=e=>{
			if(e.keyCode==13 && logindiv.style.height=="600px")
			funlogin();
		}
	function funlogin(){
		var name=document.querySelector("[placeholder='邮箱/手机号码']").value,
			pwd=document.querySelector("[placeholder='密码']").value,
			emailreg=/^[0-9a-zA-Z]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-_.])+[.a-zA-Z0-9]{2,7}$/,
			phonereg=/^(\+86|0086)?\s*1[3578]\d{9}$/,
			preg=/^[\w.@*-]{6,18}$/,//[a-zA-Z]字母开头//i 
			spanname=document.querySelector("[data-span='name']"),//提示账号不能为空
			spanpwd=document.querySelector("[data-span='pwd']"),
			inputlegal=document.querySelector("[data-input='legal']");
		
		spanname.style.display="none";
		spanpwd.style.display="none";
		inputlegal.style.display="none";
		if(name==""){
			spanname.style.display="block";
			setTimeout(()=>{spanname.style.display="none";},5000);
		}else if(pwd==""){
			spanpwd.style.display="block";
			setTimeout(()=>{spanpwd.style.display="none";},5000);
		}else
			if(emailreg.test(name)&& preg.test(pwd)){
				var email=name,
					upwd=pwd,
					datamsg=`email=${email}&upwd=${upwd}`;
				funajax(datamsg);
			}else if(phonereg.test(name) && preg.test(pwd)){
				var phone=name,
					upwd=pwd;
				datamsg=`phone=${phone}&upwd=${upwd}`;
				funajax(datamsg);
			}else{
				inputlegal.style.display="block";
				setTimeout(()=>{
					inputlegal.style.display="none";
				},5000);
			}
	

		function funajax(datamsg){
			ajax({
				type:"post",
				url:"data/routes/users/login.php",
				data:datamsg,
				dataType:"json"
			}).then(data=>{
				if(data.ok=="1"){
					location.reload();
				}else{
					inputlegal.style.display="block";
					setTimeout(()=>{
						inputlegal.style.display="none";
					},5000);//提示错误信息
				}
			});
		}
	};

	function islogin(){
		
		//if(uid==null) uid="";
		//console.log(uid);
		ajax({
			type:"post",
			url:"data/routes/users/islogin.php",
		//	data:"uid="+uid,
			dataType:"json"
		}).then(data=>{
			//console.log(data.uname);
			var yeslogin=document.querySelector("[data-target='loginlistdiv']"),
				nologin=document.querySelector("[data-login='login']");
				//console.log(yeslogin);
				//console.log(data.ok);
			if(data.ok==1){
				nologin.style.display="none";
				yeslogin.style.display="inline-block";
				document.querySelector(".loginyes>span").innerHTML=data.uname;
				setCookie("uid",data.uid);
				setCookie("uname",data.uname);
			}else{
				var uid=getCookie("uid");
				var uname=getCookie("uname");
				if(uid && uname){
					nologin.style.display="none";
					yeslogin.style.display="inline-block";
					document.querySelector(".loginyes>span").innerHTML=uname;
					//console.log(uid+uanme);
				}else{
					nologin.style.display="inline-block";
					yeslogin.style.display="none";
					//console.log("..");
				}
			}
		});
	}
	islogin();
	
	
	function logout(){
		var out=document.querySelector("[data-fun='out']");
		out.onclick=()=>{
			ajax({
				type:"get",
				url:"data/routes/users/logout.php"
			}).then(()=>{
				alert("注销成功");
				console.log(getCookie("uid"));
				delCookie("uname");
				delCookie("uid");
				//location.reload(true);
				islogin();	
			});
		}
	}
	logout();

	function registerHref(){//进入注册页时，传递前页地址
		document.querySelector("[data-href='phone']").onclick=()=>{
			location=`register.html?locatback=${location.href}`;
		}
		document.querySelector("[data-href='email']").onclick=()=>{
			location=`registeremail.html?locatback=${location.href}`;
		}
	}
	registerHref();

};

function search(){
	var searchdiv=document.querySelector(".searchDiv"),
		headersearch=document.querySelector("[data-target='search']"),
		close=document.querySelector(".searchDiv>b"),
		searchbtn=document.querySelector(".searchDiv .searchbtn"),
		searchinglist=document.querySelector(".searchDiv .searchinglist"),
		searchedlist=document.querySelector(".searchDiv .searchedlist"),
		input=document.querySelector(".searchDiv>div>p>input");
	headersearch.onclick=()=>{
		searchdiv.style.height="4200px";
		document.body.style.background="#003150";
		var cookiepid=getCookie("pid");
		var html = "";
			html+=`<li>${input.value}</li>`;
		if(cookiepid){
			var arr=cookiepid.split(",");
			while(arr.length>4){
				arr.pop();
			}
			for(var p of arr){
				html+=`<li data-target="inputdiv">${p}</li>`;
			}
			var searchedlist=document.querySelector("[data-seach='edlist']");
			searchedlist.innerHTML+=html;
			var seaspan=document.querySelector("[data-seach='interesting']");
			seaspan.style.display="block";
			var inputdivs=document.querySelectorAll("[data-target='inputdiv']");
			for(var inputdiv of inputdivs){
				inputdiv.onclick=(e)=>{
					input.value=e.target.innerHTML;	
					seard.cansearchlocat=true;
				}
			}
		}
	}
	close.onclick=()=>{
		searchdiv.style.height="0";
		document.body.style.background="#002744";
	}
var seard={
	cansearchlocat:false,
	seardown:function(){
		if(this.cansearchlocat==true)
		setTimeout(()=>{
			var cookiepid=getCookie("pid");
			if(cookiepid){
				var arr=cookiepid.split(",");
				if(input.value)
				arr.unshift(input.value);
				while(arr.length>5){
					arr.pop();
				}
				var cookiepid=arr.join(",");
				setCookie("pid",cookiepid);
			}else{
				setCookie("pid",input.value);		
			}
			location.href="product.html?styleId=8&keyword="+input.value;
		},100);
	}
}
		
		
searchbtn.onclick=()=>{
	if(seard.cansearchlocat==true)
	seard.seardown();
	else searchinglist.innerHTML=`<li>请输入有关商品信息（型号、材质等）</li>`;
};
input.onkeydown=(e)=>{
	//console.log(typeof e.keyCode);
	setTimeout(()=>{//使搜索结果不延后
		searchinglist.innerHTML="";
		if(e.keyCode==13){
			if(seard.cansearchlocat==true){
				searchdiv.style.height="0";
				document.body.style.background="#002744";
				seard.seardown();
			}else{
				searchinglist.innerHTML=`<li>请输入有关商品信息（型号、材质等）</li>`;
			}
		}
		else if(input.value)
		ajax({
			type:"get",
			url:"data/routes/products/searchpromsg.php",
			data:"keyword="+input.value,
			dataType:"json"
		}).then(data=>{
			//console.log(data);
			var html="";
			if(data.length>0){
				for(var p of data){
					html+=`<li><a href="prodetails.html?pid=${p.pid}">${p.number}</a></li>`;
				}
				seard.cansearchlocat=true;
			}else{
				html+=`<li>未查询到相关商品</li>`;
				seard.cansearchlocat=false;
			}
			searchinglist.innerHTML=html;
		});
		
	},100);
};
}

	
function setCookie(name,value){
	var Days = 30*12;
	var expires=new Date();
	expires.setTime(expires.getTime()+Days*24*60*60*1000);
	document.cookie=name+"="+escape(value)+";expires="+expires.toGMTString();
	//console.log(name,value);
}
function getCookie(name){
	var arr=document.cookie.match(
		new RegExp("(^|)"+name+"=([^;]*)(;|$)")
	);
	if(arr!=null){
		return unescape(arr[2]);//escape加密
	}else{
		return null;
	}
}
function delCookie(name){
	var expires=new Date();
	expires.setTime(expires.getTime()-1);
	var thing=getCookie(name);
	if(thing!=null){
		document.cookie=name+"="+thing+";expires="+expires.toGMTString();
	}
}

function globalserve(){//客户服务DIV
	var servediv=document.querySelector("[ data-div='serve']");
	var servebtn=document.querySelector("[ data-div='servebtn']");
	servebtn.onclick=()=>{
		if(servediv.style.height!="76px"){
			servediv.style.height="76px";
			servebtn.style.backgroundColor="#003150";
		}else{
			servediv.style.height="0px";
			servebtn.style.backgroundColor="#ABB0B3";
		}
	}
}
	
	
	//nav下拉菜单
	// 1   2 
	// 800 730 730 
	
function listfun(){
	var as=document.querySelectorAll("[data-a='a']"),
		bs=document.querySelectorAll("[data-a='b']"),
		bottomdiv=document.querySelector(".bottomdiv"),
		fugaiceng=document.querySelector(".fugaiceng"),
		timer="";
	function start(i,k){
		as[i].onmouseenter=()=>{
			setTimeout(()=>{	
				clearInterval(timer);
				timer=null;
				bs[i].style.height=`${k}px`;
				bs[i].style.opacity="1";	
				bottomdiv.style.height=`${k}px`;
				fugaiceng.style.display="block";
			},101);
		}
	}
	start(0,830);
	start(1,700);
	start(2,750);
	start(3,500);
	function leave(m){
		m.onmouseleave=()=>{
			timer=setTimeout(()=>{
				for(var i=0;i<bs.length;i++){
					bs[i].style.height="0";
					bs[i].style.opacity="0";
				}
					bottomdiv.style.height="0";
					fugaiceng.style.display="none";
			},100);
		}
	}
	for(var i=0;i<bs.length;i++){
		leave(as[i]);
		leave(bs[i]);
	}

	function stoplist(i){
		bs[i].onmouseenter=(()=>{
			clearInterval(timer);
			timer=null;
		});
	}
	stoplist(0);
	stoplist(2);
	stoplist(3);
	stoplist(1);
}

function seesaw(){//跷跷板
    var WIDTH=360,HEIGHT=180,r=10,bsPosition=10;
    var  elems=document.querySelectorAll("[data-img='seesaw']");
    for(var i=0;i<elems.length;i++){
        elems[i].onmousemove=e=>{
            var x=e.offsetX,y=e.offsetY,
                rx=(x-WIDTH/2)/(WIDTH/2),
                ry=(y-HEIGHT/2)/(HEIGHT/2),
                x_deg=r*ry,
                y_deg=r*rx,
				tar=e.target;

            tar.style.boxShadow=`${-bsPosition*rx}px ${-bsPosition*ry}px 52px #0f0f0f`;
            if(rx>0 && rx<0)
                tar.style.transform=`rotatex(${x_deg}deg) rotatey(${-y_deg}deg)`;
            else
                tar.style.transform=`rotatex(${-x_deg}deg) rotatey(${y_deg}deg)`;
        } ;
        elems[i].onmouseout=e=>{
		    var tar=e.target;
			tar.style.transform="";
            tar.style.boxShadow="";
        };
    }
}

//购物车功能
function getshoppingcart(){
  return new Promise(function(callback){	
	var uid=getCookie("uid");
	//console.log(uid);
	if(uid){
		
		ajax({
			type:"get",
			url:"data/routes/cart/getproduct.php",
			data:"uid="+uid,
			dataType:"json"
		}).then(data=>{
			var shopdiv=document.querySelector("#shopdiv");
			//console.dir(data);
			if(data.length!=0){
				var totalprice = 0,
					totalcount = 0,
					html = "",
					output = [];	
				for(var p of data){
					totalprice += (p.count-0)*(p.price-0);
					totalcount += p.count-0;
					output[p.pid]=p.count;
				}
					html+=`<div class="shopdiv22"><b data-shop="close">×</b>
						<img src="${data[0].minimg}" alt="">
						<ul>
							<li>浪琴名匠系列<br>${data[0].number}</li>
							<li>查看详情</li>
							<li>￥${data[0].price}</li>
							<li>数量：<b data-shop="subtract">-</b>
								<span>${data[0].count}</span><b class="b2" data-shop="add">+</b></li>
							<li class="more">查看更多...</li>
						</ul>
						<p>总计<span>￥${totalprice}</span>
						</p>
						<button>购物车</button>
						<span>结算支付</span></div>`;
				shopdiv.innerHTML=html;
				document.querySelector("[data-shop='count']").innerHTML=`购物袋${totalcount?" ( "+totalcount+" ) ":""}`;
				
				var closebtn=document.querySelector("[data-shop='close']"),
					substract=document.querySelector("[data-shop='subtract']"),
					add=document.querySelector("[data-shop='add']");
				//console.log(closebtn);
				closebtn.onclick=e=>{
					e.preventDefault();
					shopdiv.style.display="none";
				}
				substract.onclick=(e)=>{
					e.preventDefault();
					setshoppingcart(data[0].pid,data[0].count-1);
					if(data[0].count==1)
						location.reload(true);
				}
				add.onclick=(e)=>{
					e.preventDefault();
					var count=data[0].count-0+1;
					if(count>10) count=10;
					setshoppingcart(data[0].pid,count);
				}
				//console.log("finished");
				shopdiv.style.width="300px";
				callback(output);
			}else{
				shopdiv.innerHTML=`<p>您的购物车为空</p>`;
				shopdiv.style.width="200px";
				callback();
			}
		});
	}else{ 
		shopdiv.innerHTML=`<p>您的购物车为空</p>`;
		shopdiv.style.width="200px";
		callback();
	}
	try{
	   getshopcart2();
	}catch(err){}
  });

 
}

function setshoppingcart(pid,count){
  return new Promise(function(callback){	
	var uid=getCookie("uid");
	if(uid)
	ajax({
		type:"get",
		url:"data/routes/cart/insertcart.php",
		data:`uid=${uid}&pid=${pid}&count=${count}`,
		dataTyep:"json"
	}).then(()=>{
		getshoppingcart();
	});
	else{
		alert("please login");
		location.href="register.html";
	}
	callback();
  });
 
}

function addcart1(pid){
  return new Promise(function(callback){
	var count=1;
	getshoppingcart().then((data)=>{
		if(data && data[pid]!=null){
			count=data[pid]-0+1;
			if(count>10){
				count=10;
			}
		}
		setshoppingcart(pid,count);
	});
	callback();
  })
}

//获取金额千字符
function priceToThousands(num){
	var num = (num || 0).toString(),
		result = '';
	num=num.split(".")[0];
	while(num.length > 3){
		result = ","+num.slice(-3) + result;
		num = num.slice(0,num.length-3);
	}
	if(num){
		result = num + result+".00";
		return result;
	}
}