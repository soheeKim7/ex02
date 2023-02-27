<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="/board/list">목록 보기 가기</a> <br>
<a href="/board/register" method="post">등록 보러가기</a> <br>
<a href="/board/rank" method="post">순위 보러가기</a> <br>
<a href="/board/last" method="post">최근 작성글 보러가기</a> <br>


</body>
</html>
