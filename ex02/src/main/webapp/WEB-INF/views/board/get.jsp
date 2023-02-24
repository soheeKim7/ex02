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
			<h6 class="m-0 font-weight-bold text-primary">게시글 확인화면</h6>
			<button class="btn btn-primary" onclick="location.href='/board/list'" style="float:right">
				<span class="icon text-white-50">
				<img src="/resources/img/list.jpg" width="25"></span> 
				<span class="text">목록으로 돌아가기</span>
			</button>
		</div>
		<div class="card-body">		
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<input type="text" class="form-control form-control-user"
						name="title" value="${board.title }" readonly>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control form-control-user"
						name="writer" value="${board.writer }" readonly>
				</div>
			</div>
			<div class="form-group">
				<textarea rows="10" class="form-control"
					id="exampleInputEmail"name="content" readonly>${board.content }</textarea>
			</div>
			<form action="/board/remove" method="post" id="removeForm">
			<input type="hidden" name="bno" value="${board.bno }">
			<button class="btn btn-danger" style="float:right" id="removeButton">
				<span class="icon text-white-50">
				<img src="/resources/img/edit1.jpg" width="25"></span> 
				<span class="text">삭제하기</span>
			</button>		
			</form>	
			<button class="btn btn-primary" onclick="location.href='/board/modify?bno=${board.bno}'" style="float:right">
				<span class="icon text-white-50">
				<img src="/resources/img/edit1.jpg" width="25"></span> 
				<span class="text">편집하기</span>
			</button>				
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>
<script>
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


</script>
