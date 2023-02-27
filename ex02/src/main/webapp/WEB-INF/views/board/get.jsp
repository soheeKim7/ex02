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
			<h2class="m-0 font-weight-bold text-primary">조회수 <c:out value='${click}'/></h2>
			<button class="btn btn-primary" onclick="location.href='/board/list'" style="float:right">
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
			<form action="/board/remove" method="post" id="removeForm">
				<input type="hidden" name="bno" value="${board.bno }">
				<input type="hidden" name="removeKey" id="removeKey">
				<button class="btn btn-danger" style="float:right" id="removeButton">
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
			<button class="btn btn-primary" onclick="location.href='/board/modify?bno=${board.bno}'" style="float:right;margin-right: 10px;">
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

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
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
});



</script>
