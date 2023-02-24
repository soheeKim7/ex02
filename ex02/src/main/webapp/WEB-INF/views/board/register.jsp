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
			<h6 class="m-0 font-weight-bold text-primary">게시글 입력화면</h6>
		</div>
		<div class="card-body">
			<form class="user" action="/board/register" method="post">				
				<div class="form-group row">
					<div class="col-sm-6 mb-3 mb-sm-0">
						<input type="text" class="form-control form-control-user"
							placeholder="제목을 입력해주세요" name="title">
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control form-control-user"
							placeholder="작성자 명" name="writer">
					</div>
				</div>
				<div class="form-group">
					<textarea rows="10" class="form-control"
						id="exampleInputEmail" placeholder="내용을 입력해 주세요." name="content"></textarea>
				</div>
				<button class="btn btn-primary" style="float:right">
					<span class="icon text-white-50">
					<img src="/resources/img/finger.jpg" width="25"></span> 
					<span class="text">등록하기</span>
				</button>
			</form>
			<button class="btn btn-primary" onclick="location.href='/board/list'" style="float:left">
				<span class="icon text-white-50">
				<img src="/resources/img/list.jpg" width="25"></span> 
				<span class="text">목록으로 돌아가기</span>
			</button>		
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>