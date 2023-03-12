<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">스프링 게시판</h1>
	<p class="mb-4">
		코드로 배우는 스프링 웹 프로젝트(개정판) 책을 보고 똑같이 만들고 있어요. (교재내용 Part3 p164~) <br>
		<a target="_blank" href="https://startbootstrap.com/theme/sb-admin-2">(참고한
			템플릿)</a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">게시글 확인화면</h4> <br>
			<div class="form-group row">
				<div class="col-sm-2">
					<h5 class="m-0 font-weight-bold text-primary">조회수 <c:out value='${board.click}'/> 회</h5>		
				</div>
				<div class="col-sm-7-5">					
				</div>
				<div class="col-sm-2-5" style="text-align:right">
					<button class="btn btn-secondary" id="goodclickButton" style="margin-right: 5px;">
						<span class="icon text-white-50">
						<i class="bi bi-hand-thumbs-up"></i>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
							<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
						</svg>
						</span> 
						<span class="text">좋아요 <span id="goodclickcount">${board.goodclick }</span> 개</span>
					</button>	
					<button class="btn btn-danger" id="badclickButton" >
						<span class="icon text-white-50">
						<i class="bi bi-hand-thumbs-down"></i>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
							<path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/>
						</svg>
						</span> 
						<span class="text">싫어요 <span id="badclickcount">${board.badclick }</span> 개</span>
					</button>			
				</div>
				
				
				
				
				
			</div>
			
		</div>
		<div class="card-body">		
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<input type="text" class="form-control form-control-user"
						name="title" value="<c:out value='${board.title }'/>" readonly>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control form-control-user"
						name="writer" value="<c:out value='${board.writer }'/>" readonly>
				</div>
			</div>
			<div class="form-group">
				<textarea rows="10" class="form-control" name="content" readonly><c:out value='${board.content }'/></textarea>
			</div>
			<div class="form-group row">	
				<div class="col-sm-6 mb-3 mb-sm-0">
					<button class="btn btn-primary" onclick="location.href='/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}'" style="float:left">
						<span class="icon text-white-50">
						<i class="bi bi-file-earmark-text"></i>
		                <svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
			  				<path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
			 			    <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
						</svg>
						</span> 
						<span class="text">목록으로 돌아가기</span>
					</button>				
				</div>		
				<div class="col-sm-6" >	
					<form action="/board/remove" method="post" id="removeForm">			
						<input type="hidden" name="bno" value="${board.bno }">		
						<input type="hidden" name="pageNum" value="${cri.pageNum }">		
						<input type="hidden" name="amount" value="${cri.amount }">		
						<input type="hidden" name="removeKey" id="removeKey">
						<button class="btn btn-danger" id="removeButton" style="float:right">
							<span class="icon text-white-50">
							<i class="bi bi-file-earmark-x"></i>
							<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-file-earmark-x" viewBox="0 0 16 16">
				  				<path d="M6.854 7.146a.5.5 0 1 0-.708.708L7.293 9l-1.147 1.146a.5.5 0 0 0 .708.708L8 9.707l1.146 1.147a.5.5 0 0 0 .708-.708L8.707 9l1.147-1.146a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146z"/>
				  				<path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
							</svg>
							</span> 
							<span class="text">삭제하기</span>
						</button>		
					</form>	
					<button class="btn btn-primary" onclick="location.href='/board/modify?bno=${board.bno}&pageNum=${cri.pageNum }&amount=${cri.amount }'" style="margin-right: 10px; float:right" >
						<span class="icon text-white-50">
						<i class="bi bi-pencil-square"></i>
						<svg xmlns="http://www.w3.org/2000/svg" width="25"  fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			 			    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
						</svg>
						</span> 
						<span class="text">편집하기</span>
					</button>
				</div>
			</div> <br>		
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-primary">전체 댓글 <span id="replycount"></span>개 
						<label>
							<select class="form-control form-control-sm" id="replyViewChoice" style="margin-left:10px;">																			
								<option value="1">등록순</option>
								<option value="2">최신순</option>									
							</select>	
						</label>
					</h5>
				</div>
				<div class="card-body" id="replylist">						
		           <span id="reply"></span>			
		        </div>
				<%-- <b>1. 테스트하고 잇는데??</b> -작성자(20년3월7일 4시31분) <button class="btn btn-success btn-circle">수정</button><br>   --%>        	
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-primary">댓글 등록</h5>
				</div>
				<div class="card-body">		
					<div class="form-group row">
						<div class="col-sm-6" >
							<input type="text" class="form-control form-control-user" placeholder="닉네임" id="replyerdata">
						</div>
						<div class="col-sm-6" >
							<input type="password" class="form-control form-control-user" placeholder="비밀번호" id="replypwdata">
						</div>
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control" name="reply" placeholder="댓글 내용을 써주세요." id="replydata"></textarea>
					</div>
					<button class="btn btn-primary"style="margin-right: 10px; float:right" id="replyInsert">
						<span class="icon text-white-50">
							<i class="bi bi-chat-left-text"></i>
							<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
								<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
								<path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
							</svg>
						</span> 
						<span class="text">댓글 등록하기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
