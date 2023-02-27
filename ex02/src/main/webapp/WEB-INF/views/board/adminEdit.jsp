<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">&lt;관리자 모드 페이지 입니다&gt;</h1>
	<p class="mb-4">		
		<button class="btn btn-primary" onclick="location.href='/board/list'" style="float:right">
			<span class="icon text-white-50">
			<i class="bi bi-file-person"></i>			
			<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16">
			  <path d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z"/>
			  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
			</svg>
			</span> 
			<span class="text">일반 모드로 이동하기</span>
		</button>
		코드로 배우는 스프링 웹 프로젝트(개정판) 책을 보고 똑같이 만들고 있어요. (교재내용 Part3 p164~) <br>
		<a target="_blank" href="https://startbootstrap.com/theme/sb-admin-2">(참고한 템플릿)</a>
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">게시글 목록보기</h4>
			<button class="btn btn-primary" onclick="location.href='/board/register'" style="float:right">
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
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>순번 (글번호)</th>							
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>							
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="no" value="0"></c:set>
						<%--페이지 영역에 변수 선언 --%>
						<c:forEach items="${list }" var="board">
							<tr>
								<form action="/board/adminRemove" method="post">
									<td><input type="checkbox" name="checkbno" id="<c:out value='${checkbno}${no=no+1}' />" value="<c:out value='${board.bno }' />">
									<label for="<c:out value='${checkbno}${no=no+1}' />"><c:out value="${no=no+1} (${board.bno})" /></label></td>
								</form>													
								<td><a href="/board/get?bno=${board.bno }"><c:out value="${board.title }" /></a></td>															
								<td><c:out value="${board.writer }" /></td>
								<td><c:out value="${board.click}" /></td>		
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
	if(removebno){
		if(removebno==-1)
			alert("키값이 다릅니다.")
		else
			alert(removebno+"번 글이 삭제되었습니다.");
	}
	var adminKey="${adminKey}";
	console.log("관리자키 비밀번호 성공여부 adminKey값 확인",adminKey);
	if(adminKey){
		if(adminKey==-1){
			alert("비밀번호가 다릅니다.")
			location.href="/board/list";
		}else
			alert("관리자 모드 페이지입니다.");
	}
	
	console.log(${checkbno}${no=no+1});
	
</script>

