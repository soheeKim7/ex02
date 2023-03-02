<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%-- <html lang="en"> --%>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>게시판</title>

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">   <!-- div 짤림 -->

		<!-- Sidebar -->
		<ul	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a	class="sidebar-brand d-flex align-items-center justify-content-center"	href="/board/list">
				<div class="sidebar-brand-icon rotate-n-15">					
					<i class="bi bi-emoji-kiss"></i>
					<svg xmlns="http://www.w3.org/2000/svg" width="50" fill="currentColor" class="bi bi-emoji-kiss" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M12.493 13.368a7 7 0 1 1 2.489-4.858c.344.033.68.147.975.328a8 8 0 1 0-2.654 5.152 8.58 8.58 0 0 1-.81-.622Zm-3.731-3.22a13 13 0 0 0-1.107.318.5.5 0 1 1-.31-.95c.38-.125.802-.254 1.192-.343.37-.086.78-.153 1.103-.108.16.022.394.085.561.286.188.226.187.497.131.705a1.892 1.892 0 0 1-.31.593c-.077.107-.168.22-.275.343.107.124.199.24.276.347.142.197.256.397.31.595.055.208.056.479-.132.706-.168.2-.404.262-.563.284-.323.043-.733-.027-1.102-.113a14.87 14.87 0 0 1-1.191-.345.5.5 0 1 1 .31-.95c.371.12.761.24 1.109.321.176.041.325.069.446.084a5.609 5.609 0 0 0-.502-.584.5.5 0 0 1 .002-.695 5.52 5.52 0 0 0 .5-.577 4.465 4.465 0 0 0-.448.082Zm.766-.087-.003-.001-.003-.001c.004 0 .006.002.006.002Zm.002 1.867-.006.001a.038.038 0 0 1 .006-.002ZM6 8c.552 0 1-.672 1-1.5S6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8Zm2.757-.563a.5.5 0 0 0 .68-.194.934.934 0 0 1 .813-.493c.339 0 .645.19.813.493a.5.5 0 0 0 .874-.486A1.934 1.934 0 0 0 10.25 5.75c-.73 0-1.356.412-1.687 1.007a.5.5 0 0 0 .194.68ZM14 9.828c1.11-1.14 3.884.856 0 3.422-3.884-2.566-1.11-4.562 0-3.421Z"/>
					</svg>
				</div>
				<div class="sidebar-brand-text mx-3">
					My Board <sup>SoHee</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
				<a class="nav-link" href="/board/list">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>게시글 목록</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-cog"></i> 
					<span>Components</span>
				</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"	data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> 
						<a class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"	aria-expanded="true" aria-controls="collapseUtilities"> 
				<i class="fas fa-fw fa-wrench"></i> 
				<span>Utilities</span>
			</a>
				<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a>
						<a class="collapse-item" href="utilities-border.html">Borders</a>
						<a class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> 
					<i class="fas fa-fw fa-folder"></i> 
					<span>Pages</span>
				</a>
				<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a>
						<a class="collapse-item" href="register.html">Register</a>
						<a class="collapse-item" href="forgot-password.html">Forgot	Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a>
						<a class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Charts -->
			<li class="nav-item">
				<a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> 
					<span>Charts</span>	
				</a>
			</li>

			<!-- Nav Item - Tables -->
			<li class="nav-item active">
				<a class="nav-link" href="tables.html"> 
					<i class="fas fa-fw fa-table"></i> 
					<span>Tables</span> 
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">   <!-- div 짤림 -->

			<!-- Main Content -->
			<div id="content">    <!-- div 짤림 -->

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<form action="/board/list" method="get"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">			
							<select class="form-control bg-light border-0 small" id="searchSelect" name="type">																			
								<option	value="T" <c:if test='${pageDTO.cri.type=="T" }'>selected</c:if>>제목</option>
								<option	value="C" <c:if test='${pageDTO.cri.type=="C" }'>selected</c:if>>내용</option>
								<option	value="W" <c:if test='${pageDTO.cri.type=="W" }'>selected</c:if>>작성자</option>
								<option	value="TC" <c:if test='${pageDTO.cri.type=="TC" }'>selected</c:if>>제목or내용</option>
								<option	value="TW" <c:if test='${pageDTO.cri.type=="TW" }'>selected</c:if>>제목or작성자</option>
								<option	value="CW" <c:if test='${pageDTO.cri.type=="CW" }'>selected</c:if>>내용or작성자</option>
								<option	value="TCW" <c:if test='${pageDTO.cri.type=="TCW" }'>selected</c:if>>제목or내용or작성자</option>						
							</select> 				
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="검색어를 입력해주세요." name="keyword" value="${pageDTO.cri.keyword }" >
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none">
							<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-search fa-fw"></i> 
							</a> 
							
							<!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-bell fa-fw"></i> 
								<!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
							</a> 
						<!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is ready to download!</span>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> 
								<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
							</div>
						</li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1">
							<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> 
								<span class="badge badge-danger badge-counter">7</span>
							</a> 
							<!-- Dropdown - Messages -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"	src="/resources/img/undraw_profile_1.svg" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler Â· 58m</div>
									</div>
								</a>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="/resources/img/undraw_profile_2.svg" alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun Â· 1d</div>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"	src="/resources/img/undraw_profile_3.svg" alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
										<div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
									</div>
								</a> 
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"	src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all	dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog Â· 2w</div>
									</div>
								</a> 
								<a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
							</div>
						</li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span> 
								<img class="img-profile rounded-circle"	src="/resources/img/undraw_profile.svg">
							</a> 
							<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 
									Profile
								</a> 
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> 
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div>
						</li>
					</ul>

				</nav>
				<!-- End of Topbar -->