<script src="/resources/js/reply.js?ver=1"></script>

<script> 
	$(document).ready(function(){
		show();
		//show2();
		function show(){
			//댓글목록을 가져와서 화면에 뿌리기
			replyService.getList(${board.bno},function(data){
				//data에 댓글 내용 리스트
				len=data.length || 0;  //or는 앞에 참이면 바로 앞 내용 적용
				//console.log("게시글 작성시간 확인","${board.regdate}");
				
				var htmlStr="";
				for(var i=0;i<len;i++){			
					htmlStr+="<div class='form-group row'>"+
								"<div class='col-sm-2'>"+								
									"<input type='text' class='form-control form-control-user' value='"+ data[i].replyer +"' readonly id='replyerdataModify"+(i+1)+"'>"+
								"</div>"+
								"<div class='col-sm-7-7'>"+
									"<textarea class='form-control' style='height: 38px;' readonly id='replydataModify"+(i+1)+"'>"+
										data[i].reply +
									"</textarea>"+
								"</div>"+
								"<div class='col-sm-2-3' style='text-align: right;'>"+								
									"<span style='margin-right: 10px;' id='replydate"+(i+1)+"'>"+
										replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
									"</span>"+
									"<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
										"<span class='text'>수정</span>"+
									"</button>"+
									"<button class='btn btn-primary replymodifyCancel' style='margin-right: 10px;display: none;' id='replyModifyCancelBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
										"<span class='text'>수정취소</span>"+
									"</button>"+
									"<button class='btn btn-danger replyremove'  id='replyRemoveBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
										"<span class='text'>삭제</span>"+
									"</button>"+
								"</div>"+			
							"</div>"+
							"<hr>";				
							
				}				
				//console.log(data);
				//console.log("잘만들어졌나",htmlStr);
				$("#reply").html(htmlStr);
				//$("#replyerdataModify1").attr("readonly", false);
				
				$("#replycount").text(len);  //전체 댓글개수 찍어줌			
			});
		};
		
		
		//댓글등록 버튼을 클릭했을때 수행하는 작업(1.댓글등록 2.댓글목록 가져오기)
		$("#replyInsert").on("click",function(){ 
			console.log("댓글 등록 버튼 클릭");	
			var bnodata=${board.bno};
			var replyerdata=$("#replyerdata").val();			
			var replydata=$("#replydata").val();
			var replypwdata=$("#replypwdata").val();
			console.log("댓글입력값 확인해보자~~ 왜 안나오지?",replydata,replyerdata,replypwdata);
			
			var replyViewChoice=$("#replyViewChoice option:selected").val();
			console.log("현재 선택된 댓글목록 보여주는 순서 등록순(1),최신순(2) : ",replyViewChoice);	
			
			if(replyViewChoice==1){
				if(replyerdata && replydata && replypwdata){      //작성한 내용이 있을때만 댓글 등록 가능하게!
					replyService.add({bno:bnodata,reply:replydata,replyer:replyerdata,replypw:replypwdata},function(data){
						alert("댓글이 등록되었습니다.");
						show();         //위치가 여기인 이유 : 자바스크립트가 ajax,time 관련해서는 비동기처리되기 때문
										//그래서 콜백함수안에서 다끝내고 show 보여주기 위해서!
					});				//콜백함수
					//작성된 내용 지우기
					$("#replyerdata").val("");
					$("#replydata").val("");
					$("#replypwdata").val("");
				}else{
					alert("닉네임, 비밀번호, 댓글 내용을 모두 입력해주세요.")
				};
				//show();  //이렇게 콜백함수 밖에있으면 ajax는 실행이 길어지면 show먼저 보여줄수도 있어!		
			}else{
				if(replyerdata && replydata && replypwdata){      //작성한 내용이 있을때만 댓글 등록 가능하게!
					replyService.add({bno:bnodata,reply:replydata,replyer:replyerdata,replypw:replypwdata},function(data){
						alert("댓글이 등록되었습니다.");
						show2();         //위치가 여기인 이유 : 자바스크립트가 ajax,time 관련해서는 비동기처리되기 때문
										//그래서 콜백함수안에서 다끝내고 show 보여주기 위해서!
					});				//콜백함수
					//작성된 내용 지우기
					$("#replyerdata").val("");
					$("#replydata").val("");
					$("#replypwdata").val("");
				}else{
					alert("닉네임, 비밀번호, 댓글 내용을 모두 입력해주세요.")
				};
			}
		});
		
		
		//수정 버튼 클릭했을때 수행하는 작업
		// 1. 일단 그 해당 댓글의 readonly 해제 하기
		$("#replylist").on("click",".replymodify",function(){
			var replyViewChoice=$("#replyViewChoice option:selected").val();
			console.log("현재 선택된 댓글목록 보여주는 순서 등록순(1),최신순(2) : ",replyViewChoice);			
			
			//등록순 일때
			if(replyViewChoice==1){
				console.log($(this).attr('id'));  //수정버튼의 ID이름 => replyModifyBn1		
				//console.log("누른 버튼의 부모 html~~~~~~",$(this).parent().html());
				var order=$(this).attr('id').substring(13);   //몇번째 인지, 숫자값
				console.log("첫번째 수정버튼의 순서",order);		
				
				var replypwKey=prompt("댓글 작성시에 입력한 비밀번호를 입력해주세요.");		
				console.log("입력한 비밀번호 : ",replypwKey);
				var modifyrnoKey=$(this).val();
				console.log("버튼에서 가져오는 value 값 여기는 읽히나??? 모야? modifyrnoKey : ",modifyrnoKey);				
				
				replyService.getList(${board.bno},function(data){
					//data에 댓글 내용 리스트
					//len=data.length || 0;  //or는 앞에 참이면 바로 앞 내용 적용
										
					var htmlStr="";
					for(var i=0;i<len;i++){			
						htmlStr+="<div class='form-group row'>"+
									"<div class='col-sm-2'>"+								
										"<input type='text' class='form-control form-control-user' value='"+ data[i].replyer +"' readonly id='replyerdataModify"+(i+1)+"'>"+
									"</div>"+
									"<div class='col-sm-7-7'>"+
										"<textarea class='form-control' style='height: 38px;' readonly id='replydataModify"+(i+1)+"'>"+
											data[i].reply +
										"</textarea>"+
									"</div>"+
									"<div class='col-sm-2-3' style='text-align: right;'>"+								
										"<span style='margin-right: 10px;' id='replydate"+(i+1)+"'>"+
											replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
										"</span>"+
										"<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn"+(i+1)+"' value='" +data[i].rno+ "'>"+							
											"<span class='text'>수정</span>"+
										"</button>"+	
										"<button class='btn btn-primary replymodifyCancel' style='margin-right: 10px;display: none;' id='replyModifyCancelBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
											"<span class='text'>수정취소</span>"+
										"</button>"+
										"<button class='btn btn-danger replyremove'  id='replyRemoveBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
											"<span class='text'>삭제</span>"+
										"</button>"+
									"</div>"+			
								"</div>"+
								"<hr>";				
					}			
					//console.log(data);
					//console.log("잘만들어졌나",htmlStr);
					$("#reply").html(htmlStr);					
					
					replyService.replypwCheck({rno:modifyrnoKey,replypw:replypwKey},function(data){
						//alert("가져온 데이터 "+data);  //success , fail
						if(data=="success"){
							$("#replyerdataModify"+order).attr("readonly", false);				
							$("#replydataModify"+order).attr("readonly", false);
						}else{
							alert("비밀번호가 틀립니다.")
							show();
						}						
					});								
					
					$("#replyModifyCancelBn"+order).show("fast");
					$("#replydate"+order).hide("fast");
					
					console.log("클래스명 변경하기 전에~~~ 클래스명 봐보자!!",$("#replyModifyBn"+order).attr("class"));
					$(".replymodify").attr("class","btn btn-primary modifydisplay");
					console.log("클래스명 제대로 변경되었나 봐보자~~~ 어디 봐봐",$("#replyModifyBn"+order).attr("class"));
					console.log("제대로 하나 읽어오나???",$(".modifydisplay").attr("class"));
					
					var replyerdataModify=$("#replyerdataModify"+order).val();			
					var replydataModify=$("#replydataModify"+order).val();
					console.log("입력되기 전, 불러온값~~~작성자~~~",replyerdataModify);
					console.log("입력된 전, 불러온값~~~~내용~~~",replydataModify);		
					
					for(var i=1;i<=len;i++){
						if(i!=order){
							$("#replyModifyBn"+i).attr("disabled", true);
							$("#replyRemoveBn"+i).attr("disabled", true);
						}
					}
					
					$("#replycount").text(len);		 //전체 댓글개수 찍어줌					
				});		
			}else{ //최신순 일때
				console.log($(this).attr('id'));  //수정버튼의 ID이름 => replyModifyBn1		
				//console.log("누른 버튼의 부모 html~~~~~~",$(this).parent().html());
				var order=$(this).attr('id').substring(13);   //몇번째 인지, 숫자값
				console.log("첫번째 수정버튼의 순서",order);		
				
				var replypwKey=prompt("댓글 작성시에 입력한 비밀번호를 입력해주세요.");		
				console.log("입력한 비밀번호 : ",replypwKey);
				var modifyrnoKey=$(this).val();
				console.log("버튼에서 가져오는 value 값 여기는 읽히나??? 모야? modifyrnoKey : ",modifyrnoKey);				
				
				replyService.getList2(${board.bno},function(data){
					//data에 댓글 내용 리스트
					//len=data.length || 0;  //or는 앞에 참이면 바로 앞 내용 적용
										
					var htmlStr="";
					for(var i=0;i<len;i++){			
						htmlStr+="<div class='form-group row'>"+
									"<div class='col-sm-2'>"+								
										"<input type='text' class='form-control form-control-user' value='"+ data[i].replyer +"' readonly id='replyerdataModify"+(i+1)+"'>"+
									"</div>"+
									"<div class='col-sm-7-7'>"+
										"<textarea class='form-control' style='height: 38px;' readonly id='replydataModify"+(i+1)+"'>"+
											data[i].reply +
										"</textarea>"+
									"</div>"+
									"<div class='col-sm-2-3' style='text-align: right;'>"+								
										"<span style='margin-right: 10px;' id='replydate"+(i+1)+"'>"+
											replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
										"</span>"+
										"<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn"+(i+1)+"' value='" +data[i].rno+ "'>"+							
											"<span class='text'>수정</span>"+
										"</button>"+						
										"<button class='btn btn-primary replymodifyCancel' style='margin-right: 10px;display: none;' id='replyModifyCancelBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
											"<span class='text'>수정취소</span>"+
										"</button>"+
										"<button class='btn btn-danger replyremove'  id='replyRemoveBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
											"<span class='text'>삭제</span>"+
										"</button>"+
									"</div>"+			
								"</div>"+
								"<hr>";				
					}			
					//console.log(data);
					//console.log("잘만들어졌나",htmlStr);
					$("#reply").html(htmlStr);					
					
					replyService.replypwCheck({rno:modifyrnoKey,replypw:replypwKey},function(data){
						//alert("가져온 데이터 "+data);  //success , fail
						if(data=="success"){
							$("#replyerdataModify"+order).attr("readonly", false);				
							$("#replydataModify"+order).attr("readonly", false);
						}else{
							alert("비밀번호가 틀립니다.")
							show2();
						}						
					});							
					
					$("#replyModifyCancelBn"+order).show("fast");
					$("#replydate"+order).hide("fast");
					
					console.log("클래스명 변경하기 전에~~~ 클래스명 봐보자!!",$("#replyModifyBn"+order).attr("class"));
					$(".replymodify").attr("class","btn btn-primary modifydisplay");
					console.log("클래스명 제대로 변경되었나 봐보자~~~ 어디 봐봐",$("#replyModifyBn"+order).attr("class"));
					console.log("제대로 하나 읽어오나???",$(".modifydisplay").attr("class"));
					
					var replyerdataModify=$("#replyerdataModify"+order).val();			
					var replydataModify=$("#replydataModify"+order).val();
					console.log("입력되기 전, 불러온값~~~작성자~~~",replyerdataModify);
					console.log("입력된 전, 불러온값~~~~내용~~~",replydataModify);		
					
					for(var i=1;i<=len;i++){
						if(i!=order){
							$("#replyModifyBn"+i).attr("disabled", true);
							$("#replyRemoveBn"+i).attr("disabled", true);
						}
					}
					
					$("#replycount").text(len);		 //전체 댓글개수 찍어줌					
				});				
			}			
			
		});
			
			
		//2. 그 해당 내용을 수정하기
		$("#replylist").on("click",".modifydisplay",function(){
			var replyViewChoice=$("#replyViewChoice option:selected").val();
			console.log("현재 선택된 댓글목록 보여주는 순서 등록순(1),최신순(2) : ",replyViewChoice);
			
			if(replyViewChoice==1){
				console.log($(this).attr('id'));  //수정버튼의 ID이름 => replyModifyBn1						
				var order=$(this).attr('id').substring(13);   //몇번째 인지, 숫자값
				console.log("두번째 수정버튼 순서",order);
				
				var modifyrno=$(this).val();
				console.log("버튼 클릭될때 나오는 댓글번호 잘 가지고 왔나~",modifyrno);
				
				var replyerdataModify=$("#replyerdataModify"+order).val();			
				var replydataModify=$("#replydataModify"+order).val();
				console.log("입력된 값~~~작성자~~~",replyerdataModify);
				console.log("입력된 값~~~~내용~~~",replydataModify);
				
				replyService.modify({rno:modifyrno,reply:replydataModify,replyer:replyerdataModify},function(data){
					alert(modifyrno+"번글 수정완료 되었습니다."); 
					console.log(modifyrno,"번 수정 완료");
					//console.log("바꾸기 전에 클래스 이름 보자",$(".modifydisplay").attr("class"));
					$(".modifydisplay").attr("class","btn btn-primary replymodify");
					//console.log("제대로 바뀌었나? 테스트중 ",$(".modifydisplay").attr("class"));
					//console.log("제대로 바뀌었겠지!! 이건 후훗",$(".replymodify").attr("class"));
					console.log("왜 여기가 여러번 실행되지? 왜지?");
					show();
				});				
				//console.log("수정되고 후의 값~~~작성자~~~",replyerdataModify);
				//console.log("수정되구 후의 값~~~~내용~~~",replydataModify);
			}else{
				console.log($(this).attr('id'));  //수정버튼의 ID이름 => replyModifyBn1						
				var order=$(this).attr('id').substring(13);   //몇번째 인지, 숫자값
				console.log("두번째 수정버튼 순서",order);
				
				var modifyrno=$(this).val();
				console.log("버튼 클릭될때 나오는 댓글번호 잘 가지고 왔나~",modifyrno);
				
				var replyerdataModify=$("#replyerdataModify"+order).val();			
				var replydataModify=$("#replydataModify"+order).val();
				console.log("입력된 값~~~작성자~~~",replyerdataModify);
				console.log("입력된 값~~~~내용~~~",replydataModify);
				
				replyService.modify({rno:modifyrno,reply:replydataModify,replyer:replyerdataModify},function(data){
					alert(modifyrno+"번글 수정완료 되었습니다."); 
					console.log(modifyrno,"번 수정 완료");
					//console.log("바꾸기 전에 클래스 이름 보자",$(".modifydisplay").attr("class"));
					$(".modifydisplay").attr("class","btn btn-primary replymodify");
					//console.log("제대로 바뀌었나? 테스트중 ",$(".modifydisplay").attr("class"));
					//console.log("제대로 바뀌었겠지!! 이건 후훗",$(".replymodify").attr("class"));
					//console.log("왜 여기가 여러번 실행되지? 왜지?");
					show2();
				});				
			}			
		});			
		
		
		//그 해당내용 수정취소 버튼 클릭했을때
		$("#replylist").on("click",".replymodifyCancel",function(){
			var replyViewChoice=$("#replyViewChoice option:selected").val();
			console.log("현재 선택된 댓글목록 보여주는 순서 등록순(1),최신순(2) : ",replyViewChoice);
			
			if(replyViewChoice==1){
				console.log($(this).attr('id'));  //수정취소버튼의 ID이름 => replyModifyCancelBn1						
				var order=$(this).attr('id').substring(19);   //몇번째 인지, 숫자값
				console.log("수정취소 버튼 순서",order);
				var modifyCancelrno=$(this).val();
				console.log("해당 글번호",modifyCancelrno);
				
				alert(modifyCancelrno+"번글 수정이 취소되었습니다.");
				//$("#replyModifyCancelBn"+order).hide("fast");
				//$("#replydate"+order).show("fast");
				show();
			}else{
				console.log($(this).attr('id'));  //수정취소버튼의 ID이름 => replyModifyCancelBn1						
				var order=$(this).attr('id').substring(19);   //몇번째 인지, 숫자값
				console.log("수정취소 버튼 순서",order);
				var modifyCancelrno=$(this).val();
				console.log("해당 글번호",modifyCancelrno);
				
				alert(modifyCancelrno+"번글 수정이 취소되었습니다.");
				//$("#replyModifyCancelBn"+order).hide("fast");
				//$("#replydate"+order).show("fast");
				show2();				
			}
			
		});
		
		
		
		//삭제 버튼 클릭했을때
		$("#replylist").on("click",".replyremove",function(){		
			var replyViewChoice=$("#replyViewChoice option:selected").val();
			console.log("현재 선택된 댓글목록 보여주는 순서 등록순(1),최신순(2) : ",replyViewChoice);
			
			if(replyViewChoice==1){
				var removerno=$(this).val();
				console.log(removerno);  
				var replypwKey=prompt("댓글 작성시에 입력한 비밀번호를 입력해주세요.");		
				console.log("입력한 비밀번호 : ",replypwKey);
				
				replyService.replypwCheck({rno:removerno,replypw:replypwKey},function(data){
					//alert("가져온 데이터 "+data);  //success , fail
					if(data=="success"){
						replyService.remove(removerno,function(){
							alert(removerno+"번글 삭제완료 되었습니다.");
							console.log(removerno,"번 삭제 완료");
							show();			
						});						
					}else{
						alert("비밀번호가 틀립니다.")
						show1();
					}						
				});					
			}else{
				var removerno=$(this).val();
				console.log(removerno);  
				var replypwKey=prompt("댓글 작성시에 입력한 비밀번호를 입력해주세요.");		
				console.log("입력한 비밀번호 : ",replypwKey);
				
				replyService.replypwCheck({rno:removerno,replypw:replypwKey},function(data){
					//alert("가져온 데이터 "+data);  //success , fail
					if(data=="success"){
						replyService.remove(removerno,function(){
							alert(removerno+"번글 삭제완료 되었습니다.");
							console.log(removerno,"번 삭제 완료");
							show2();			
						});						
					}else{
						alert("비밀번호가 틀립니다.")
						show2();
					}						
				});	
			}
		});
		
		
		//댓글 리스트 등록순 or 최신순 으로 보기		
		$("#replyViewChoice").change(function(e){				
			var replyViewChoice = $("#replyViewChoice").val();
			
			if(replyViewChoice==1){
				show();
			}else{
				show2();
			}			
		});				
		
		
		function show2(){
			//댓글목록을 가져와서 화면에 뿌리기
			replyService.getList2(${board.bno},function(data){
				//data에 댓글 내용 리스트
				len=data.length || 0;  //or는 앞에 참이면 바로 앞 내용 적용
				//console.log("게시글 작성시간 확인","${board.regdate}");
				
				var htmlStr="";
				for(var i=0;i<len;i++){			
					htmlStr+="<div class='form-group row'>"+
								"<div class='col-sm-2'>"+								
									"<input type='text' class='form-control form-control-user' value='"+ data[i].replyer +"' readonly id='replyerdataModify"+(i+1)+"'>"+
								"</div>"+
								"<div class='col-sm-7-7'>"+
									"<textarea class='form-control' style='height: 38px;' readonly id='replydataModify"+(i+1)+"'>"+
										data[i].reply +
									"</textarea>"+
								"</div>"+
								"<div class='col-sm-2-3' style='text-align: right;'>"+								
									"<span style='margin-right: 10px;' id='replydate"+(i+1)+"'>"+
										replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
									"</span>"+
									"<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
										"<span class='text'>수정</span>"+
									"</button>"+
									"<button class='btn btn-primary replymodifyCancel' style='margin-right: 10px;display: none;' id='replyModifyCancelBn"+(i+1)+"' value='" +data[i].rno+ "'>"+									
										"<span class='text'>수정취소</span>"+
									"</button>"+
									"<button class='btn btn-danger replyremove' value='" +data[i].rno+ "'>"+									
										"<span class='text'>삭제</span>"+
									"</button>"+
								"</div>"+			
							"</div>"+
							"<hr>";				
				}				
				//console.log(data);
				//console.log("잘만들어졌나",htmlStr);
				$("#reply").html(htmlStr);
				//$("#replyerdataModify1").attr("readonly", false);
				
				$("#replycount").text(len);  //전체 댓글개수 찍어줌			
			});
		};
		
		
	});


