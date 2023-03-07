/**
 * 
 */
console.log("댓글관련 자바스크립트를 실행합니다.");

var replyService=(function(){
	
	//댓글 등록
	function add(reply,callback,error){
		console.log("리플등록 js 실행");
		$.ajax({  
			type: "post" ,
			url: "/replies/new" ,
			data: JSON.stringify(reply) , //json 포맷의 댓글데이터, 객체 reply를 넣어주면, ajax에서 json으로 바꿔줌
			contentType: "application/json; charset=UTF-8" ,
			success: function(data){   //성공시(200일때) success   // data,a,b -> 응답결과, status(응답코드), xhr(객체.. 무슨 헤더..?...)
				if(callback)            //콜백함수만 있을때만,   자바스크립트에서 if안에 값 true, false 로 표시 가능
					callback(data);         //콜백함수로 처리할 내용(data) 넣어줌
			} ,
			error: function(xhr,status,er){   //xhr,status,er
				if(error)
					error();
			}
			
		});
	};
	
	function mytest(num1,num2){
		console.log("합은 "+(num1+num2)+"이다");
		
	};
	
	
	
	
	function get(){};
	
	
	
	return {add:add, get:get, mytest:mytest};  //앞에께 부르는 이름, 뒤에께 안에서 만든 함수 이름
})();

//replyService.add(reply,callback,error);   //callback함수



