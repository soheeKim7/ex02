<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright <a href="javascript:goAdminCheck();" >&copy;</a> Your Website 2020</span>
			<form action="/board/adminCheck" name="adminForm" method="post">
				<input type="hidden" name="adminKey" id="adminKey">
			</form>
		</div>
	</div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> 
	<i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">Ã</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap core JavaScript-->
<!-- jquery선언이 뒤에 있음! 그래서 쓰려면 이거 이후부터 써야함! -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>


<script>	
	function goAdminCheck() {
	    // name이 adminForm인 폼태그
	    var f = document.adminForm;
	    console.log("현재 폼에 adminKey 테스트 : ",f.adminKey.value);
	    
	    var adminKey=prompt("관리자 모드를 위한 비밀번호를 입력해주세요.");
		
	    if(adminKey){
			console.log(adminKey);
			f.adminKey.value = adminKey;
			console.log("폼에 받은 adminKey 넣어주고 테스트 : ",adminKey);
			f.submit();
		};	    	   
    };

</script>




</body>

</html>