</script>



<script>
/*
	//좋아요 테스트
	$("#goodclicktest").on("click",function(){
		replyService.goodclick(${board.bno},function(data){		
			console.log("일단 데이터 잘 받아오나 테스트 해보쟈 : ",data);
			if(!data.goodbadClick.goodCheck){
				console.log("쿠키 이미 있으~~좋아요 이미 누른겨~");
				alert("이미 좋아요를 눌렀습니다.");				
			}else{
				console.log("쿠키 없어서 처음 누른겨");
				alert("좋아요를 눌렀습니다.");
				$("#goodclickcount").text(data.goodclick);
			}	
		});
		
		replyService.getboard(${board.bno},function(data){		
			console.log("getboard 데이터 잘 가져왔나~ : ",data);
			console.log("이렇게 받아오는게 맞나,,,???",data.goodclick);
			$("#goodclickcount").text(data.goodclick);
				
		});
			
	});
	
	
	//싫어요 테스트
	$("#badclicktest").on("click",function(){
		replyService.badclick(${board.bno},function(data){		
			console.log("일단 데이터 잘 받아오나 테스트 해보쟈 : ",data);
			if(!data.goodbadClick.badCheck){
				console.log("쿠키 이미 있으~~싫어요 이미 누른겨~");
				alert("이미 싫어요를 눌렀습니다.");				
			}else{
				console.log("쿠키 없어서 처음 누른겨");
				alert("싫어요를 눌렀습니다.");
				$("#badclickcount").text(data.badclick);
			}	
		});		
	});
*/
	//console.log("조회수 이걸로도 확인 될꺼같은데??",${board.click+1});

	//댓글등록 테스트
	//replyService.add({reply:"테스트...내용..",replyer:"작성자...",bno:1221,replypw:"rksk111"},function(data){   
		//alert("결과 확인 : "+data);
