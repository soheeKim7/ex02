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
		<button class="btn btn-success" style="float: right" id="adminButton">
			<span class="icon text-white-50"> <i class="bi bi-file-person"></i>
				<svg xmlns="http://www.w3.org/2000/svg" width="25"
					fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16">
				  <path
						d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z" />
				  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
				</svg>
			</span> <span class="text">관리자 모드로 이동하기</span>
		</button>
	</form>
	코드로 배우는 스프링 웹 프로젝트(개정판) 책을 보고 똑같이 만들고 있어요. (교재내용 Part3 p164~) <br>
	<a target="_blank" href="https://startbootstrap.com/theme/sb-admin-2">(참고한
		템플릿)</a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">차트보기</h4>
		</div>

		<div class="card-body">
			<div class="chart-pie pt-4">
				<div>
					<button id="showtime">자동갱신</button>
					<button id="stop">멈춤</button>
				</div>				
				<canvas id="myPieChart"></canvas>
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
	$(document).ready(function() {
		$("#showtime").on("click", function(e) {
			console.log("갱신 실행");
			e.preventDefault(); //버튼에 걸린 이벤트 처리 다 취소
			updateChart();
		});

		$("#stop").on("click", function(e) {
			console.log("그만 멈춰!");
			e.preventDefault();
			//갱신 멈춤		
			clearTimeout(timerID); //타이머 중지
		});
	});
</script>


<script>
	//console.log("작성자들 테스트중~ ",${mylabels});
	//console.log("개수들 테스트중~ ",${mydata});

	//var mylabels=${mylabels};
	//var mydata=${mydata};

	//위에 데이터를 ajax를 통해 처리하기	
	var mylabels;
	var mydata;

	console.log("원래 작성자 : ", mylabels);
	console.log("원래 개수 : ", mydata);
	console.log("==========================================");

	function updateChart() {
		$.ajax({
			type : "get",
			url : "/api/board/chart",
			dataType : "json", // 받아오는 데이터 생략 가능
			//contentType : 보내는거 없음
			success : function(data) {
				//값을 보내고 결과받아온 값! 
				console.log("원래 데이터 : ", mylabels, mydata);
				//비교
				if ((JSON.stringify(mylabels) != JSON.stringify(data.mylabels))
						|| (JSON.stringify(mydata) != JSON
								.stringify(data.mydata))) {
					console.log("이게 되고있는건가..다를때")
					//갱신!!
					mylabels = data.mylabels;
					mydata = data.mydata;
					mychart();
				}
				console.log("받아온 데이터 : ", mylabels, mydata);

			}
		});
		//var 안하면 전역변수가 됨!!! 
		timerID = setTimeout(updateChart, 2000); // "updateChart()"
		//수행할거, 갱신할거  //2초후에 한번만 updateChart() 차트 수행
		//이렇게 하면, 2초후에 또 본인 호출, 그리고 또 호출 그래서 2초마다 반복됨
		//jquery pdf p42
		//setInterval 일정시간 간격두고 실행(이건 이 함수 말고 밖에 선언)	
	};
</script>


<script src="/resources/js/demo/chart-pie-demo.js"></script>

