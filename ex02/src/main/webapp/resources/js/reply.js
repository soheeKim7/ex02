/**
 * 
 */
console.log("댓글관련 자바스크립트를 실행합니다.");

var replyService=(function(){
	
	//댓글 등록 (필요한건 댓글정보(객체))
	function add(reply,callback,error){
		console.log("댓글 등록 js 실행");
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
	
	//댓글 수정 (필요한건 댓글정보)
	function modify(reply,callback,error){
		console.log("댓글 수정 js 실행");
		$.ajax({  
			type: "put" ,
			url: "/replies/"+reply.rno ,
			data: JSON.stringify(reply) ,
			contentType: "application/json; charset=UTF-8" ,
			success: function(data){   
				if(callback)          
					callback(data);         
			} ,
			error: function(xhr,status,er){  
				if(error)
					error();
			}			
		});
	};
		
	//댓글 삭제
	function remove(rno,callback,error){
		console.log("댓글 삭제 js 실행");
		$.ajax({  
			type: "delete" ,
			url: "/replies/"+rno ,
			//data: 보내는 데이터 없음
			//contentType: "application/json; charset=UTF-8" ,
			success: function(data){   
				if(callback)            
					callback(data);         
			} ,
			error: function(xhr,status,er){   
				if(error)
					error();
			}			
		});
	};		
	
	//하나의 댓글 가져오기 (필요한건 댓글번호)
	function get(rno,callback,error){
		console.log("하나의 댓글가져오기 js 실행");
		$.ajax({  
			type: "get" ,
			url: "/replies/"+rno ,
			//data: 보내는 데이터 없음
			//contentType: "application/json; charset=UTF-8" ,
			success: function(data){   
				if(callback)            
					callback(data);         
			} ,
			error: function(xhr,status,er){   
				if(error)
					error();
			}			
		});
	};	
	
	//해당글의 댓글목록 가져오기 (필요한건 글번호)
	function getList(bno,callback,error){
		console.log("댓글 목록가져오기 js 실행");
		$.ajax({  
			type: "get" ,
			url: "/replies/pages/"+bno ,
			//data: 보내는 데이터 없음
			//contentType: "application/json; charset=UTF-8" ,
			success: function(data){   
				if(callback)           
					callback(data);       
			} ,
			error: function(xhr,status,er){  
				if(error)
					error();
			}			
		});
	};
		
	
	function mytest(num1,num2){
		console.log("합은 "+(num1+num2)+"이다");		
	};
	
	return {add:add, getList:getList, get:get, modify:modify, remove:remove, mytest:mytest};  //앞에께 부르는 이름, 뒤에께 안에서 만든 함수 이름
})();

//replyService.add(reply,callback,error);   //callback함수



