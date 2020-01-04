
function findpass() {
	var user = document.form1.username.value;
	var pass = document.form1.email.value;

	if (user == "") {
		alert("用户名不能为空!");
		return;
	} else {
		reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-z]{10,10}$/;
		if (!reg.test(document.form1.username.value)) {
			alert("非法的用户名");
			return false;
		}
	}
	if (pass == "") {
		alert("邮箱不能为空!");
		return;
	} else {
		reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!reg.test(document.form1.email.value)) {
			alert("非法的电子邮件");
			return false;
		} else {
			alert("密码发送成功");
			document.form1.action = "login.jsp";
			document.form1.submit();
		}
	}
}

function typeChange(x) {

	var t1 = document.getElementById("div1");
	var t2 = document.getElementById("div2");
	var t3 = document.getElementById("div3");
	var t4 = document.getElementById("div4");
	var t5 = document.getElementById("div5");
	var t6 = document.getElementById("div6");

	var frag = true;
	if (x == "1") {
		t1.style.display = "block";
		t2.style.display = "none";
		t3.style.display = "none";
		t4.style.display = "block";
		t5.style.display = "none";
		t6.style.display = "none";
	} else if (x == "2") {
		t1.style.display = "none";
		t2.style.display = "block";
		t3.style.display = "none";
		t4.style.display = "none";
		t5.style.display = "block";
		t6.style.display = "none";
	} else if (x == "3") {
		t1.style = "display:none";
		t2.style = "display:none";
		t3.style = "display:block";
		t4.style.display = "none";
		t5.style.display = "none";
		t6.style.display = "block";
	}

}

$("#checkall").click(function() {
	$("input[type='checkbox']").prop("checked", this.checked);
});

$("input[type='checkbox']").click(function() {
	var $checkbox = $("input[type='checkbox']");
	$("#checkall").prop("checked", $checkbox.length == $checkbox.filter(":checked").length ? true : false);
});

function check(){
	alert("请仔细核对您填写的信息！");
}

