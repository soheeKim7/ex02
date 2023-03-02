<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<a href="/board/list">목록 보기 가기</a>
	<br>
	<a href="/board/register" method="post">등록 보러가기</a>
	<br>
	<a href="/board/rank" method="post">순위 보러가기</a>
	<br>
	<a href="/board/last" method="post">최근 작성글 보러가기</a>
	<br>


	<%--
	<span class="testCenter" style="text-align: center"><h1>테스트중</h1></span>
	 
	<div class="dataTables_paginate paging_simple_numbers"
		id="dataTable_paginate">
		<ul class="pagination">
			<li class="paginate_button page-item previous disabled"
				id="dataTable_previous"><a href="#" aria-controls="dataTable"
				data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
			<li class="paginate_button page-item active"><a href="#"
				aria-controls="dataTable" data-dt-idx="1" tabindex="0"
				class="page-link" style="margin-right: 5px;">1</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="2" tabindex="0"
				class="page-link">2</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="3" tabindex="0"
				class="page-link">3</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="4" tabindex="0"
				class="page-link">4</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="5" tabindex="0"
				class="page-link">5</a></li>
			<li class="paginate_button page-item "><a href="#"
				aria-controls="dataTable" data-dt-idx="6" tabindex="0"
				class="page-link">6</a></li>
			<li class="paginate_button page-item next" id="dataTable_next"><a
				href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
				class="page-link">Next</a></li>
		</ul>
	</div>
	
	<nav aria-label="pageBar">
	  <ul class="pagination" style="justify-content:center;">
	  	<c:if test="${pageDTO.prev }">
		    <li class="page-item">
		      <a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">Previous</a>
		    </li>
		</c:if> 
		<c:if test="${!pageDTO.prev }">
		    <li class="page-item disabled">
		      <a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">Previous</a>
		    </li>
		</c:if>    
		<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
			<li class="page-item" style="padding-right: 5px; padding-left: 5px;">
			<a href="/board/list?pageNum=${num}&amonut=${pageDTO.cri.amount}" class="page-link">
				<c:if test="${pageDTO.cri.pageNum ==num }"> <b>${num}</b> </c:if>
				<c:if test="${pageDTO.cri.pageNum !=num }">	${num}</c:if>
			</a></li>						
		</c:forEach>  				
		<c:if test="${pageDTO.next }">					
			<li class="page-item">
			<a href="/board/list?pageNum=${pageDTO.endPage+1}&amonut=${pageDTO.cri.amount}" class="page-link">
			   Next</a></li>						
		</c:if>	
		<c:if test="${!pageDTO.next }">					
			<li class="page-item disabled">
			<a href="/board/list?pageNum=${pageDTO.endPage+1}&amonut=${pageDTO.cri.amount}" class="page-link">
			   Next</a></li>						
		</c:if>					
	  </ul>
	</nav>
	
	
	<c:if test="${!pageDTO.prev }">
	    <li class="paginate_button page-item previous disabled"	style="margin-right:5px; margin-left:5px;">
    	<a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amonut=${pageDTO.cri.amount}">
	    	<i class="bi bi-chevron-double-left"></i>
	    	<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
			</svg> 	
		</a></li>
	</c:if>
	--%>
	
	
	
</body>
</html>
