<%@page import="com.member.MemberDAOImpl"%>
<%@page import="com.member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="member.js"></script>
<%
    MemberDAOImpl dao = MemberDAOImpl.getInstance();
	ArrayList<MemberVO> arr = dao.memberList();
	String suserid = (String)session.getAttribute("userid");
	int count = dao.memberCount();
%>
</head>
<body>
<div align="right">
	<a href="memberView.jsp"><%=suserid %></a> 관리자님 반갑습니다.
	
	<a href="logout.jsp">로그아웃</a><br>
	<a href="../board/list.jsp">게시글쓰기</a><br>
	전체회원수:<span id="cntSpan"><%=count %></span>
</div>
<br><br>
<table class="table table-striped">
	<thead>
	<tr>
			<th  scope="col">이름</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>구분</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%
	  for( MemberVO  vo  :  arr){
		  String mode = vo.getAdmin()==0?"일반회원":"관리자";
  %>
  <tr>
  	<td><%=vo.getName() %></td>
  	<td><%=vo.getUserid() %></td>
  	<td><%=vo.getPhone() %></td>
  	<td><%=vo.getEmail() %></td>
  	<td><%=mode%></td>
  	<td><a href="javascript:del('<%=vo.getUserid() %> ','<%=mode%>')">삭제</a></td>
  </tr>		  
<%		  
	  }
	
	%>
	
	</tbody>
</table>

</body>
</html>