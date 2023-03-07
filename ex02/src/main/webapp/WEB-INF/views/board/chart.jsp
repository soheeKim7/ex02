<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">스프링 게시판</h1>
	<p class="mb-4">
		코드로 배우는 스프링 웹 프로젝트(개정판) 책을 보고 똑같이 만들고 있어요. (교재내용 Part3 p164~) <br>
		<a target="_blank" href="https://startbootstrap.com/theme/sb-admin-2">(참고한 템플릿)</a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">도넛 차트보기</h4>			
		</div>		
		<div class="card-body">
			<div class="chart-pie pt-4">
				 <canvas id="myPieChart"></canvas>	
			</div>	
		</div>			
	</div>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">바 차트보기</h4>
		</div>

		<div class="card-body">							
			<div class="chart-pie pt-4">
				<canvas id="myBarChart"></canvas>
			</div>
		</div>
	</div>
	
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->	

<%@include file="../includes/footer.jsp"%>
<script src="/resources/vendor/chart.js/Chart.min.js"></script>
<script>
	console.log("작성자들 테스트중~ ",${mylabels});
	console.log("개수들 테스트중~ ",${mydata});
	
	var mylabels1=${mylabels};
	var mydata1=${mydata};
	
	var mylabels2=${mylabels};
	var mydata2=${mydata};
</script>

<script src="/resources/js/demo/chart-pie-demo.js"></script>
<script>
	mychart1();
</script>
<script src="/resources/js/demo/chart-bar-demo.js"></script>
<script>
	mychart2();
</script>
