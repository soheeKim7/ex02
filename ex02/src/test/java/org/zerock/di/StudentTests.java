package org.zerock.di;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class StudentTests {
	
	@Autowired
	@Setter (onMethod_ = {@Autowired} )
	student obj; //=new student();
	
//	@Autowired //이렇게 데이터가 들어가는 생성자를 통해서! 주입 가능하나 //테스트시에는 생성자를 쓸수 없다!!
//	public StudentTests(student obj) {
//		super();
//		this.obj = obj;
//	}

	@Test
	public void test1() {
		obj.setName("홍길동");
	}
	
//	Home home = new Home(); // home 에서 중간에 주입 쓰려면 연달아서 주입되게 home 클래스 자체도 의존성 컴포넌트 넣어줘야함
	@Autowired
	Home home;  //그리고 여기서 선언도 new로 새로 할게 아니라 여기서도 주입으로 home을 가져와야 연달아 이어져서
	 			//home안에 student도 의존성 주입으로 가져올 수 있음!
				//하지만 여기서 home 자체에 컴포넌트 하고, home을 주입했어도, home에서 student에 @Autowired 주입을 안하면!
				//테스트시 오류는 안뜨지만, 가져올 객체(studuent)가 없기때문에 객체 자체가 null로 뜨고!! ex>null
				//student에 주입을 하면, 객체안에 데이터들을 null값으로 보여준다 ex>student(no=null, name=null)
	@Test
	public void test2() {
		home.print();
	}
	
	
	
}
