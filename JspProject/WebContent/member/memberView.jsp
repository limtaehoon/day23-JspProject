<%@page import="com.member.MemberVO"%>
<%@page import="com.member.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
<%
	String userid = (String)session.getAttribute("userid");
  MemberDAOImpl dao = MemberDAOImpl.getInstance();
  MemberVO member= dao.memberView(userid);
%>
</head>
<body>
<%=userid %> 님 반갑습니다.  /  <a href="logout.jsp">로그아웃</a><br><br>
<h2>
회원정보변경   /  <a href="userDelete.jsp">회원탈퇴</a>
</h2>

<form action="updatePro.jsp" method="post">
<input type="hidden" name="userid"  value="<%=userid%>">

<table>
<tr>
	<td>이름</td>
	<td><input type="text" id="name"  name="name"
	                    value="<%= member.getName()%>"></td>

</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" id="pwd"  name="pwd" disabled="disabled"
	                    value="<%= member.getPwd()%>"></td>

</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" id="email"  name="email"
	                    value="<%= member.getEmail()%>"></td>

</tr>	
<tr>
	<td> 전화번호</td>
	<td><input type="text" id="phone"  name="phone"
	                    value="<%= member.getPhone()%>"></td>

</tr>
<tr>
	<td> 등급</td>
	<td>
   <input type="radio"  name="admin" value="0"> 일반회원 
	<input type="radio" name="admin" 	value="1"> 관리자 </td>
	<script>
	if(<%=member.getAdmin()%>==0){
		$("input:radio[value='0']").prop("checked", true);
	}else{
		$("input:radio[value='1']").prop("checked", true);
	}
	</script>
</tr>
<tr>
		<td colspan="2" align="center">
		<input type="submit" id ="updateBtn" value="수정">
		 <input type="reset" value="취소">
				</td>
			</tr>
</table>




</form>
</body>
</html>