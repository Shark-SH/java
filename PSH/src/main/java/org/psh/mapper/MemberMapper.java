package org.psh.mapper;

import java.util.List;

import org.psh.domain.MemberDTO;

public interface MemberMapper {
	public void SignupInsert(MemberDTO member);
	
	public List<MemberDTO> findid(MemberDTO member);
	
	public List<MemberDTO> findps(MemberDTO member);
	
	public int idcheck(String userid);
	
	public MemberDTO login(MemberDTO member);
}
