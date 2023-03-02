package javaTest;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import lombok.extern.log4j.Log4j;

@Log4j
public class Test {
	@org.junit.Test
	public void testList() {
		List<String> list = new ArrayList<String>();
		list.add("지금은");
		list.add("5교시다.");
		list.add("쉽시다.");
		for(String temp:list) {
			log.info(temp);	
		}
		list.forEach(aa ->log.info(aa));
		log.info(list);		
	}
	
	
	@org.junit.Test
	public void testMap() {
		Map<String, String> map = new HashMap<>();  //키, 값
		map.put("T", "TTTT");     //값 넣기
		map.put("C", "CCC");
		map.put("W", "WWW");
		log.info(map.get("T"));  //값 가져오기
		
		Set<String> key=map.keySet(); //전체 키 가져오기
		key.forEach(aa->log.info(aa));
		
		Collection<String> value=map.values(); //전체 값 가져오기
		map.values().forEach(aa->log.info(aa));		
		value.forEach(aa->log.info(aa));
		
		log.info(map);
	}
	
	@org.junit.Test
	public void testList2() {
//		String[] list=null;
		String[] list=new String[] {};
		
		for(String temp:list) {    //list가 null 이라면 error 발생!! 
			log.info(temp);	
		}
		log.info(list);		
	}
	
	

}
