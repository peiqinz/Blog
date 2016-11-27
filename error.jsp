<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>博客</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/mybs.css" />
<link rel="stylesheet" href="css/blog.css" />
<script type="text/javascript" src="js/jquery-2.2.4.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style>
.index-title {
	color: #333;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
}

.index-title:hover {
	color: #c00;
	text-decoration: none;
}

.index-title:active {
	color: #333;
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #e7ecef; font-family: '微软雅黑';">
<s:debug/>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="top.jsp"></jsp:include>
	<div style="height:100px"></div>
	<s:actionerror/>
	<s:fielderror></s:fielderror>
	<div style="height:600px"></div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>