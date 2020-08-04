package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
//연결
public class MemberDAOImpl implements MemberDAO {

	private static MemberDAOImpl instance 
	                   = new MemberDAOImpl();
	public static MemberDAOImpl  getInstance() {
		return instance;
	}
    private Connection getConnection() throws Exception{
    	Context initCtx = new InitialContext();
		Context envCtx =(Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/member");
		return ds.getConnection();
    }
    
    //로그인체크
    public int loginCheck(String userid, String pwd) {
    	Connection con = null;
    	Statement st = null;
    	ResultSet rs = null;
    	int flag = -1;  // 회원아님
    	
    	try {
			con = getConnection();
			String sql = "select  pwd, admin from member "
					                             + " where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { //id는 맞음
				if(rs.getString("pwd").equals(pwd)) { //비번맞음
				     flag = rs.getInt("admin");
				}else { // 비번틀림
					flag = 2; 
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
    	
    	return flag;
    }

	@Override
	public void memberInsert(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = getConnection();
			String sql="insert into member values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			ps.setInt(6, vo.getAdmin());
			ps.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		
	}
	//전체 보기
	@Override
	public ArrayList<MemberVO> memberList() {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MemberVO> arr = new ArrayList<>();
		
		try {
			con =getConnection();
			String sql = "select * from member";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				MemberVO  vo = new MemberVO();
				vo.setAdmin(rs.getInt("admin"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setPwd(rs.getString("pwd"));
				vo.setUserid(rs.getString("userid"));
				arr.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
	}
	public int memberCount() {
		Connection con =null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select count(*) from member";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return count;
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			con = getConnection();
			String sql = "update member set"
					+ "  name =? ,email=?, phone=?, admin=? where userid =?";
			ps = con.prepareStatement(sql);
			ps.setString(1,vo.getName());
			ps.setString(2,vo.getEmail());
			ps.setString(3,vo.getPhone());
			ps.setInt(4,vo.getAdmin());
			ps.setString(5,vo.getUserid());
			flag=ps.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		return flag;
		
	}

	@Override
	public MemberVO memberView(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		try {
			con = getConnection();
			String sql  ="select * from member where userid='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				member = new MemberVO();
				member.setAdmin(rs.getInt("admin"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setPwd(rs.getString("pwd"));
				member.setUserid(rs.getString("userid"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return member;
	}

	@Override
	public void memberDel(String userid) {
		Connection con = null;
		Statement st = null;
		
		try {
			con =getConnection();
			String sql = "delete from member where userid ='"+userid+"'";
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, null);
		}
	}

	@Override
	public String idCheck(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String flag = "yes"; // 사용가능
		
		try {
			con = getConnection();
			String sql = "select * from member where userid ='"+userid+"'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				flag = "no"; //사용불가능
			}
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return flag;
	}
	//닫기
		private void closeConnection(Connection con, Statement st , ResultSet rs) {
			try {
				if(rs!=null) rs.close();
				if(st!=null)  	st.close();
				if(con!=null ) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		private void closeConnection(Connection con, PreparedStatement ps) {
			try {
				if(ps!=null) ps.close();
				if(con!=null ) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

}
