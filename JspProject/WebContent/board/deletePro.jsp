
<%@page import="com.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int num =Integer.parseInt(request.getParameter("num"));//int 이니까 integer
BoardDAO dao = BoardDAO.getInstance();
int flag = dao.boardDelete(num);
response.sendRedirect("list.jsp");


%>