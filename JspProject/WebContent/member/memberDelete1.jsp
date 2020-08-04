<%@page import="org.json.simple.JSONObject"%>
<%@page import="sun.misc.JavaObjectInputStreamAccess"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
MemberDAOImpl dao = MemberDAOImpl.getInstance();
dao.memberDel(userid);
ArrayList<MemberVO> arr = dao.memberList();
JSONArray jarr = new JSONArray();
for(MemberVO vo : arr){
	String mode = vo.getAdmin()==0?"일반회원":"관리자";
	JSONObject obj = new JSONObject();
	obj.put("name", vo.getName());
	obj.put("userid", vo.getUserid());
	obj.put("email", vo.getEmail());
	obj.put("phone", vo.getPhone());
	obj.put("mode", mode);
	jarr. add(obj);
}
out.println(jarr.toString());
%>






