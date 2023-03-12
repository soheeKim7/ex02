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
	
	//해당글의 댓글목록 가져오기 (필요한건 글번호) /(등록순)
	function getList(bno,callback,error){
		console.log("댓글 목록가져오기 등록순 js 실행");
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
	
	//해당글의 댓글목록 가져오기 (필요한건 글번호) /(최신순)
	function getList2(bno,callback,error){
		console.log("댓글 목록가져오기 최신순 js 실행");
		$.ajax({  
			type: "get" ,
			url: "/replies/pages2/"+bno ,
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
	
	function displayTime( boardDateStr,replyDateStr ){
		var boardDate=new Date(boardDateStr);
		//console.log("게시글 작성시간",boardDate);
		var replyDate=new Date(replyDateStr);
		var gap=replyDate-boardDate;
		//console.log("시간차 : ",gap);
				//시*분*초*ms
		if(gap < 24*60*60*1000){  //24시간 이내라면
			//오전 11:38:30
			var hh=replyDate.getHours();  //24시간 단위
			var hh12= hh>12 ? hh-12: hh;
			var ampm= hh>=12 ? '오후 ' : '오전 ';
			var mi=replyDate.getMinutes();
			var ss=replyDate.getSeconds();
			//var value=hh+":"+mi+":"+ss;
			//var value=(hh>9? '':'0')+hh+":"+(mi>9? '':'0')+mi+":"+(ss>9? '':'0')+ss;
			//var value= ampm+(hh12>9? '':'0')+hh12+":"+(mi>9?'':'0')+mi+":"+(ss>9? '':'0')+ss;
			var value=[ampm,(hh12>9? '':'0'),hh12,":",(mi>9?'':'0'),mi,":",(ss>9? '':'0'),ss].join('');
			//var value2=value.join('');  // join 메소드는 배열의 요소를 합쳐서 문자열로!
										// ''파라미터는 합칠때 사이에 넣어줄 문자 (아무것도 없으니까 그냥 합친거!)
			return value;
		}else{
			//var day=["일","월","화","수","목","금","토"];
			var day = new Array('일', '월', '화', '수', '목', '금', '토');
			return [replyDate.getFullYear(),"/", replyDate.getMonth()>10? '':0,replyDate.getMonth()+1,"/",
			replyDate.getDate()>9? '':0,replyDate.getDate(),"/",day[replyDate.getDay()] ].join('');		
		}
	};
	
	
	//해당댓글의 비밀번호 체크 성공유무
	function replypwCheck(reply,callback,error){
		console.log("해당댓글의 비밀번호 체크 성공유무 js 실행");
		$.ajax({  
			type: "post" ,
			url: "/replies/replypwCheck",
			data: JSON.stringify(reply) , //json 포맷의 댓글데이터, 객체 reply를 넣어주면, ajax에서 json으로 바꿔줌
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
	
	
	//좋아요 수 늘리기
	function goodclick(bno,callback,error){
		console.log("좋아요 클릭 js 실행");
		$.ajax({  
			type: "get" ,
			url: "/api/board/goodclick/"+bno ,
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
	
	return {add:add, getList:getList, getList2:getList2, get:get, modify:modify, remove:remove, time:displayTime, 
			goodclick:goodclick, replypwCheck:replypwCheck, mytest:mytest};  //앞에께 부르는 이름, 뒤에께 안에서 만든 함수 이름
})();

//replyService.add(reply,callback,error);   //callback함수



