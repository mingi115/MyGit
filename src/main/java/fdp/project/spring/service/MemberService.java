package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.Member;

public interface MemberService {
	//회원 상세조회
	public Member getMemberItem(Member input) throws Exception;
	//회원 목록조회
	public List<Member> getMemberList(Member input) throws Exception;
	//회원 추가
	public int addMember(Member input) throws Exception;
	//회원정보 수정
	public int editMember(Member input) throws Exception;
	//회원 삭제
	public int deleteMember(Member input) throws Exception;
	//회원 수 조회
	public int getMemberCount(Member input) throws Exception;
	//한명조회
	public Member getMemberOne(Member input) throws Exception;
}
