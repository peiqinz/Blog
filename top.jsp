<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>博客</title>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/mybs.css" />
		<link rel="stylesheet" href="css/blog.css" />
		<script type="text/javascript" src="js/jquery-2.2.4.js" ></script>
		<script type="text/javascript" src="js/bootstrap.js" ></script>
		<style>
			.index-title{
				color: #333;
				text-decoration: none;
				font-size: 16px;
				font-weight: bold;
				
			}
			.index-title:hover{
				color:#c00;
				text-decoration: none;
			}
			.index-title:active{
				color: #333;
				text-decoration: none;
			}
		</style>
	</head>
	<nav class="nav navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">博客</a>
					<button class="navbar-toggle" data-toggle="collapse" data-target="">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="ss">
					<s:if test="#session.loginuser == null">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
							<li style="margin-top:15px ;">|</li>
							<li><a href="${pageContext.request.contextPath }/regist.jsp">注册</a></li>
						</ul>
					</s:if>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-pencil"></span></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-bell"></span>
							</a>
							<ul class="bs-menu dropdown-menu">
								<li><a href=""><img src="view/1.jpg">小编疯了，竟然说PHP是世界上最好的语言</a></li>
								<li><a><span class="divider"></span></a></li>
								<li><a href=""><img src="view/1.jpg">小编疯了，竟然说PHP是世界上最好的语言</a></li>
								<li><a><span class="divider"></span></a></li>
								<li><a href=""><img src="view/1.jpg">小编疯了，竟然说PHP是世界上最好的语言</a></li>
								<li><a><span class="divider"></span></a></li>
								<li><a href=""><img src="view/1.jpg">小编疯了，竟然说PHP是世界上最好的语言</a></li>
								<li><a><span class="divider"></span></a></li>
								<li><a href=""><img src="view/1.jpg">小编疯了，竟然说PHP是世界上最好的语言</a></li>
								<li><a><span class="divider"></span></a></li>
							</ul>
						</li>
						<s:if test="#session.loginuser != null">
							<li class="dropdown">
								<a id="testa" href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img alt="" src="<s:if test="#session.loginuser.userphoto != null">
														<s:property value="#session.loginuser.userphoto"/>
													 </s:if>
													 <s:else>
													 	img/blog.png
													 </s:else>
													 " style="width:20px;height:20px;">
								</a>
								<ul class="bs-menu dropdown-menu">
									<li><a><s:property value="#session.loginuser.username"/></a>
									<li><a href="user_findUserByUid">我的信息</a></li>
									<li><a href="#">我的帖子</a></li>
									<li class="divider"></li>
									<li><a href="#">账号设置</a></li>
								</ul>
							</li>
						</s:if>
					</ul>
				</div>
			</div>
		</nav>

</html>