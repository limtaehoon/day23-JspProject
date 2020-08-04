<%@page import="com.board.BoardVO"%>
<%@page import="com.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id ="board" class="com.board.BoardVO"/>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDAO dao = BoardDAO.getInstance();
	String ip = request.getRemoteAddr();
	board.setIp(ip);
	dao.boardInsert(board);
	response.sendRedirect("list.jsp");
	
	%>