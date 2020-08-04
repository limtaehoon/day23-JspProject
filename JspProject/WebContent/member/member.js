var exp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
$(document).ready(function(){
	$("#send").click(function(){
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		//아이디
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		//비번, 
		if($("#pwd").val()==""){
			alert("비밀번호 입력하세요");
			$("#pwd").focus();
			return false;
		}
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd_check").focus();
			return false;
		}
		//이메일
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		//전화번호
		if(!$("#phone").val().match(exp)){
			alert("전화번호 입력양식이 아닙니다.");
			$("#phone").focus();
			return false;
		}
		
		$("#frm").submit();
	});  //send
	
	$("#idBtn").click(function(){
		window.open("idCheck.jsp","","width=800 height=500");
	});//idBtn
	
	//아이디 중복확인
	$("#idCheckBtn").click(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("# userid").focus();
			return false;
		}
		$.ajax({
			type:"post",
			url   :"idCheckPro.jsp",
			data :  {"userid" : $("#userid").val()},
			success : function(value){
				if(value.trim()=="yes"){
					alert("사용 가능한 아이디입니다.")
					$(opener.document).find("#userid").val($("#userid").val());
					$(opener.document).find("#uid").val($("#userid").val());
					self.close();
				}else{
					alert("사용 불가능한 아이디입니다.")
				}
			},
			error : function(e){
				alert("error : " + e)
			}
		});
	})//idCheckBtn
	
})  //document

function del(userid,mode){
	if(mode=='관리자'){
		 alert("관리자는 삭제할 수 없습니다.");
		 return;
	}
	$.getJSON("memberDelete.jsp",
			                {"userid" : userid},
			                function(data){
			                	var htmlStr ="";
			                  $.each(data.jarr, function(key, val){
			                	  htmlStr+="<tr>";
			                	  htmlStr+="<td>"+val.name+"</td>";
			                	  htmlStr+="<td>"+val.userid+"</td>";
			                	  htmlStr+="<td>"+val.phone+"</td>";
			                	  htmlStr+="<td>"+val.email+"</td>";
			                	  htmlStr+="<td>"+val.mode+"</td>";
			                	  htmlStr+="<td><a href=javascript:del('"+val.userid+"','"+val.mode+"')> 삭제2</a> </td>";
			                	  htmlStr+="</tr>";
			                  })
			             $("table tbody").html(htmlStr);
			             $("#cntSpan").text(data.cntObj.count);
	                    }  //콜백함수
	 );  //getJSON
}  //del()  함수
















