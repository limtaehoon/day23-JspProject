package com.member;

import java.util.ArrayList;

public interface MemberDAO {
	//추가
	public void memberInsert(MemberVO vo);
	//전체보기
	public ArrayList<MemberVO> memberList();
	//수정
	public int memberUpdate(MemberVO vo);
	//상세보기
	public MemberVO memberView(String userid);
	//삭제
	public void memberDel(String userid);
	//아이디체크(중복체크)
	public String idCheck(String userid);

}






