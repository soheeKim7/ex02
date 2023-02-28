<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
히스토리 테스트 <Br>
<script >				
	console.log("히스토리 상태값",history.state); //replaceState() 미사용시 url


						//state(상태),title(사용X), url
//	history.replaceState( {} , null , "abc");
	history.replaceState( {} , null , null);
</script>
</body>
</html>