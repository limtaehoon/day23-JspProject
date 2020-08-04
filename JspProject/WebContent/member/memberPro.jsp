<%@page import="com.member.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.member.MemberVO"/>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDAOImpl dao = MemberDAOImpl.getInstance();
     String uid = request.getParameter("uid");
     member.setUserid(uid);
    dao.memberInsert(member);
    response.sendRedirect("loginForm.jsp");
%>






