package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("board/*")
@AllArgsConstructor
public class BoardController {
	
	BoardService service;
	
	//1. 게시글 목록보여주기
	@GetMapping("list")   
	public void list(Model model) {
		log.info("url list....");
		model.addAttribute("list",service.getlist());
	}
	
	//2. 게시글 등록
	@PostMapping("register")  
	public void register(BoardVO vo) {
		log.info("url register....");
		service.register(vo);
	}
	
	//3. 게시글 삭제 (정상동작여부 확인)
	@PostMapping("remove")  //삭제
	public void remove(Long bno) {
		log.info("url remove.......");
		service.remove(bno);
	}
	
	//4. 게시글 수정 (정상동작여부 확인)
	@PostMapping("modify")  //수정
	public void modify(BoardVO vo) {
		log.info("url modify.......");
		service.modify(vo);
	}
	
	//5. 게시글 읽기
	@GetMapping("get") 
	public void get(Long bno,Model model) {
		log.info("url get.......");
		model.addAttribute("board",service.get(bno));
	}
		
	//보너스 - 전체글 개수를 알려주는 서비스
	@GetMapping("count")   
	public void count(Model model) {
		log.info("url count.......");
		model.addAttribute("count",service.count());
	}
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@GetMapping("todaylist")   
	public void todaylist(Model model) {
		log.info("url todaylist....");
		model.addAttribute("todaylist",service.getTodayList());
	}
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@GetMapping("counttodaylist")   
	public void countTodayList(Model model) {
		log.info("url counttodaylist.......");
		model.addAttribute("counttodaylist",service.countTodayList());
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@GetMapping("manywriter")
	public void manyWriter(Model model) {
		log.info("url manywriter.......");
		model.addAttribute("manywriter",service.manyWriter());
	}
	
}
