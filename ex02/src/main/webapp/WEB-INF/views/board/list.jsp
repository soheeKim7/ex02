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
			<h4 class="m-0 font-weight-bold text-primary">게시글 목록보기</h4>
			<button class="btn btn-primary" onclick="location.href='/board/register?pageNum=${pageDTO.cri.pageNum}&amount=${pageDTO.cri.amount}'" style="float:right">
				<span class="icon text-white-50">
					<i class="bi bi-pencil-square"></i>
					<svg xmlns="http://www.w3.org/2000/svg" width="25"  fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
		  				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
		 			    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					</span> 
				<span class="text">게시글 등록하기</span>
			</button>			
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row" >					
						<div class="col-sm-12 col-md-6">
							<form action="/board/list" method="get">
								<div class="dataTables_filter" style="float:left">
									<label>
										<select class="form-control form-control-sm" id="searchList" name="type" >																			
											<option	value="T" <c:if test='${pageDTO.cri.type=="T" }'>selected</c:if>>제목</option>
											<option	value="C" <c:if test='${pageDTO.cri.type=="C" }'>selected</c:if>>내용</option>
											<option	value="W" <c:if test='${pageDTO.cri.type=="W" }'>selected</c:if>>작성자</option>
											<option	value="TC" <c:if test='${pageDTO.cri.type=="TC" }'>selected</c:if>>제목or내용</option>
											<option	value="TW" <c:if test='${pageDTO.cri.type=="TW" }'>selected</c:if>>제목or작성자</option>
											<option	value="CW" <c:if test='${pageDTO.cri.type=="CW" }'>selected</c:if>>내용or작성자</option>
											<option	value="TCW" <c:if test='${pageDTO.cri.type=="TCW" }'>selected</c:if>>제목or내용or작성자</option>									
										</select>	
									</label>			
									<input type="text" class="form-control form-control-sm" placeholder="검색어를 입력해주세요."  size="50"
										name="keyword" value="${pageDTO.cri.keyword }" >
									<button class="btn btn-primary btn-circle btn-sm" type="submit" >										
										<i class="fas fa-search fa-sm"></i>									
									</button>
								</div>
							</form>
						</div>
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" style="float:right">							
								<select name="viewPage"	class="form-control form-control-sm" id="amount" >																			
									<option	value="10" <c:if test="${pageDTO.cri.amount==10}">selected</c:if>>
										10개씩</option>
									<option	value="25" <c:if test="${pageDTO.cri.amount==25}">selected</c:if>>
										25개씩</option>
									<option	value="50" <c:if test="${pageDTO.cri.amount==50}">selected</c:if>>
										50개씩</option>
									<option	value="100" <c:if test="${pageDTO.cri.amount==100}">selected</c:if>>
										100개씩</option>
								</select> 								
							</div>
						</div>											
					</div>					
					
					<div class="row">
						<div class="col-sm-12">				
							<table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
								<thead>
									<tr>
										<th width="8%">순번 (글번호)</th>							
										<th>제목</th>
										<th width="9%">작성자</th>
										<th width="5%">조회수</th>							
										<th width="5%">좋아요/싫어요</th>							
										<th width="5%">댓글수</th>							
										<th width="15%">작성일</th>
										<th width="15%">수정일</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="no" value="0"></c:set>
									<%--페이지 영역에 변수 선언 --%>
									<c:forEach items="${list }" var="board">
										<tr>
											<td><c:out value="${no=no+1} (${board.bno})" /></td>
											<%-- ++no 이건 증감연산자 el tag는 지원 안함! --%>	
																								
											<td><a href="/board/get?bno=${board.bno }&pageNum=${pageDTO.cri.pageNum}&amount=${pageDTO.cri.amount}"><c:out value="${board.title }" /></a></td>															
											<td><c:out value="${board.writer }" /></td>
											<td><c:out value="${board.click}" /></td>		
											<td><c:out value="${board.goodclick}/${board.badclick }" /></td>		
											<td><c:out value="${board.replycn}" /></td>		
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
						
					<div class="row" style="justify-content:center;">
						<ul class="pagination" >			
							<!-- 맨 앞페이지 ㅣ< 이동 -->		  		
					  		<c:if test="${pageDTO.prev }">
								<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum==num }"> 
									    <li class="paginate_button page-item previous" style="margin-right:5px;">
									    <a class="page-link" href="/board/list?pageNum=1&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
										    <i class="bi bi-chevron-bar-left"></i>
										    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-left" viewBox="0 0 16 16">
												<path fill-rule="evenodd" d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"/>
											</svg>
										</a></li>
									</c:if>							
								</c:forEach> 	
							</c:if> 
						  	<c:if test="${!pageDTO.prev }">
							    <c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
										<c:choose>
											<c:when test="${num==1}">
												<li class="paginate_button page-item previous disabled" style="margin-right:5px;">
											    <a class="page-link" href="/board/list?pageNum=1&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
												    <i class="bi bi-chevron-bar-left"></i>
												    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-left" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"/>
													</svg>
												</a></li>
											</c:when>
											<c:otherwise>
											    <li class="paginate_button page-item previous" style="margin-right:5px;">
											    <a class="page-link" href="/board/list?pageNum=1&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
												    <i class="bi bi-chevron-bar-left"></i>
												    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-left" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"/>
													</svg>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>													
								</c:forEach> 
							</c:if> 					  	
						  	<!-- 10페이지씩 ≪ 이동 -->
						  	<c:if test="${pageDTO.prev }">
							    <li class="paginate_button page-item previous" style="margin-right:5px; margin-left:5px;">
							    <a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
								    <i class="bi bi-chevron-double-left"></i>
								    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
										<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									</svg> 
								</a></li>
							</c:if> 
							<c:if test="${!pageDTO.prev }">
							    <li class="paginate_button page-item previous disabled"	style="margin-right:5px; margin-left:5px;">
						    	<a class="page-link" href="/board/list?pageNum=${pageDTO.startPage-1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
							    	<i class="bi bi-chevron-double-left"></i>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
										<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
									</svg> 	
								</a></li>
							</c:if>    		
							<!-- 1페이지씩 < 이동 -->		
							<c:if test="${pageDTO.prev }">
								<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
									    <li class="paginate_button page-item previous" style="margin-right:5px; margin-left:5px;">
									    <a class="page-link" href="/board/list?pageNum=${num-1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
										    <i class="bi bi-chevron-left"></i>
										    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
												<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
											</svg>
										</a></li>
									</c:if>							
								</c:forEach> 	
							</c:if> 
							<c:if test="${!pageDTO.prev }">
							    <c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
										<c:choose>
											<c:when test="${num==1}">
												<li class="paginate_button page-item previous disabled" style="margin-right:5px; margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${num-1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
												    <i class="bi bi-chevron-left"></i>
												    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
													</svg>
												</a></li>
											</c:when>
											<c:otherwise>
											    <li class="paginate_button page-item previous" style="margin-right:5px; margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${num-1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
												    <i class="bi bi-chevron-left"></i>
												    <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
													</svg>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>													
								</c:forEach> 
							</c:if> 			
							<!-- 페이지 숫자 표기 -->	
							<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
								<c:if test="${pageDTO.cri.pageNum ==num }"> 
									<li class="paginate_button page-item active" style="margin-right:5px; margin-left:5px;">
									<a href="/board/list?pageNum=${num}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}" class="page-link">
									<b>${num}</b> </a></li>
								</c:if>
								<c:if test="${pageDTO.cri.pageNum !=num }">	
									<li class="paginate_button page-item" style="margin-right:5px; margin-left:5px;">
									<a href="/board/list?pageNum=${num}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}" class="page-link">
									${num} </a></li>
								</c:if>									
							</c:forEach>  				
							<!-- 1페이지씩 > 이동 -->
							<c:if test="${pageDTO.next }">	
								<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
									    <li class="paginate_button page-item previous" style="margin-right:5px; margin-left:5px;">									  
									    <a class="page-link" href="/board/list?pageNum=${num+1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
											<i class="bi bi-chevron-right"></i>
											<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
												<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
										    </svg>							
										</a></li>
									</c:if>							
								</c:forEach> 	
							</c:if> 
							<c:if test="${!pageDTO.next }">	
							    <c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
										<c:choose>
											<c:when test="${num==pageDTO.lastPage}">
												<li class="paginate_button page-item previous disabled" style="margin-right:5px; margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${num+1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
													<i class="bi bi-chevron-right"></i>
													<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
												    </svg>
												</a></li>
											</c:when>
											<c:otherwise>
											    <li class="paginate_button page-item previous" style="margin-right:5px; margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${num+1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
													<i class="bi bi-chevron-right"></i>
													<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
												    </svg>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>													
								</c:forEach> 
							</c:if> 					
							<!-- 10페이지씩 ≫ 이동 -->				
							<c:if test="${pageDTO.next }">					
								<li class="paginate_button page-item next" style="margin-right:5px; margin-left:5px; ">
								<a href="/board/list?pageNum=${pageDTO.endPage+1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}" class="page-link">
								   <i class="bi bi-chevron-double-right"></i>
								   <svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
									   <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
									   <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
								   </svg>  
							    </a></li>						
							</c:if>	
							<c:if test="${!pageDTO.next }">					
								<li class="paginate_button page-item next disabled" style="margin-right:5px; margin-left:5px;">
								<a href="/board/list?pageNum=${pageDTO.endPage+1}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}" class="page-link">
								   <i class="bi bi-chevron-double-right"></i>
								   <svg xmlns="http://www.w3.org/2000/svg" width="20"  fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
									   <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
									   <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
								   </svg>  
							   </a></li>						
							</c:if>
							<!-- 맨 뒤페이지 >ㅣ 이동 -->
							<c:if test="${pageDTO.next }">	
								<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
									    <li class="paginate_button page-item previous" style="margin-left:5px;">
									    <a class="page-link" href="/board/list?pageNum=${pageDTO.lastPage}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
											<i class="bi bi-chevron-bar-right"></i>
											<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-right" viewBox="0 0 16 16">
												<path fill-rule="evenodd" d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"/>
											</svg>						
										</a></li>
									</c:if>							
								</c:forEach> 	
							</c:if> 
							<c:if test="${!pageDTO.next }">	
							    <c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="num">					
									<c:if test="${pageDTO.cri.pageNum ==num }"> 
										<c:choose>
											<c:when test="${num==pageDTO.lastPage}">
												<li class="paginate_button page-item previous disabled" style="margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${pageDTO.lastPage}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
													<i class="bi bi-chevron-bar-right"></i>
													<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-right" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"/>
													</svg>	
												</a></li>
											</c:when>
											<c:otherwise>
											    <li class="paginate_button page-item previous" style="margin-left:5px;">
											    <a class="page-link" href="/board/list?pageNum=${pageDTO.lastPage}&amount=${pageDTO.cri.amount}&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}">
													<i class="bi bi-chevron-bar-right"></i>
													<svg xmlns="http://www.w3.org/2000/svg" width="20" fill="currentColor" class="bi bi-chevron-bar-right" viewBox="0 0 16 16">
														<path fill-rule="evenodd" d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"/>
													</svg>	
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:if>													
								</c:forEach> 
							</c:if> 
						</ul>
					</div>
				</div>
			</div>	
		</div>			
	</div>
	
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->	

