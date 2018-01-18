function phoneRegister(){
	
	function getnode(ip){
		return document.querySelector(ip);
	}
	
	var uname = getnode("[data-target='d1']"),
		sex = getnode("[data-target='d2']"),
		phone = getnode("[data-target='d3']"),	
		checkCode = getnode("[data-target='d4']"),
		phoneCheckCode = getnode("[data-target='d5']"),
		upwd = getnode("[data-target='d6']"),
		rpwd = getnode("[data-target='d7']"),	
		btn = getnode("[data-submit='submit']");
		agree = getnode("[data-target='d8']"),
		box = getnode(".read>i");
		getcode=getnode("[data-target='phonecode']"),
		phpcode=getnode(".yzmdiv>img"),
		canSubmit = true;
		

	function targetspan(node){
		var id = node.dataset.target;
			return document.getElementById(id);
	}
	function inputred(node){
		node.style.borderColor = "red";
	}
	function notnull(input){
		var span=targetspan(input);
			span.innerHTML = "必填项";
			span.style.opacity = "1";
			inputred(input);
			canSubmit = false;
	}
	function notright(input,what){
		inputred(input);
		targetspan(input).innerHTML = `${what}格式不正确`;
		targetspan(input).style.opacity = "1";
		canSubmit = false;
	}
	function pass(input){
		input.style.borderColor="#C7CCD0";
		targetspan(input).style.opacity="0";
	}
	function getscore(min,max){
		return parseInt(Math.random()*(max-min)+min+1);
	}
	//php验证码
	phpcode.onclick=e=>{
		e.target.src="data/routes/users/yzm.php";
	};
		
	

	//检查手机号是否存在
	getcode.onclick = e=>{
		var phoneReg = /^[0-9a-zA-Z]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-_.])+[.a-zA-Z0-9]{2,7}$/;
		if(phone.value == ""){
			notnull(phone);
			return;
		}else pass(phoneCheckCode);
		
		if(!phoneReg.test(phone.value)){
			notright(phone,"邮箱");
			return;
		}else pass(phone);
		
		ajax({
			type:"get",
			url:"data/routes/users/checkphone.php",
			data:"phone="+phone.value,
			dataType:"json"
		}).then(data=>{
			if(data.ok==1){
				inputred(phone);
				targetspan(phone).innerHTML = "该邮箱已存在";
				targetspan(phone).style.opacity = "1";
			}else{
				var tar=e.target;
				var c="";
				for(var i=0;i<6;i++)
					c +=`${getscore(0,9)}`;
				targetspan(tar).value = c;
			}
		});
	
	}

	//同意条款
	agree.onclick =()=>{
		var box=document.querySelector(".read>i");
		if(box.style.background==""){
			box.style.background = "#003150";
		}else{
			box.style.background = "";
		}
	}
	
	


	btn.onclick = ()=>{
		canSubmit = true;
		//姓名验证
		if(uname.value == "") notnull(uname);	
		else{
			var unameReg = /^[A-Za-z.\u4e00-\u9fa5]{2,16}$/;
			if(!unameReg.test(uname.value)) notright(uname,"姓名");
			else pass(uname);
		}

		//性别验证
		if(sex.value == "")notnull(sex)
		else pass(sex);
		
		
		//电话验证
		if(phone.value == "")notnull(phone);
		else{
			var phoneReg = /^[0-9a-zA-Z]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-_.])+[.a-zA-Z0-9]{2,7}$/;
			if(!phoneReg.test(phone.value)) notright(phone,"邮箱");
			else pass(phone);
		}
		//PHP验证码
		
		if(checkCode.value == ""){
			notnull(checkCode);
		}else{
			ajax({
				type:"get",
				url:"data/routes/users/checkphpcode.php",
				data:"captcha="+checkCode.value,
				dataType:"json"
			}).then(data=>{
				if(data.ok=="1") pass(checkCode);
				else{
					notright(checkCode,"验证码内容或");
					phpcode.src="data/routes/users/yzm.php";
				}
			});
		}
	

		//手机验证码 
		if(phoneCheckCode.value == "")notnull(phoneCheckCode);
		else pass(phoneCheckCode);
	

		//密码验证
		if(upwd.value == "")notnull(upwd);
		else{
			var upwdReg = /^[\w.@*-]{6,18}$/; //i
			if(!upwdReg.test(upwd.value)) notright(upwd,"密码");
			else pass(upwd);
		}

		//重复密码验证
		if(rpwd.value == "")notnull(rpwd);
		else{
			if(upwd.value == rpwd.value)pass(rpwd);
			else {
				inputred(rpwd);
				targetspan(rpwd).innerHTML = `二次密码不一致`;
				targetspan(rpwd).style.opacity = "1";
				canSubmit = false;
			}
		}
		
		//console.log(sex.value);
		//政策验证

		if(box.style.background=="")notnull(agree);
		else pass(agree);
		console.log(canSubmit);
		if(canSubmit){
			console.log(`uname=${uname.value}&upwd=${upwd.value}&sex=${sex.value}&email=${phone.value}`);
			ajax({
				type:"post",
				url:"data/routes/users/register.php",
				data:`uname=${uname.value}&upwd=${upwd.value}&sex=${sex.value}&phone=${phone.value}`,
				dataType:"json"
			}).then(data=>{
				//console.log("返回"+data.ok);
				if(data.ok==1){
					alert("注册成功");
					var href=location.search.split("=")[1] || "homePage.html";
					location.href=href;
				}
			});
		}
	  
	}

}
phoneRegister()