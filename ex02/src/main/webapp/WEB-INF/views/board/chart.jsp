<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">스프링 게시판</h1>
	<p class="mb-4">	
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
		코드로 배우는 스프링 웹 프로젝트(개정판) 책을 보고 똑같이 만들고 있어요. (교재내용 Part3 p164~) <br>
		<a target="_blank" href="https://startbootstrap.com/theme/sb-admin-2">(참고한 템플릿)</a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">차트보기</h4>
			<button class="btn btn-primary" onclick="location.href='/board/register?pageNum=${pageDTO.cri.pageNum}&amount=${pageDTO.cri.amount}'" style="float:right">
				<span class="icon text-white-50">
				<i class="bi bi-pencil-square"></i>
				<svg xmlns="http://www.w3.org/2000/svg" width="25"  fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
	  				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	 			    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
				</span> 
				<span class="text">글쓰기</span>
			</button>
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
		</div>
		
		<div class="card-body">
			<div class="chart-pie pt-4">
				여기 차트 들어가면 되지? 맞제?
				 <canvas id="myPieChart"></canvas>	
			</div>	
		</div>			
	</div>
	
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->	

<%@include file="../includes/footer.jsp"%>
<script src="/resources/vendor/chart.js/Chart.min.js"></script>
<script src="/resources/js/demo/chart-pie-demo.js"></script>