<%@include file="../includes/footer.jsp"%>
<script>
	var bno="${bno}"; 										    //꼭 "" 안에 ${bno} 써줘야 그 값이 없을때 에러가 안뜸!!! 주의!!!
	console.log("읽어온 쓴글 번호 bno값 확인",bno);
	var modifybno="${modifybno}";
	console.log("수정한 글 번호 modifybno값 확인",modifybno);
	var removebno="${removebno}";
	console.log("삭제키 성공여부 removebno값 확인",removebno);
	
	//1. 뒤로가기로 왔는지 확인(history.state) 후, 경고창(alert) 출력여부 선택
	// -> history.replaceState가 수행된 곳은 null 값이 아니다.
	if(!history.state){   //(history.state==null)  
		//history.state가 null일때 경고창을 띄어야 된다.
		
		//경고창 출력 부분
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

		if(modifybno)
			alert(modifybno+"번 글이 수정되었습니다.");
		
		if(removebno){
			if(removebno==-1)
				alert("키값이 다릅니다.")
			else
				alert(removebno+"번 글이 삭제되었습니다.");
		}		
	};
	
	//2. 뒤로가기 확인을 위해 표시해 두기(history.replaceState( , , ))
	history.replaceState({},null,null);
	
	$("#amount").change(function(e){
					//on("click",function(e){       })
					//on("change",function(e){       })					
		var amount = $("#amount").val();
		
		location.href="/board/list?pageNum=${pageDTO.cri.pageNum}&amount="+amount+"&type=${pageDTO.cri.type}&keyword=${pageDTO.cri.keyword}";
	});
	
	
	
	/*
	$("#adminButton").on("click",function(e){
		//1. 버튼 이벤트(submit)금지
		e.preventDefault();
		//2. 입력창으로 값을 받고		
		var adminKey=prompt("관리자 모드를 위한 비밀번호를 입력해주세요.");
		if(adminKey){
			console.log(adminKey);
			//3. 그 내용도 같이 보내준다.
			$("#adminKey").val(adminKey);
			console.log($("#adminKey").val());
			$("#adminForm").submit();
			//removekey 값을 보내면 처리는 서버에서
		};
	});	
	
	function page(testId){
		  var startPage = testId;
		  var amount = $("#amount option:selected").val();
		  console.log("테스트중 현재 설정한 페이지 양 amount",amount);
		  
		  if(amount == 10){
			  var url="/board/list?pageNum="+startPage+"&amount="+amount;
		  }else if(amount == 25){
			  var url ="/board/list?pageNum="+startPage+"&amount="+amount;
		  }else if(amount == 50){
		      var url="/board/list?pageNum="+startPage+"&amount="+amount;		 
		  }else if(amount == 100){
		      var url="/board/list?pageNum="+startPage+"&amount="+amount;		 
		  };
		  
		  location.href = url;
	};
	*/	
	
</script>

