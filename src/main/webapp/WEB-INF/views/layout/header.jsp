<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- Main Quill library -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nav-item {
		font-size: 20px;
		font-weight:700;
	}
</style>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="/list">홈</a></li>
				<li class="nav-item active"><a class="nav-link" href="/saveForm">글쓰기</a></li>
			</ul>
		</nav>
	</header>
	<br />