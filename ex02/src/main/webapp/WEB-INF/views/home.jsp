<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<h4><a href="/board/list">목록 보기 가기</a></h4>
	<br>
	<a href="/board/barChart">바차트 보러가기</a>


	<%--
	<span class="testCenter" style="text-align: center"><h1>테스트중</h1></span>
	 
	<div class="dataTables_paginate paging_simple_numbers"
		id="dataTable_paginate">
		<ul class="pagination">
			<li class="paginate_button page-item previous disabled"
				id="dataTable_previous"><a href="#" aria-controls="dataTable"
				data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
			<li class="paginate_button page-item active"><a href="#"
				aria-controls="dataTable" data-dt-idx="1" tabindex="0"
				class="page-link" style="margin-right: 5px;">1</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="2" tabindex="0"
				class="page-link">2</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="3" tabindex="0"
				class="page-link">3</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="4" tabindex="0"
				class="page-link">4</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="5" tabindex="0"
				class="page-link">5</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="6" tabindex="0"
				class="page-link">6</a></li>
			<li class="paginate_button page-item next" id="dataTable_next"><a
				href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
				class="page-link">Next</a></li>
		</ul>
	</div>
	
	<nav aria-label="pageBar">
	  <ul class="pagination" style="justify-content:center;">
	  	<c:if test="${pageDTO.prev }">
		    <li class="page-item">
		      <a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">Previous</a>
		    </li>
		</c:if> 
		<c:if test="${!pageDTO.prev }">
		    <li class="page-item disabled">
		      <a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">Previous</a>
		    </li>
		</c:if>    
		<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
			<li class="page-item" style="padding-right: 5px; padding-left: 5px;">
			<a href="/board/list?pageNum=${num}&amonut=${pageDTO.cri.amount}" class="page-link">
				<c:if test="${pageDTO.cri.pageNum ==num }"> <b>${num}</b> </c:if>
				<c:if test="${pageDTO.cri.pageNum !=num }">	${num}</c:if>
			</a></li>						
		</c:forEach>  				
		<c:if test="${pageDTO.next }">					
			<li class="page-item">
			<a href="/board/list?pageNum=${pageDTO.endPage+1}&amonut=${pageDTO.cri.amount}" class="page-link">
			   Next</a></li>						
		</c:if>	
		<c:if test="${!pageDTO.next }">					
			<li class="page-item disabled">
			<a href="/board/list?pageNum=${pageDTO.endPage+1}&amonut=${pageDTO.cri.amount}" class="page-link">
			   Next</a></li>						
		</c:if>					
	  </ul>
	</nav>
	
	
	<c:if test="${!pageDTO.prev }">
	    <li class="paginate_button page-item previous disabled"	style="margin-right:5px; margin-left:5px;">
    	<a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">
	    	<i class="bi bi-chevron-double-left"></i>
	    	<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
			</svg> 	
		</a></li>
	</c:if>

	<div class="card-body">
		<div class="chart-pie pt-4">
			<div class="chartjs-size-monitor">
				<div class="chartjs-size-monitor-expand">
					<div class=""></div>
				</div>
				<div class="chartjs-size-monitor-shrink">
					<div class=""></div>
				</div>
			</div>
			<canvas id="myPieChart" width="577" height="253"
				style="display: block; width: 577px; height: 253px;"
				class="chartjs-render-monitor"></canvas>
		</div>
		<hr>
		Styling for the donut chart can be found in the
		<code>/js/demo/chart-pie-demo.js</code>
		file.
	</div>
	
	
	
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
        </div>
        <div class="card-body">
            <div class="chart-bar"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                <canvas id="myBarChart" width="521" height="320" style="display: block; width: 521px; height: 320px;" class="chartjs-render-monitor"></canvas>
            </div>
            <hr>
            Styling for the bar chart can be found in the
            <code>/js/demo/chart-bar-demo.js</code> file.
        </div>
    </div>
	
	
	댓글 삭제하기 버튼
	<button class="btn btn-danger">
			<span class="icon text-white-50">
			<i class="bi bi-chat-left"></i>
			<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
				<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			</svg>
			</span>
			<span class="text">댓글 삭제하기</span>
	</button>
	
	
	댓글 목록
	<div class="form-group row">
		<div class="col-sm-1-5">
			버튼 비교해보쟈
		</div>
		<div class="col-sm-7">
			댓글 내용 입력중이거덩? 근데 이쁘게 보였으면 좋겠거덩?? 어떻게 해야 이쁘려나?? 테스트 중이야!!
		</div>
		<div class="col-sm-3-5">
			23년03월08일 오전 00:50:07
			<button class="btn btn-danger" style="float:right">
				<span class="text">삭제</span>
			</button>
			<button class="btn btn-primary" style="margin-right: 10px; float:right">
				<span class="text">수정</span>
			</button>
		</div>			
	</div>
	<hr>
	댓글 목록2
	<div class="form-group row">
		<div class="col-sm-2">
			모양 이쁘게 테스트~
		</div>
		<div class="col-sm-7-7">
			댓글 내용 입력중이거덩? 근데 이쁘게 보였으면 좋겠거덩?? 어떻게 해야 이쁘려나?? 테스트 중이야!!
		</div>
		<div class="col-sm-2-3">
			<button class="btn btn-danger" style="float:right">
				<span class="text">삭제</span>
			</button>
			<button class="btn btn-primary" style="margin-right: 10px; float:right">
				<span class="text">수정</span>
			</button>
			<span style="margin-right: 10px; float:right;" >오후 12:43:41</span>
		</div>			
	</div>
	<hr>
	
	댓글 목록3 완성!!
	<div class="form-group row">
		<div class="col-sm-2">
			모양 이쁘게 테스트~
		</div>
		<div class="col-sm-7-7">
			댓글 내용 입력중이거덩? 근데 이쁘게 보였으면 좋겠거덩?? 어떻게 해야 이쁘려나?? 테스트 중이야!!
		</div>
		<div class="col-sm-2-3" style="text-align: right;">
			<span style="margin-right: 5px;" >오후 12:43:41</span>
			<button class="btn btn-primary" style="margin-right: 5px; ">
				<span class="text">수정</span>
			</button>
			<button class="btn btn-danger" >
				<span class="text">삭제</span>
			</button>
		</div>			
	</div>
	<hr>	
	
	현재 댓글 목록4 완성
	<div class='form-group row'>
		<div class='col-sm-2'>
			<input type='text' class='form-control form-control-user' value='테스트 작성자' readonly id='replyerdataModify0'>
		</div>
		<div class='col-sm-7-7'>
			<textarea class='form-control' style='height: 38px;' readonly id='replydataModify0'>
				테스트 댓글이야~~ 이제 수정버튼 누르고 수정취소 하는것도 만들거야~ 수정취소버튼 디자인 보자~!!!
			</textarea>
		</div>
		<div class='col-sm-2-3' style='text-align: right;'>
			<span style='margin-right: 10px;' id='replydate0'>오후 12:43:41</span>
			<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn0' value='글번호rno'>
				<span class='text'>수정</span>
			</button>
			<button class='btn btn-danger replyremove' id='replyRemoveBn0' value='글번호rno'>
				<span class='text'>삭제</span>
			</button>
		</div>			
	</div>
	<hr>	
	
	수정취소버튼추가 댓글목록5 완성
	<div class='form-group row'>
		<div class='col-sm-2'>
			<input type='text' class='form-control form-control-user' value='테스트 작성자' readonly id='replyerdataModify0'>
		</div>
		<div class='col-sm-7-7'>
			<textarea class='form-control' style='height: 38px;' readonly id='replydataModify0'>
				테스트 댓글이야~~ 이제 수정버튼 누르고 수정취소 하는것도 만들거야~ 수정취소버튼 디자인 보자~!!!
			</textarea>
		</div>
		<div class='col-sm-2-3' style='text-align: right;'>
			<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn0' value='글번호rno'>
				<span class='text'>수정</span>
			</button>
			<button class='btn btn-primary replymodifyCancel' style='margin-right: 10px;' id='replyModifyCancelBn0' value='글번호rno'>
				<span class='text'>수정취소</span>
			</button>
			<button class='btn btn-danger replyremove' id='replyRemoveBn0' value='글번호rno'>
				<span class='text'>삭제</span>
			</button>
		</div>			
	</div>
	<hr>
	
	
	
	
	관리자 모드로 이동하기
	<form action="/board/adminCheck" method="post" id="adminForm">	
		<input type="hidden" name="adminKey" id="adminKey">
		<button class="btn btn-success" style="float:right" id="adminButton">
			<span class="icon text-white-50">
				<i class="bi bi-file-person"></i>			
				<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16">
				  <path d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z"/>
				  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
			</span> 
			<span class="text">관리자 모드로 이동하기</span>
		</button>
	</form>
	
	작성자 게시글 순위보기
	<button class="btn btn-primary" onclick="location.href='/board/rank'" style="float:right;margin-right: 10px;">
		<span class="icon text-white-50">
			<i class="bi bi-list-ol"></i>                
			<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
 					<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z"/>
 					<path d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338v.041zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635V5z"/>
			</svg>
			</span> 
		<span class="text">작성자 게시글 순위보기</span>
	</button>	
	
	댓글 html 
	htmlStr+="<div class='form-group row'>"+
			"<div class='col-sm-2'>"+
				(i+1)+". &nbsp;&nbsp;"+data[i].replyer +
			"</div>"+
			"<div class='col-sm-7'>"+
				data[i].reply +
			"</div>"+
			"<div class='col-sm-3'>"+
				data[i].updatedate +
				"<button class='btn btn-danger' style='float:right'>"+									
					"<span class='text'>삭제</span>"+
				"</button>"+
				"<button class='btn btn-primary' style='margin-right: 10px; float:right'>"+									
					"<span class='text'>수정</span>"+
				"</button>"+
			"</div>"+			
		"</div>"+
		"<hr>";	
		
		
		htmlStr+="<div class='form-group row'>"+
					"<div class='col-sm-2'>"+
						(i+1)+". &nbsp;&nbsp;"+data[i].replyer +									
					"</div>"+
					"<div class='col-sm-7-7'>"+
						data[i].reply +
					"</div>"+
					"<div class='col-sm-2-3' style='text-align: right;'>"+								
						"<span style='margin-right: 10px;' >"+
							replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
						"</span>"+
						"<button class='btn btn-primary' style='margin-right: 10px; '>"+									
							"<span class='text'>수정</span>"+
						"</button>"+
						"<button class='btn btn-danger'>"+									
							"<span class='text'>삭제</span>"+
						"</button>"+
					"</div>"+			
				"</div>"+
				"<hr>";	
				
				span 추가 
				htmlStr+="<div class='form-group row'>"+
								"<div class='col-sm-2'>"+
									"<span>"+
										(i+1)+". &nbsp;&nbsp;"+data[i].replyer +		
									"</span>"+
								"</div>"+
								"<div class='col-sm-7-7'>"+
									"<span>"+
										data[i].reply +
									"</span>"+
								"</div>"+
								"<div class='col-sm-2-3' style='text-align: right;'>"+								
									"<span style='margin-right: 10px;' >"+
										replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
									"</span>"+
									"<button class='btn btn-primary' style='margin-right: 10px; '>"+									
										"<span class='text'>수정</span>"+
									"</button>"+
									"<button class='btn btn-danger'>"+									
										"<span class='text'>삭제</span>"+
									"</button>"+
								"</div>"+			
							"</div>"+
							"<hr>";	
	
	html완성!!!!			
	htmlStr+="<div class='form-group row'>"+
					"<div class='col-sm-2'>"+								
						"<input type='text' class='form-control form-control-user' id='replyermodify' value='"+ data[i].replyer +"' readonly>"+
					"</div>"+
					"<div class='col-sm-7-7'>"+
						"<textarea class='form-control' id='replymodify' style='height: 38px;' readonly>"+
							data[i].reply +
						"</textarea>"+
					"</div>"+
					"<div class='col-sm-2-3' style='text-align: right;'>"+								
						"<span style='margin-right: 10px;' >"+
							replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
						"</span>"+
						"<button class='btn btn-primary' style='margin-right: 10px; '>"+									
							"<span class='text'>수정</span>"+
						"</button>"+
						"<button class='btn btn-danger'>"+									
							"<span class='text'>삭제</span>"+
						"</button>"+
					"</div>"+			
				"</div>"+
				"<hr>";			
				
			
	수정버튼 처음 눌렀을때 html 주소값 변경 전 value
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
					"<span style='margin-right: 10px;' >"+
						replyService.time( '<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regdate}"/>' ,data[i].updatedate) +
					"</span>"+
					"<button class='btn btn-primary replymodify' style='margin-right: 10px;' id='replyModifyBn"+(i+1)+"' value='" +data[i].rno+ "'>"+								
						"<span class='text'>수정</span>"+
					"</button>"+
					"<button class='btn btn-danger replyremove' value='" +data[i].rno+ "'>"+									
						"<span class='text'>삭제</span>"+
					"</button>"+
				"</div>"+			
			"</div>"+
			"<hr>";		
			
			
			
				
	"<input type='hidden' id='inputrno"+(i+1)+"' value='" +data[i].rno+ "'>"+			
				
	//"<fmt:formatDate pattern='yy년MM월dd일 a hh:mm:ss' value="+ day +"/>"
	
	
	--%>

</body>
</html>
