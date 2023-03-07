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
	<a href="/board/list">목록 보기 가기</a>
	<br>
	<a href="/board/barChart">바차트 보러가기</a>
	<br>
	<a href="/board/chart">차트 보러가기</a>
	<br>
	<a href="/board/chart2">차트 보러가기2</a>
	<br>
	<a href="/board/register" method="post">등록 보러가기</a>
	<br>
	<a href="/board/rank" method="post">순위 보러가기</a>
	<br>
	<a href="/board/last" method="post">최근 작성글 보러가기</a>
	<br>


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
	
	
		
				
	
	--%>

</body>
</html>
