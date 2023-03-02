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
			<h4 class="m-0 font-weight-bold text-primary">게시글 확인화면</h4>
			<button class="btn btn-primary" onclick="location.href='/board/list?pageNum=${cri.pageNum}&amount=${cri.amount }'" style="float:right">
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
			<input type="hidden" name="pageNum" value="${cri.pageNum }" >
			<input type="hidden" name="amount" value="${cri.amount }" >
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
	var originTitle=`<c:out value='${board.title }'/>`;
	var originWriter="<c:out value='${board.writer }'/>";
	var originContent=`<c:out value='${board.content }'/>`;
	console.log("기존의 originTitle : ",originTitle);
	console.log("기존의 originWriter : ",originWriter);
	console.log("기존의 originContent : ",originContent);
	console.log("------------------------------------");
	
	$("#modifyButton").on("click",function(e){
		e.preventDefault();	
		
		var modifyTitleB=$("#modifyTitle").val();
		var modifyWriterB=$("#modifyWriter").val();
		var modifyContentB=$("#modifyContent").val();
		console.log("수정 변환전 title : ",modifyTitleB);
		console.log("수정 변환전 writer : ",modifyWriterB);
		console.log("수정 변환전 content : ",modifyContentB);
		console.log("//////////////////////////////////////");
		var modifyTitle=modifyTitleB.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
						.replace(/\"/g, "&#034;").replace(/\'/g,"&#39;").replace(/\n/g,"<br />");
		var modifyWriter=modifyWriterB.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
						.replace(/\"/g, "&#034;").replace(/\'/g,"&#39;").replace(/\n/g,"<br />");
		var modifyContent=modifyContentB.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
						.replace(/\"/g, "&#034;").replace(/\'/g,"&#39;").replace(/\n/g,"<br />");
		// /n과 / 표시 
		console.log("수정된 title : ",modifyTitle);
		console.log("수정된 writer : ",modifyWriter);
		console.log("수정된 content : ",modifyContent);
		console.log("=========================================");
		
		if(originTitle == modifyTitle && originWriter==modifyWriter && originContent==modifyContent){
			alert("수정된 데이터가 하나도 없습니다. 다시 수정해주세요.");
		}else{
			alert("확인");
			$("#modifyForm").submit();
		}
	});
});
//	//*****************************************************************
//	//테스트 코드 (김소희님만을 코드) -수정시 비교
//	var title1='<c:out value="${board.title }"/>';
//	var title2=$("#title").val();
//	//에이씨 변환시키자! 이러면 c:out도 비교가능! 
//	var re_title2=title2.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");

//	console.log("보내온값",title1);
//	console.log("수정한값",re_title2);  끝!
//	//********************************************************************/
</script>


