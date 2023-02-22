package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	@Select("select * from tbl_board")
	List<BoardVO> getList();  //게시물 목록 가져오기
	//인터페이스는 생략해도 기본적으로 메소드 public!!
}
