<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

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
			<h4 class="m-0 font-weight-bold text-primary">바 차트보기</h4>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<button class="btn btn-primary" style="float:left; margin-right: 10px; display: none;" id="showtime">
					<span class="icon text-white-50">
						<i class="bi bi-recycle"></i>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-recycle" viewBox="0 0 16 16">
		 					<path d="M9.302 1.256a1.5 1.5 0 0 0-2.604 0l-1.704 2.98a.5.5 0 0 0 .869.497l1.703-2.981a.5.5 0 0 1 .868 0l2.54 4.444-1.256-.337a.5.5 0 1 0-.26.966l2.415.647a.5.5 0 0 0 .613-.353l.647-2.415a.5.5 0 1 0-.966-.259l-.333 1.242-2.532-4.431zM2.973 7.773l-1.255.337a.5.5 0 1 1-.26-.966l2.416-.647a.5.5 0 0 1 .612.353l.647 2.415a.5.5 0 0 1-.966.259l-.333-1.242-2.545 4.454a.5.5 0 0 0 .434.748H5a.5.5 0 0 1 0 1H1.723A1.5 1.5 0 0 1 .421 12.24l2.552-4.467zm10.89 1.463a.5.5 0 1 0-.868.496l1.716 3.004a.5.5 0 0 1-.434.748h-5.57l.647-.646a.5.5 0 1 0-.708-.707l-1.5 1.5a.498.498 0 0 0 0 .707l1.5 1.5a.5.5 0 1 0 .708-.707l-.647-.647h5.57a1.5 1.5 0 0 0 1.302-2.244l-1.716-3.004z"/>
						</svg>					
					</span> 
					<span class="text">자동갱신</span>
				</button>
				<button class="btn btn-primary" style="float:left" id="stop">
					<span class="icon text-white-50">
						<i class="bi bi-exclamation-triangle"></i>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
							<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
							<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
						</svg>				
					</span> 
					<span class="text">멈춤</span>
				</button>
			</div>				
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
<script src="/resources/vendor/chart.js/Chart.min.js?ver=2"></script>
<%-- url get요청이라서 자바스크립트 css변경되면 저렇게 해주면 캐시 삭제 안해도, 값이 바뀌기 때문에 제대로 읽어온다!!
	 테스트할때 수정이 되면 값을 바꾸어가면서 하면 됨! --%>

<script>
	$(document).ready(function(){
		updateChart();
		
		$("#showtime").click(function(e) {
			console.log("갱신 실행");
			e.preventDefault(); //버튼에 걸린 이벤트 처리 다 취소
			updateChart();
		});

		$("#stop").click(function(e) {
			console.log("그만 멈춰!");
			e.preventDefault();
			$("#showtime").show("slow");
			//갱신 멈춤		
			clearTimeout(timerID); //타이머 중지
		});
	});
</script>
<script>	
	var mylabels2;
	var mydata2;

	console.log("원래 작성자 : ", mylabels2);
	console.log("원래 개수 : ", mydata2);
	console.log("==========================================");

	function updateChart() {
		$.ajax({
			type : "get",
			url : "/api/board/chart",
			dataType : "json", // 받아오는 데이터 생략 가능
			//contentType : 보내는거 없음
			success : function(data) {
				//값을 보내고 결과받아온 값! 
				console.log("원래 데이터 : ", mylabels2, mydata2);
				//비교
				if ((JSON.stringify(mylabels2) != JSON.stringify(data.mylabels)) || (JSON.stringify(mydata2) != JSON.stringify(data.mydata))) {
					console.log("이게 되고있는건가..다를때")
					//갱신!!
					mylabels2 = data.mylabels;
					mydata2 = data.mydata;
					mychart2();
				}
				console.log("받아온 데이터 : ", mylabels2, mydata2);
			}
		});
		//var 안하면 전역변수가 됨!!! 
		timerID = setTimeout(updateChart, 2000); 
	};
</script>


<script src="/resources/js/demo/chart-bar-demo.js"></script>

