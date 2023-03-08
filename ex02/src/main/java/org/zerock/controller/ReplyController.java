package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
@RequestMapping("/replies/")
public class ReplyController {
	
	ReplyService service;
	
	//등록 (등록할 댓글을 json으로 만들어서 보내줌) -> 돌려주는 글자를 true,false로 리턴
//	@PostMapping(value="/new", produces=MediaType.TEXT_PLAIN_VALUE)
//	public String create(@RequestBody ReplyVO vo) {  //@RequestBody 어노테이션을 안붙이면, 폼에서 파라미터로 보내온거 읽는거! 
//		return service.register(vo)==1 ? "true" : "false";				    //@RequestBody 어노테이션을 해야지 이값을 보내줌!		
//	}
	
	//등록 (등록할 댓글을 json으로 만들어서 보내줌) -> 정상일때 success 문자 보내줌(200), 실패시 글자X,에러상태(500)
	@PostMapping(value="/new", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {  
		return service.register(vo)==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;     
										//new ResponseEntity<>(보낼데이터, 상태값)	200,500
	}	
	
	//수정 put과 patch에 대응 (수정할 댓글을 json으로 만들어서 보내줌)
//	@PutMapping("/{rno}")
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH}, value="/{rno}", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@PathVariable("rno")Long rno,@RequestBody ReplyVO vo){
		vo.setRno(rno);    //해당글번호를 셋팅을해줘야, 보내는 vo에 같이 보내짐!
		return service.modify(vo)==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;   
	}
	
	//삭제
	@DeleteMapping(value="/{rno}", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("rno")Long rno){
		return service.remove(rno)==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;  
	}	
	
	//댓글 1개 조회
	@GetMapping("{rno}")    //produces 로 plain 안정해주면, 자동으로 json으로 읽음
	public ReplyVO get(@PathVariable("rno")Long rno){		
		return service.get(rno);
	}	
		
	//해당글 댓글 리스트 조회
	@GetMapping("/pages/{bno}")  //produces=MediaType.APPLICATION_JSON_VALUE    json타입!
	public List<ReplyVO> getList(@PathVariable("bno")Long bno){		
		return service.getList(bno);
	}
	
	
	
}
