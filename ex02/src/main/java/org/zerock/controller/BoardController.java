package org.zerock.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ChartWriterRank;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("board/*")
@AllArgsConstructor
public class BoardController {
//	@Autowired
	BoardService service;
	
	@GetMapping("")
	public void all() {
		
	}
	
//	PageDTO pageDTO =new PageDTO(service.count(), new Criteria());
	//1. 게시글 목록보여주기
	@GetMapping("list")   
	public void list(Model model,Criteria cri) {
		log.info("url list....");
		log.info("현재 amount : "+cri.getAmount());		

//		model.addAttribute("list",service.getlist(cri));
		model.addAttribute("list",service.getListPlusReplyCountWithPaging(cri));
		//페이지 정보 전달
//		PageDTO pageDTO =new PageDTO(service.count(), cri);
//		log.info("페이지 정보"+pageDTO);
//		model.addAttribute(pageDTO);  //이렇게 이름 안실어서 보내면 자동으로 보내지는 객체이름의 소문자로 즉 같은 이름인 pageDTO로 간다	
		model.addAttribute(new PageDTO(service.count(cri), cri));
//		model.addAttribute(new PageDTO(144L, cri));
	}
		
	
	//2. 게시글 등록
	@GetMapping("register")
	public void register(Criteria cri,Model model) {
		model.addAttribute("cri",cri);
	}	
	
	@PostMapping("register")  
	public String register(BoardVO vo,RedirectAttributes rttr) {
		log.info("url register....");
		service.register(vo);
		log.info("입력된 글번호"+vo.getBno());
		rttr.addFlashAttribute("bno",vo.getBno()); //입력된 글번호 한번만 전송
		
		//목록으로 돌아가기
		return "redirect:/board/list";  
//		/board/list 이렇게 하면 직접적인 페이지를 여는것!  
//		그래서 리다이렉트로 list인 url을 요청해야 컨트롤러에서 받아서 목록을 가지고 보여준다!
//		model.addAttribute("list",service.getlist());
//		return "/board/list";
		//그렇다고 모델에 실어서 보내면 디스패쳐로 가서 주소가 register로 되어있어 계속 새로고침 누르면 도배되서 리스트에 추가된다!!
	}
	
	//3. 게시글 삭제 (정상동작여부 확인)
	@PostMapping("remove")  //삭제
	public String remove(Long bno,RedirectAttributes rttr,String removeKey,Criteria cri) {
		log.info("url remove.......");
		
		
		if(service.remove(bno,removeKey))    //삭제처리
			rttr.addFlashAttribute("removebno",bno);
		else
			rttr.addFlashAttribute("removebno",-1);
		return "redirect:/board/list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount(); 
	}	
	

		
	/*
	@PostMapping("remove")  //삭제
	public String remove(Long bno,RedirectAttributes rttr) {
		log.info("url remove.......");
		service.remove(bno);
		log.info("수정된 글번호"+bno);
		rttr.addFlashAttribute("removebno",bno);
		return "redirect:/board/list"; 
	}
	*/
		
	
	//4. 게시글 수정 (정상동작여부 확인)
	@GetMapping("modify")
	public void modify(Long bno,Model model,Criteria cri) {
		//수정화면 출력 (글번호 받아서 조회한거 보내기)
		model.addAttribute("board",service.get(bno));
		model.addAttribute("cri",cri);
	}
	
	@PostMapping("modify")  //수정
	public String modify(BoardVO vo,RedirectAttributes rttr,Criteria cri) {
		log.info("url modify.......");
		//db가 정상이니까 이렇게 한건데, 정확하게 하려면, 참일때만 값을 보내야함
		service.modify(vo);
		log.info("수정된 글번호"+vo.getBno());
		rttr.addFlashAttribute("modifybno",vo.getBno());
		
		return "redirect:/board/list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount(); 
	}
	
	//5. 게시글 읽기
	@GetMapping("get") 
	public void get(Long bno,Model model,Criteria cri) {
		log.info("url get.......");
		model.addAttribute("board",service.get(bno));		
		model.addAttribute("click",service.clickCount(bno)+1);
		model.addAttribute("cri",cri);                          //페이지 정보를 유지하기 위해 보냄
		service.click(bno);
		log.info(service.clickCount(bno)+1);
	}
		
	//보너스 - 전체글 개수를 알려주는 서비스
//	@GetMapping("count")   
//	public void count(Model model) {
//		log.info("url count.......");
//		model.addAttribute("count",service.count());
//	}
	
