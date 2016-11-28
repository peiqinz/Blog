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
	<body style="background-color: #e7ecef;font-family: '微软雅黑';">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<jsp:include page="top.jsp"></jsp:include>
		<nav class="nav navbar-default" style="margin-bottom: 15px;" role="navigation">
			<div class="container">
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
							<li class="active"><a href="index">首页</a></li>
							<s:if test="#session."></s:if>
							<s:if test="#session.loginuser.userphoto != null">
								<li><a href="user_findUserByUid">我的博客</a></li>
							</s:if>
					</ul>
				</div>
			</div>
		</nav>
			<div class="container">
				<div class="row">
					<div class="col-md-9">
			           <div class="list-group">
			           		<s:iterator var="s" value="#session.pageBean.list">
				           		<div class="row list-group-item" style="border: 0;">
					           		<div style="margin-left:20px;padding-top: 20px;width: 90px;height: 100px;float: left;display: block;">
						           		<div class="list-group-item-userInfo">
						           			<img src="<s:property value="#s.user.userphoto"/>" class="img-circle" style="width:60px;height: 60px;margin-top:10px" />
						           			<p style="margin-top: 10px;margin-left: 10px;">
						           				<span class="text-muted"><s:property value="#s.user.username"/></span>
						           			</p>
						           		</div>
					           		</div>
					           		<div style="margin-left:30px;width:700px;padding-bottom: 20px;padding-top: 20px;float: left;display: block;">
						           		<a href="${pageContext.request.contextPath }/post_viewActicle?pid=<s:property value='#s.pid'/>" class="index-title"><h5><s:property value="#s.title"/></h5></a>
						           		<p class="text-muted" style="font-size: 12px;">
											<s:property value="#s.summary"/>
						           		</p>
						           		<div style="height: 10px;"></div>
						           		<p class="text-muted">
						           			<span class="glyphicon glyphicon-th-list"></span>
						           			&nbsp;
						           			<small><s:property value="#s.category.cname"/></small>
						           			
											<small style="float: right;">
												<span style="display: inline;">
												<span class="glyphicon glyphicon-eye-open"></span>
												&nbsp;
												<span class="badge"><s:property value="#s.view"/></span>
											</small>
											<small style="float: right;margin-right: 20px;"><s:property value="#s.postDay"/></small>
						           		 </p>
						            	</div>
				         	  		</div>
			          		 	<div style="border: 1px dashed #ddd;"></div>
			           	</s:iterator>
			           	<div class="row list-group-item" style="border: 0;">
			           		<div style="margin-left:20px;padding-top: 20px;width: 90px;height: 100px;float: left;display: block;">
				           		<div class="list-group-item-userInfo">
				           			<img src="view/2.jpg" class="img-circle" style="width:60px;height: 60px;margin-top:10px" />
				           			<p style="margin-top: 10px;margin-left: 10px;">
				           				<span class="text-muted">Name</span>
				           			</p>
				           		</div>
			           		</div>
			           		<div style="margin-left:30px;width:700px;padding-bottom: 20px;padding-top: 20px;float: left;display: block;">
				           		<a href="#" class="index-title"><h5>Android NDK——使用Android Studio引用so库，jar包及module并使用JNI的正确姿势</h5></a>
				           		<p class="text-muted" style="font-size: 12px;">
									由于项目中需要用到JNI，以前虽然在Eclipse上使用过JNI和SO 文件，移植到Android Studio上的时候是花费好些力气的，所以主要把Android Studio下引用jar包、依赖其他...			           			
				           		</p>
				           		<div style="height: 10px;"></div>
				           		<p class="text-muted">
				           			<span class="glyphicon glyphicon-th-list"></span>
				           			&nbsp;
				           			<small>Android系统组件使用</small>
				           			&nbsp;&nbsp;&nbsp;&nbsp;
				           			<span class="glyphicon glyphicon-leaf"></span>
				           			&nbsp;
				           			<small>移动开发</small>
				           			
									<small style="float: right;">
										<span style="display: inline;">
										<span class="glyphicon glyphicon-eye-open"></span>
										&nbsp;
										<span class="badge">20</span>
									</small>
									<small style="float: right;margin-right: 20px;">发布时间:2015-1+1</small>
				           		</p>
				           	</div>
			           	</div>
			           </div>
			           <div class="foot-pagination">
			           	  <span class="text-muted" style="position:absolute;margin-left:20%;margin-top:30px;font-size: 10px;">第<s:property value="#session.pageBean.page"/>条，共<s:property value="#session.pageBean.totalPage"/>页</span>
				           <nav>
				           	<ul class="pagination" style="margin-left:33%;">
				           		<s:if test="#session.pageBean.page == 1">
					           		<li class="disabled"><a href="#">&laquo;</a></li>
					           		<li class="active"><a href="#">1</a></li>
				           		</s:if>
								<s:else>
					           		<li><a href="index.action?page=<s:property value='#session.pageBean.pageBean-1'/>">&laquo;</a></li>
					           		<li><a href="index.action?page=1">1</a></li>
								</s:else>		
				           		<li><a href="index.action?page=2">2</a></li>
				           		<li><a href="index.action?page=3">3</a></li>
				           		<li><a href="index.action?page=4">4</a></li>
				           		<li><a href="index.action?page=5">5</a></li>
				           		<li><a href="index.action?page=6">6</a></li>
				           		<li><a href="index.action?page=<s:property value='#session.pageBean.pageBean+1'/>">&raquo;</a></li>
				           		<li><a href="index.action?page=<s:property value='#session.pageBean.totalPage'/>">尾页</a></li>
				           	</ul>
				           </nav>
			           </div>
	     		   </div>
	     		   <div class="col-md-3">
	     		   	  <div class="panel-3">
	     		   	  	<img class="img-circle" src="view/3.jpg"></img>
	     		   	  	<p class="text-muted" style="margin-left: 110px;font-size: 15px;">
	     		   	  		<span>Name</span>
	     		   	  	</p>
						<span class="badge" style=" background-color:#FFFFFF;color:#FF8800;border: 1px solid #FF8800;margin-left: 100px;">签约作者</span>
	     		   		<p class="text-muted" style="margin:20px 20px;font-size:10px ;">
	     		   	  		<span>乌云安全中心高级Android工程师，长期从事安卓技术研发工作，擅长安卓应用架构设计和应用...</span>
	     		   	  	</p>
	     		   	  </div>
	     		   	  <div class="panel panel-default" style="margin-top:10px;background-color: #FFFFFF;">
	     		   	  	<div class="panel-heading expertpull"><a href="#" class="expertpulla">专家推文</a></div>
	     		   	  	<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<p style="padding-top:10px;">
	     		   	  			<span class="glyphicon glyphicon-phone" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;"></span>
								<span><a href="findPostByCid?cid=1&page=1" class="panelspana"><s:property value="#session.c1"/></a></span>
	     		   	  			<span class="glyphicon glyphicon-th" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;margin-left:85px;margin-right:5px"></span>
								<span><a href="findPostByCid?cid=2&page=1" class="panelspana"><s:property value="#session.c2"/></a></span>
	     		   	  		</p>
	     		   	  		<div style="border:1px dashed #DDDDDD;"></div>
	     		   	  		<p style="padding-top:10px;">
	     		   	  			<span class="glyphicon glyphicon-book" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;"></span>
								<span><a href="findPostByCid?cid=3&page=1" class="panelspana"><s:property value="#session.c3"/></a></span>
	     		   	  			<span class="glyphicon glyphicon-header" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;margin-left:85px;margin-right:5px"></span>
								<span><a href="findPostByCid?cid=4&page=1" class="panelspana"><s:property value="#session.c4"/></a></span>
	     		   	  		</p>
	     		   	  		<div style="border:1px dashed #DDDDDD;"></div>
	     		   	  		<p style="padding-top:10px;">
	     		   	  			<span class="glyphicon glyphicon-globe" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;"></span>
								<span><a href="findPostByCid?cid=5&page=1" class="panelspana"><s:property value="#session.c5"/></a></span>
	     		   	  			<span class="glyphicon glyphicon-print" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;margin-left:85px;margin-right:5px"></span>
								<span><a href="findPostByCid?cid=6&page=1" class="panelspana"><s:property value="#session.c6"/></a></span>
	     		   	  		</p>
	     		   	  		<div style="border:1px dashed #DDDDDD;"></div>
	     		   	  		<p style="padding-top:10px;">
	     		   	  			<span class="glyphicon glyphicon-calendar" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;"></span>
								<span><a href="findPostByCid?cid=7&page=1" class="panelspana"><s:property value="#session.c7"/></a></span>
	     		   	  			<span class="glyphicon glyphicon-cloud" style="margin:10px 0px;font-size: 28px;color:#FF8800;display: inline-block;margin-left:85px;margin-right:5px"></span>
								<span><a href="findPostByCid?cid=8&page=1" class="panelspana"><s:property value="#session.c8"/></a></span>
	     		   	  		</p>
	     		   	  		<div style="border:1px dashed #DDDDDD;"></div>
	     		   	  	</div>
	     		   	  </div>
	     		   	  <div class="panel panel-default" style="margin-top:10px;background-color: #FFFFFF;">
	     		   	  	<div class="panel-heading expertpull">
	     		   	  		<a href="#" class="expertpulla">最新专家</a>
	     		   	  	</div>
	     		   	  	<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<ul class="media-list">
	     		   	  			<li class="media">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="view/2.jpg" class="img-circle" style="width:60px;height: 60px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a">郑培钦</a></h3>
	     		   	  					<span class="media-body-a-span">本人目前在北京邮电大学攻读硕士研究生，研二在读。在日常的学习和科研项目中，善于思考和总结问...</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  			<div style="border: 1px dashed #DDDDDD;margin-top: 18px;margin-bottom: -17px;"></div>
	     		   	  			<li class="media">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="view/2.jpg" class="img-circle" style="width:60px;height: 60px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a" style="">郑培钦</a></h3>
	     		   	  					<span class="media-body-a-span">本人目前在北京邮电大学攻读硕士研究生，研二在读。在日常的学习和科研项目中，善于思考和总结问...</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  		</ul>
	     		   	  	</div>
	     		   	  </div>
	     		   	  <div class="panel panel-default" style="margin-top:10px;background-color: #FFFFFF;">
	     		   	  	<div class="panel-heading expertpull">
	     		   	  		<a class="expertpulla" href="#">热门排行榜</a>
	     		   	  	</div>
	     		   	  	<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<s:iterator var= "s" value="#session.hot">
		     		   	  		<p style="margin-top:15px;margin-bottom: 15px;">
		     		   	  			<a href="${pageContext.request.contextPath }/post_viewActicle?pid=<s:property value='#s.pid'/>" class="hota">
		     		   	  			<span class="glyphicon glyphicon-chevron-right" style="font-size:10px;"></span>
		     		   	  			<s:property value="#s.title"/></a>
		     		   	  		</p>
	     		   	  		</s:iterator>
	     		   	  	</div>
	     		   	  </div>
	     		   	  <div class="panel panel-default" style="margin-top:10px;background-color:#FFFFFF;">
	     		   	  	<div class="panel-heading expertpull">
	     		   	  		<a class="expertpulla" href="#">联系我们</a>
	     		   	  	</div>
	     		   	  	<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<p style="margin-top:15px;margin-bottom: 15px;;">
	     		   	  			<a href="#" class="contactwhitus" >
	     		   	  			首页投稿</a>
	     		   	  		</p>
	     		   	  		<p style="margin-top:15px;margin-bottom: 15px;">
	     		   	  			<a href="#" class="contactwhitus">官方博客</a>
	     		   	  		</p>
	     		   	  	</div>
	     		   </div>
	     		   	  </div>
	     		   	  
				</div>
			</div>
			<div style="height:33px;"></div>
			<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>