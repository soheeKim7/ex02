package org.zerock.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping
@AllArgsConstructor
public class ApiController {
	
	BoardService service;
	
	@GetMapping("api/board/bno/{num}")
	public BoardVO bnoInfo(@PathVariable("num") Long bno) {
				
		return service.get(bno);			
	}
	
	@GetMapping("api/board/{type}/{keyword}/{amount}")
	public List<BoardVO> searchlist(@PathVariable("type") String type,@PathVariable("keyword") String keyword,@PathVariable("amount") int amount){
//		Criteria cri = new Criteria();
//		cri.setAmount(amount);		
		Criteria cri = new Criteria(1,amount);
		cri.setKeyword(keyword);
		cri.setType(type);		
		
		return service.getlist(cri);		
	}
	
	@GetMapping(value="api/board/count", produces="text/plain;")
	public String count() {
		Criteria cri = new Criteria();
		return service.count(cri)+"";
	}
		
	

}
