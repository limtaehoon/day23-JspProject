<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="member.js"></script>

</head>
<body>

<h1>회원가입</h1>

"표시항목은 필수 입력 항목입니다.
<form action="memberpro.jsp" id="frm" method="post">
<input type="hidden" id="uid" name="uid">
<table>
<tr>	
	<td>이름</td>
	<td><input type="text" name="name" id="name">"</td>
</tr>
<tr>
	<td>아이디</td>
	<td><input type="text" name="id" id="id" readonly="readonly"></td><td><input type="button" value="중복체크" id="idBtn"></td>
</tr>
	<td>암 호</td>
	<td><input type="password" name="pwd" id="pwd">"</td>
</tr>
	<td>암호확인</td>
	<td><input type="password" name="pwd_check" id="pwd_check">"</td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="email" id="email">"</td>
</tr>
<tr>
	<td>전화번호</td>
	<td><input type="tel" name="phone" id="phone">"</td>
</tr>
<tr>
	<td>등급</td>
	<td><input type="radio" name="admin" value="0"checked="checked">일반회원
	<input type="radio" name="admin" value="1">관리자</td>	
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" id="send" value="확인">
		<input type="reset" value="취소 ">	
	</td>
</tr>
</table>
</form>  
</body>
</html>