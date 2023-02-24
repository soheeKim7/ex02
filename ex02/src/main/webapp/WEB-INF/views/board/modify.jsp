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
			<form action="/board/modify" method="post" id="modifyForm">
			<input type="hidden" name="bno" value="${board.bno }" >
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<input type="text" class="form-control form-control-user"
						name="title" value="<c:out value='${board.title }'/>"  id="modifyTitle">
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control form-control-user"
						name="writer" value="<c:out value='${board.writer }'/>"  id="modifyWriter">
				</div>
			</div>
			<div class="form-group">
				<textarea rows="10" class="form-control"
					id="modifyContent" name="content" ><c:out value='${board.content }'/></textarea>
			</div>
			<button class="btn btn-primary" style="float:right" id="modifyButton">
				<span class="icon text-white-50">
				<i class="bi bi-file-earmark-diff"></i>
				<svg xmlns="http://www.w3.org/2000/svg" width="25" fill="currentColor" class="bi bi-file-earmark-diff" viewBox="0 0 16 16">
					<path d="M8 5a.5.5 0 0 1 .5.5V7H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V8H6a.5.5 0 0 1 0-1h1.5V5.5A.5.5 0 0 1 8 5zm-2.5 6.5A.5.5 0 0 1 6 11h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
					<path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
				</svg>
				</span> 
				<span class="text">수정하기</span>
			</button>				
			</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->


<%@include file="../includes/footer.jsp"%>
<script>
$(document).ready(function(){	
	console.log("기존의 title : ","${board.title}");
	console.log("기존의 writer : ","${board.writer}");
	console.log("기존의 content : ","${board.content}");
	
	$("#modifyButton").on("click",function(e){
		e.preventDefault();
		console.log("기존의 title : ","${board.title}");
		console.log("기존의 writer : ","${board.writer}");
		console.log("기존의 content : ","${board.content}");
		console.log("------------------------------------");
		
		var modifyTitle=$("#modifyTitle").val();
		var modifyWriter=$("#modifyWriter").val();
		var modifyContent=$("#modifyContent").val();
		console.log("수정된 title : ",modifyTitle);
		console.log("수정된 writer : ",modifyWriter);
		console.log("수정된 content : ",modifyContent);
		
		/*
		if(${board.title eq modifyTitle}){
			if("${board.writer eq modifyWriter}"){
				if("${board.content eq modifyContent}"){
					alert("수정된 데이터가 하나도 없습니다. 다시 수정해주세요.");
				}else{
					$("#modifyForm").submit();
				}
			}else{
				$("#modifyForm").submit();
			}			
		}else{
			$("#modifyForm").submit();
		}
		*/
		
		
		if(${board.title eq modifyTitle}){
			alert("수정된 데이터가 하나도 없습니다. 다시 수정해주세요.");
		}else{
			$("#modifyForm").submit();
		}
		
		
		/*
		if(${board.title==modifyTitle && board.writer==modifyWriter && board.content==modifyContent}){
			alert("수정된 데이터가 하나도 없습니다. 다시 수정해주세요.");
		}else{
			$("#modifyForm").submit();
		}
		*/
	});
});
</script>


