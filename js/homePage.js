
var banner={
	n:0,
	wantlisten:true,
	ban:function(){
		var video=document.querySelector("[data-video='ban']"),
			imgdivs=document.querySelectorAll("#banner>div>div");
		var m=this.n-1;if(m<0)m=4;
		var m1=m-1;if(m1<0)m1=4;
		var p=this.n+1;if(p>4)p=0;
		var p1=p+1;if(p1>4)p1=0;
		imgdivs[m].className="banpre";
		imgdivs[m1].className="banpre1";
		imgdivs[this.n].className="banup";
		imgdivs[p].className="bannext";
		imgdivs[p1].className="bannext1";
		
		if(banner.n==0){
			stopban();
			video.load();
			video.play();
			//timer=setTimeout(startban,94000);
			timer=setInterval(()=>{
				//console.log("视频结束后启动定时器");
				if(video.ended){
					stopban();
					banner.n++;
					banner.ban();
					startban();
				}
			},1000);
		}else{
			video.pause();
		}	
	}	
}
	var canclick=true;
	//console.log(banner.n);
	//var bandiv=new banner();
	var zyb=document.querySelectorAll("#banner>i");
	
	for(var zy of zyb){	
			zy.onclick=(function(){
				if(this==zyb[0] && canclick){
					banner.n>=4?banner.n=0:banner.n++;
					banner.ban();
					canclick=false;
					zyb[0].style.display="none";
					zyb[1].style.display="none";
					setTimeout(()=>{
						canclick=true;
						zyb[0].style.display="";
						zyb[1].style.display="";
						},1300);
				}
				else if(this==zyb[1]&& canclick){
					banner.n<1?banner.n=4:banner.n--;
					banner.ban();
					canclick=false;
					zyb[0].style.display="none";
					zyb[1].style.display="none";
					setTimeout(()=>{
						canclick=true;
						zyb[0].style.display="";
						zyb[1].style.display="";
						},1300);
				}			
			});
		
	}
	var timer="";
	banner.ban();
	function startban(){
		//console.log("是否存在定时器"+timer);
		stopban();
		timer=setInterval(()=>{
			//console.log("开启定时器"+timer);
			banner.n>=4?banner.n=0:banner.n++;
			banner.ban();
		},10000);
	}
	function stopban(){
		if(timer){	
			//console.log("准备结束定时器"+timer);
			clearInterval(timer);
			timer=null;
			//console.log("结束定时器" +timer);
		}
	}
	var divban=document.querySelector("#banner");
	
	divban.onmouseenter=()=>{
		if(banner.n!=0)
		stopban();
	}
	divban.onmouseleave=()=>{
		if(banner.n!=0)
		startban();
	}
	
	//video button
	(()=>{
		var sound=document.querySelector(".videoControls>img"),
			nosound=document.querySelector(".videoControls>span"),
			video=document.querySelector("[data-video='ban']"),
			videoControls=document.querySelector(".videoControls"),
			large=document.querySelector(".videoControls>p");
		//console.log(sound);
		videoControls.onclick=(e)=>{
			var tar=e.target;
			if(tar==sound || tar==nosound){
				if(nosound.style.display==""){	
					nosound.style.display="none";
					video.muted=false;
					banner.wantlisten=true;
				}else{
					nosound.style.display="";
					video.muted=true;
					banner.wantlisten=false;
				}
			}
			
			if(tar==large){
				//console.log(large);
				//video.requestFullscreen();
				//video.mozRequestFullScreen();
				//video.oRequestFullscreen();
				video.webkitRequestFullscreen();
			}
		}


		//视频减速播放
		video.onmouseenter=()=>{
			video.playbackRate="0.5";
		}
		video.onmouseleave=()=>{
			video.playbackRate="1";
		}
	})()

//小banner模块
function minbanner(){
	var b=document.getElementById("personDiv");
	var c=document.querySelector("#spokesPerson>div>a>div>.show");
	c.className="";
	if(b.style.marginLeft=="0%"){
		b.style.marginLeft="-100%";
		c.nextElementSibling.className="show";
	}else if(b.style.marginLeft=="-100%"){
		b.style.marginLeft="-200%";
		c.nextElementSibling.className="show";
	}else{
		b.style.marginLeft="0%";
		c.parentElement.firstElementChild.className="show"; 
	}
}
minbanner();
setInterval(minbanner,5000);

//header 上移隐藏  没加IE，用JQUERY简化代码

	window.onmousewheel=function(e){
		scrollTop=document.documentElement.scrollTop 
		||document.body.scrollTop;
		var banner=document.querySelector("#banner>div"),
			minbannerimgs=document.querySelectorAll("#personDiv");
		var e=e || window.event;
		//e.wheelDelta=800;
		var wheelDelta=e.wheelDelta;
		//console.log(wheelDelta);
		//console.log(scrollTop);
		
		if(scrollTop<900 && banner.n!=0)
			banner.style.marginTop=`${scrollTop/5}px`;
		
		else if(scrollTop<2600){
			for(var img of minbannerimgs)
				img.style.marginTop=`${(scrollTop-2600)/5}px`;
		}
		
		var video=document.querySelector("[data-video='ban']");	
		if(scrollTop>1100 && video.muted==false) video.muted=true;
		if(scrollTop<1100 && video.muted==true && banner.wantlisten == true) video.muted=false;
		
	}


setTimeout(()=>{
	function topsale(){
		ajax({
			type:"get",
			url:"data/routes/products/topsale.php",
			dataType:"json"
		}).then(data=>{
			var html="";
			for(var p of data){
				
				html+=`<div>
							<a href="prodetails.html?id=${p.pid}&locat=${location.href}"><img src="${p.midimg}" alt="" /></a>
							<p class="knowDetails"><a href="prodetails.html?id=${p.pid}">了解详情</a></p>
							<p class="topSaleNumber"><a href="prodetails.html?id=${p.pid}">${p.number}</a></p>
							<p class="topSaleStyle">${p.style}</p>
						</div>`;
			}
			document.getElementById("topSaleFlex").innerHTML=html;
		});
	}
	topsale()
},100);