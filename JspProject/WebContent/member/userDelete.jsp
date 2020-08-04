<%@page import="com.member.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String) session.getAttribute("userid");
  MemberDAOImpl dao = MemberDAOImpl.getInstance();
  dao.memberDel(userid);
  session.invalidate();
  response.sendRedirect("loginForm.jsp");
	
%>