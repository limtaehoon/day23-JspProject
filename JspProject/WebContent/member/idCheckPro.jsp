<%@page import="com.member.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
   MemberDAOImpl dao = MemberDAOImpl.getInstance();
   String userid = request.getParameter("userid");
    String flag = dao.idCheck(userid);
    out.println(flag);
%>