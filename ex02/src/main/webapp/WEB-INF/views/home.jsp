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

<script>
		function sendPost(){
		alert('작동되는거니?');
	    let f = document.createElement('form');
        //폼태그로 감쌀 필요 없다.. 그냥 a태그 해도 됨..
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/user/logout');
	    document.body.appendChild(f);
	    f.submit();
	}
</script>
<a href="javascript:void(0)" onclick="javascript:sendPost()">로그아웃</a>

</body>
</html>
