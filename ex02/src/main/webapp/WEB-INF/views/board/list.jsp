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
			<h6 class="m-0 font-weight-bold text-primary">게시글 목록보기</h6>
			<button class="btn btn-primary" onclick="location.href='/board/register'" style="float:right">
				<span class="icon text-white-50">
				<img src="/resources/img/write.jpg" width="25"></span> 
				<span class="text">글쓰기</span>
			</button>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>순번</th>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="no" value="0"></c:set>
						<%--페이지 영역에 변수 선언 --%>
						<c:forEach items="${list }" var="board">
							<tr>
								<td>${no=no+1}</td>
								<%-- ++no 이건 증감연산자 el tag는 지원 안함! --%>
								<td>${board.bno}</td>
								<td><a href="/board/get?bno=${board.bno }">${board.title }</a></td>
								<td>${board.writer }</td>
								<td><fmt:formatDate pattern="yy년MM월dd일 a hh:mm:ss"
										value="${board.regdate }" /></td>
								<c:if test="${board.regdate==board.updatedate }">
									<td><fmt:formatDate pattern="yy년MM월dd일 a hh:mm:ss"
											value="${board.updatedate }" /></td>
								</c:if>
								<c:if test="${board.regdate!=board.updatedate }">
									<td style="color: red;"><fmt:formatDate
											pattern="yy년MM월dd일 a hh:mm:ss" value="${board.updatedate }" /></td>
								</c:if>
								<%--HH=24시간제, hh=12시간제,a=오전오후 --%>
								<%-- ${board.regdate eq board.updatedate } --%>
								<%-- ${board.regdate not eq board.updatedate } --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->	

<%@include file="../includes/footer.jsp"%>
<script>
	var bno="${bno}";  //꼭 "" 안에 ${bno} 써줘야 그 값이 없을때 에러가 안뜸!!! 주의!!!
	console.log("읽어온 쓴글 번호 bno값 확인",bno);
	if(bno)
		alert(bno+"번 글이 등록되었습니다.");	
	//이거 뜨는 알람창 번호 순서 대로 에서 번호???
	//자바스크립트에서 true 인식 : 값이 있을때 // 주의!! false=>0, null, 빈문자 일때 false!!!
	//그래서 if(bno) 로 써도 됨 현재는!! 하지만 bno가 0일때는 false!! 주의!!	
	//if(bno!="")
	/* 자바스크립트에서!!만 === 쓸수 있음 타입까지 비교하는것
	   var num1=3; var num2="3";
	   num1===num2  이건 false 숫자와 문자 비교 
	   num1!==num2  숫자 같지 않거나 타입이 같지 않을때! 하나라도 같지 않을때!
	*/	
	var modifybno="${modifybno}";
	console.log("수정한 글 번호 modifybno값 확인",modifybno);
	if(modifybno)
		alert(modifybno+"번 글이 수정되었습니다.");
	var removebno="${removebno}";
	console.log("수정한 글 번호 removebno값 확인",removebno);
	if(removebno)
		alert(removebno+"번 글이 삭제되었습니다.");
</script>

