package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		return mapper.delete(rno);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public List<ReplyVO> getList(Long bno) {
		return mapper.getList(bno);
	}

	@Override
	public List<ReplyVO> getList2(Long bno) {
		return mapper.getList2(bno);
	}

	@Override
	public boolean replypwCheck(ReplyVO vo) {
		
		return mapper.replypwCheck(vo)!=null ? true : false;
	}

	@Override
	public void txTest() {
		//두개의 메퍼를 실행시킴 (하나만 수행이 되면 안됨-트랜잭션처리)
		mapper.tx2(); //무조건성공
		mapper.tx1(); //무조건 실패
		
	}

}
