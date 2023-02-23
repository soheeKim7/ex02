package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {
	
	//게시물 목록 가져오기
	//@Select("select * from tbl_board")
	List<BoardVO> getList();  //게시물 목록 가져오기
	//인터페이스는 생략해도 기본적으로 메소드 public!!
	
	//게시글 등록 return int 등록된 글의 개수
//	void insert(BoardVO vo);
	int insert(BoardVO vo); //삽입된 행의 개수!
	
	//게시글 수정
	int update(BoardVO vo);
	
	//게시글 삭제
	int delete(Long bno);
	
	//게시글 읽기(조회)
	BoardVO read(Long bno);
	
	//게시글 등록시 등록된 번호 알아서 글 등록하기  //return int 등록된 글의 개수
	int insertSelectKey(BoardVO vo);
	
	//bonus 등록할 글번호 확인하기  //return long 등록할 글번호
	long mySelectKey(); 
	
	//bonus 확인된 글번호로 글 등록하기  //return int 등록된 글의 개수
	int myInsert(BoardVO vo);
	
	//전체글 개수 확인
	long count();
	
	//오늘의 게시글 목록 가져오기
	List<BoardVO> getTodayList();
	
	//오늘의 게시글 갯수 가져오기
	long countTodayList();
	
	//가장 많이 작성한 작성자 가져오기
	String manyWriter();
	
}
