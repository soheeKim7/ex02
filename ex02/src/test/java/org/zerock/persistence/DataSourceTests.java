package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataSourceTests {
	
	@Autowired
	DataSource dataSource;
	//인터페이스를 구현한 클래스가 스프링에서 인식되고 있다면 자동주입이 가능
	
	@Test
	public void testConnection() {
		try {
			dataSource.getConnection();
			log.info("커넥션풀 연결 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("커넥션풀 연결 실패");
			fail();
		}
	}
	
	@Autowired
	SqlSessionFactory sqlSessionFactoryBean;
	
	@Test
	public void testMyBatis(){
		/*
		SqlSession session=null;
		Connection conn=null;
		try {
			session=sqlSessionFactoryBean.openSession();
			conn=session.getConnection();
			log.info("마이바티스 성공");
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null) try { conn.close(); } catch (SQLException e) { };
			if(session!=null)  { session.close(); }			
		}
		*/
		
		//try with resource 로 변경
		try(SqlSession session=sqlSessionFactoryBean.openSession();
		    Connection conn=session.getConnection();){
			log.info("마이바티스 성공");
		}catch(Exception e) {
			e.printStackTrace();
			fail();
		}
		//try 하고 자동으로 닫아야할것들은 try() 괄호안에 넣어줌!! => try with resource
	}
	
	@Test
	public void testTryWithResource() {
		//콘솔에서 사용자로부터 숫자 하나 입력받는다.
		//숫자를 출력한다.		
		/* 1단계: 예외처리없이 구현
		 * 2단계: 예외처리 포함 구현 (try catch 구문으로 구현)
		 * 3단계: try with resource 구문으로 구현
		 */

		/*
		Scanner in=new Scanner(System.in);
		log.info("숫자 하나 입력하시오 : ");
		log.info(in.nextInt());
		in.close();	
		*/
		
		/*
		Scanner in=null;
		try {
			in=new Scanner(System.in);
			log.info("숫자 하나 입력하시오 : ");
			log.info(in.nextInt());			
		}catch(Exception e) {
			e.printStackTrace();
			fail();
		}finally {
			in.close();
		}
		*/				
		
		try(Scanner in=new Scanner(System.in);) {
			log.info("숫자 하나 입력하시오 : ");
			log.info(in.nextInt());			
		}catch(Exception e) {
			e.printStackTrace();
			fail();
		}		
	}
	
	
	
}
