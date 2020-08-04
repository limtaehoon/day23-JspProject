<%@page import="com.board.CommentVO"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.board.BoardVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String msg =request.getParameter("msg");
	int num = Integer.parseInt(request.getParameter("num"));
	String userid = (String)session.getAttribute("userid");
	if(userid==null){//로그인 안됨
		out.println("1");
	}else{//로그인
	
	CommentVO comment = new CommentVO();
	comment.setUserid(userid);
	comment.setMsg(msg);
	comment.setBnum(num);
	BoardDAO dao = BoardDAO.getInstance();
	dao.commentInsert(comment);
	}
%>