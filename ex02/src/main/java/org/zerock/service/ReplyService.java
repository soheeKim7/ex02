package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyService {
	//등록
	int register(ReplyVO vo);
	//수정
	int modify(ReplyVO vo);
	//삭제
	int remove(Long rno);
	//리플 한개 가져오기
	ReplyVO get(Long rno);
	//글에 해당하는 리플목록가져오기 (등록순)
	List<ReplyVO> getList(Long bno);
	//글에 해당하는 리플목록가져오기 (최신순)
	List<ReplyVO> getList2(Long bno);
}