	@GetMapping("count")   
	public void count(Model model,Criteria cri) {
		log.info("url count.......");
		model.addAttribute("count",service.count(cri));
	}
	
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@GetMapping("todaylist")   
	public void todaylist(Model model,Criteria cri) {
		log.info("url todaylist....");
		model.addAttribute("todaylist",service.getTodayList());
		model.addAttribute(new PageDTO(service.countTodayList(cri), cri));
	}
	
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@GetMapping("counttodaylist")   
	public void countTodayList(Model model,Criteria cri) {
		log.info("url counttodaylist.......");
		model.addAttribute("counttodaylist",service.countTodayList(cri));
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@GetMapping("manywriter")
	public void manyWriter(Model model) {
		log.info("url manywriter.......");
		model.addAttribute("manywriter",service.manyWriter());
	}
	
	//23.02.27.월 - 가장 많이 작성한 작성자,갯수 가져오기
	@GetMapping("rank")
	public void manyWirterCount(Model model) {
		log.info("url manywritercount.......");
		model.addAttribute("rank",service.manyWirterCount());
	}
	
	//가장 최근에 작성된 글제목 가져오기
	@GetMapping("last")
	public void lastTitle(Model model) {
		log.info("url last.......");
		model.addAttribute("last", service.lastTitle());
	}
	
	//관리자 모드 처리
	@PostMapping("adminCheck")
	public String adminCheck(RedirectAttributes rttr,String adminKey) {
		log.info("url adminCheck.......");
		if(service.adminCheck(adminKey))
			rttr.addFlashAttribute("adminKey",adminKey);
		else
			rttr.addFlashAttribute("adminKey",-1);
				
		return "redirect:/board/admin"; 
	}
	
	//관리자 페이지 열기
	@GetMapping("admin")   
	public void admin(Model model,Criteria cri) {
		log.info("url admin....");
		model.addAttribute("list",service.getlist(cri));
		model.addAttribute(new PageDTO(service.count(cri), cri));
		model.addAttribute("checkbno","checkbno");
	}
	
//	//관리자 편집페이지 열기
//	@GetMapping("adminEdit")
//	public void adminEdit(Model model,Criteria cri) {
//		log.info("url adminEdit....");
//		model.addAttribute("list",service.getlist(cri));
//		model.addAttribute("checkbno","checkbno");
//	}
	
	//관리자 삭제!
//	@PostMapping("adminRemove")
	@RequestMapping("adminRemove")
	public String adminRemove(Long[] checkbno,RedirectAttributes rttr,Criteria cri) {
		log.info("url adminRemove.......");
		log.info("삭제된 bno들 봐보자 배열이 어떻게 찍히려나?"+checkbno);
		String checkbnos="";
		for(int i=0;i<checkbno.length-1;i++) {
			checkbnos+=checkbno[i]+", ";
		}
		log.info("마지막 합치기 전 : "+checkbnos);
		checkbnos+=checkbno[checkbno.length-1];
		log.info("마지막 합체한 후! : "+checkbnos);		
				
		service.checkRemove(checkbno);
		rttr.addFlashAttribute("checkbnoRemove",checkbnos);
		
		return "redirect:/board/admin";
	}
	
	@GetMapping("chart")   // board/chart 요청
	public void chart(Model model) {
		ChartWriterRank chartWriterRank=service.chartWriterRank();
		String mylabels="[";
		for(String labels : chartWriterRank.getMylabels()) {
			mylabels += "\""+labels+"\",";
		}
		mylabels=mylabels.substring(0, mylabels.length()-1)+"]";
		log.info("잘 만들어 졌나? : "+mylabels);
		
		model.addAttribute("mylabels",mylabels);
		model.addAttribute("mydata", Arrays.toString(chartWriterRank.getMydata()));
				
//		model.addAttribute("chartdata",service.chartWriterRank());
		//  /views/board/chart.jsp		
	}
	
	@GetMapping("chart2")  //기본화면만 보내고 ajax로 처리하기
	public void chart2(Model model) {
//		ChartWriterRank chartWriterRank=service.chartWriterRank();
//		String orginlabels="[";
//		for(String labels : chartWriterRank.getMylabels()) {
//			orginlabels += "\""+labels+"\",";
//		}
//		orginlabels=orginlabels.substring(0, orginlabels.length()-1)+"]";
//		log.info("잘 만들어 졌나? : "+orginlabels);
//		
//		model.addAttribute("orginlabels",orginlabels);
//		model.addAttribute("orgindata", Arrays.toString(chartWriterRank.getMydata()));		
//		log.info("잘 만들어 졌나? : "+Arrays.toString(chartWriterRank.getMydata()));
	}
	
	@GetMapping("barChart")
	public void barChart() {
		
	}
	
	
	
}