//	});
	
	/*
	replyService.add({bno:1242,reply:"테스트 내용~~~",replyer:"작성자 테스트~~",replypw:"rksk111"},function(data){
		console.log("데이터값 다 잘 가져오나 다 보자",data)
		alert("댓글이 등록되었습니다.");
		show();         //위치가 여기인 이유 : 자바스크립트가 ajax,time 관련해서는 비동기처리되기 때문
						//그래서 콜백함수안에서 다끝내고 show 보여주기 위해서!
	});	
	
	
	replyService.mytest(3,4);    //콘솔로그에 합은 7이다
	
	//해당 글의 댓글 목록 리스트
	replyService.getList(1182,function(data){
		alert("댓글 목록 리스트 성공");
		console.log("목록",data);
	});
	
	//하나의 댓글
	replyService.get(52,function(data){
		alert("하나 댓글 성공");
		console.log("52번 댓글",data);
	});
	
	//댓글 수정
	replyService.modify({rno:52,reply:"4교시",replyer:"오호라"},function(data){
		alert("댓글 수정 성공");
		console.log("52번 댓글 수정",data);
	});
	
	//댓글 삭제
	replyService.remove(51,function(data){
		alert("댓글 삭제 성공",data);
	});
	
	//해당 댓글의 비번 체크
	replyService.replypwCheck({rno:1,replypw:"111"},function(data){
		alert("가져온 데이터 "+data);  //success , fail
	});

	*/

