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

