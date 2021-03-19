<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<form action="/cafe/user?cmd=join" method="post" onsubmit="return valid()">
	  <div class="form-group">
	    <div class="d-flex justify-content-start">
	      <label for="username">아이디 : </label>
	      <button type="button" class="btn btn-info" onClick="idCheck()">중복검사</button>
	    </div>
	    <input type="text" class="form-control" placeholder="Enter ID" id="username" name="username" required>
	  </div>
	  <div class="form-group">
	    <label for="password">비밀번호 : </label>
	    <input type="password" class="form-control" placeholder="Enter Password" id="password" name="password" required>
	  </div>
	  <div class="form-group">
	    <label for="email">이메일 : </label>
	    <input type="email" class="form-control" placeholder="Enter Email" id="email" name="email" required>
	  </div>
	  <div class="form-group">
	    <div class="d-flex justify-content-start">
	      <label for="address">주소 : </label>
	      <button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
	    </div>
	    <input type="text" class="form-control" placeholder="Enter Address" id="address" name="address" required readonly>
	  </div>
	  <button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>

<script>
var isChecking = false;

function valid() {
	if (isChecking == false) {
		alert("아이디 중복체크를 해주세요.");
	}
	return isChecking;
}

function idCheck() {
	var username = $("#username").val();
	
	$.ajax({
		type: "post",
		url: "/cafe/user?cmd=idCheck",
		data: username,
		contentType: "text/plain; charset=utf-8",
		dataType: "text"
	}).done(function(data) {
		if (data === "ok") {
			isChecking = false;
			alert("유저네임이 중복되었습니다.")
		} else {
			isChecking = true;
			alert("해당 유저네임을 사용할 수 있습니다.")
		}
	});
}

function goPopup(){
	var pop = window.open("/cafe/user/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
	var addressEl = document.querySelector("#address");
	addressEl.value = roadFullAddr;
}
</script>

</body>
</html>