</script>

</script>
<script>
	/* 확인창을 이용한 삭제처리
	$(document).ready(function(){
		$("#removeButton").on("click",function(e){
			//1. 버튼 이벤트(submit)금지
			e.preventDefault();
			//2. 확인창 띄워서 확인받기
			var check=confirm("정말 삭제하시겠습니까?")
			//3. 확인되었으면 submit 처리
			if(check){
				$("#removeForm").submit();
			}		
		});	
	});
	*/
	/*
	$(document).ready(function(){
		$("#removeButton").on("click",function(e){
			//1. 버튼 이벤트(submit)금지
			e.preventDefault();
			//2. 입력창으로 값을 받고 같다면 삭제처리		
			var removekey=prompt("삭제를 위한 키값을 입력해주세요.")
			//3. 확인되었으면 submit 처리
			if(removekey==1234){
				$("#removeForm").submit();
			}else{
				alert("키값이 틀렸습니다.")
			}
		});	
	});
	*/
	$(document).ready(function(){
		$("#removeButton").on("click",function(e){
			//1. 버튼 이벤트(submit)금지
			e.preventDefault();
			//2. 입력창으로 값을 받고		
			var removeKey=prompt("삭제를 위한 키값을 입력해주세요.");
			if(removeKey){
				//3. 그 내용도 같이 보내준다.
				$("#removeKey").val(removeKey);
				$("#removeForm").submit();
				//removekey 값을 보내면 처리는 서버에서
			}
		});			

		console.log("버튼 누르기전 history 값 확인",history.store);
		
		console.log("버튼 누르기전 쿠기값 제대로 읽나 보자",document.cookie)
		/*
		const cookieItems = (document.cookie).split(';');
		console.log(";으로 나눴다는데 잘됬나??",cookieItems);
		const obj = {};
	    cookieItems.forEach((item) => {
	    // '='으로 분리
	    const elem = item.split('=');
	    // 키 가져오기
	    const key = elem[0].trim();
	    // 값 가져오기
	    const val = decodeURIComponent(elem[1]);
	    // 저장
	    obj[key] = val;
	    });
  		console.log("쿠키 객체로 잘 만ㄷ르어 졌나 보자",obj);  // 콘솔 출력
  		*/  		
  	
  		function getCookie(name) { 		//가져올 쿠키의 이름을 파라미터 값으로 받고
  		     var nameOfCookie = name + "="; 	//쿠키는 "쿠키=값" 형태로 가지고 있어서 뒤에 있는 값을 가져오기 위해 = 포함
  		     var x = 0;
  		     while (x <= document.cookie.length) { 	 //현재 세션에 가지고 있는 쿠키의 총 길이를 가지고 반복
  		          var y = (x + nameOfCookie.length); //substring으로 찾아낼 쿠키의 이름 길이 저장
  		          if (document.cookie.substring(x, y) == nameOfCookie) { 	//잘라낸 쿠키와 쿠키의 이름이 같다면
  		               if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) 	//y의 위치로부터 ;값까지 값이 있으면 
  		                    endOfCookie = document.cookie.length; 	//쿠키의 길이로 적용하고
  		               return unescape(document.cookie.substring(y, endOfCookie)); 		//쿠키의 시작점과 끝점을 찾아서 값을 반환
  		          }
  		          x = document.cookie.indexOf(" ", x) + 1; 		//다음 쿠키를 찾기 위해 시작점을 반환
  		          if (x == 0) 		//쿠키 마지막이면 
  		               break;		//반복문 빠져나오기
  		     }
  		     return "";		//빈값 반환
  		}  		
  		
  		
// 		$("#goodclickButton").on("click",function(){		
// 			var goodcookie=getCookie('good'+${board.bno});
// 			if(goodcookie ==""){
// 				console.log("빈값일때 좋아요 누른거 값 보자",goodcookie);
// 				alert("좋아요를 눌렀습니다.");
// 			}
// 			else{
// 				console.log("값이 셋팅 됬을때(쿠키값 있을때) 좋아요 누른거 값 보자",goodcookie);
// 				alert("이미 좋아요를 눌렀습니다.");
// 			}	
// 		});
		
// 		$("#badclickButton").on("click",function(){		
// 			var badcookie=getCookie('bad'+${board.bno});
// 			if(badcookie ==""){
// 				console.log("빈값일때 싫어요 누른거 값 보자",badcookie);
// 				alert("싫어요를 눌렀습니다.");
// 			}
// 			else{
// 				console.log("값이 셋팅 됬을때(쿠키값 있을때) 싫어요 누른거 값 보자",badcookie);
// 				alert("이미 싫어요를 눌렀습니다.");
// 			}
// 		});

		console.log("버튼 누르고 나서  history 값 확인",history.store);
		//좋아요
		$("#goodclickButton").on("click",function(){	
			replyService.goodclick(${board.bno},function(data){		
				console.log("일단 데이터 잘 받아오나 테스트 해보쟈 : ",data);
				if(!data.goodbadClick.goodCheck){
					console.log("쿠키 이미 있으~~좋아요 이미 누른겨~");
					alert("이미 좋아요를 눌렀습니다.");				
				}else{
					console.log("쿠키 없어서 처음 누른겨");
					alert("좋아요를 눌렀습니다.");
					$("#goodclickcount").text(data.goodclick);
				}	
			});	
		});
		
		//싫어요
		$("#badclickButton").on("click",function(){	
			replyService.badclick(${board.bno},function(data){		
				console.log("일단 데이터 잘 받아오나 테스트 해보쟈 : ",data);
				if(!data.goodbadClick.badCheck){
					console.log("쿠키 이미 있으~~싫어요 이미 누른겨~");
					alert("이미 싫어요를 눌렀습니다.");				
				}else{
					console.log("쿠키 없어서 처음 누른겨");
					alert("싫어요를 눌렀습니다.");
					$("#badclickcount").text(data.badclick);
				}	
			});		
		});
	
		
		
	});
	
	


</script>
