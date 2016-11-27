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
		<script type="text/javascript" src="ckeditor-4.5.11/ckeditor.js"></script>
		<style>
			.interact{
				background-color: #999;
			    background-repeat: no-repeat;
			    display: inline-block;
			    margin-left: 6px;
			    width: 75px;
			    height: 25px;
			    line-height: 25px;
			    color: #fff !important;
			    text-align: center;
			    padding-left: 18px;
			    text-decoration: none;
			    background-image:url(img/skin-email.png) ;
			    background-position: 10px center;
			    border-radius: 3px;
			}
			.interact:hover{
				text-decoration: none;
			}
			.readrank{
				color:#c88326;
				width:180px;
				text-overflow: ellipsis;
				overflow: hidden;
				display: inline-block;
				height:35px;
				white-space: nowrap;
			}
			.readrank:hover{
				text-decoration: none;
				color:#e63;
			}
			.readrank:active{
				text-decoration: none;
				color:#c88326;
			}
			.acticle-container{
				display: block;
				width:100%;
				background-color: #FFFFFF;
				height: auto;
				border-radius: 2px;
				border: 1px dashed #DDDDDD;
			}
			.acticle-title{
				
			}
			.acticle-title a{
				 font-size:18px;
				 text-decoration: none;
				 color: #000000;
				 
			}
			.acticle-title a:hover{
				text-decoration: none;
				color: #e63;
			}
			.acticle-title a:active{
				text-decoration: none;
				color: #000000;
			}
			.acticle-content{
				padding:0px 35px;
				margin-top: 20px;
			}
			.acticle-category{
				width: 100%;
				background-color: #ededed;
				padding: 5px 20px;
				margin-top:40px;
				margin-bottom:20px;
			}
			.acticle-reply{
				margin:20px 0px;
				background-color: #FFFFFF;
				padding: 10px 10px;
				width: 100%;
				border-radius: 2px;
				border:1px dashed #DDDDDD;
			}
			.view-reply{
				margin:10px 5px;
			}
		</style>
	</head>
	<body style="background: url(img/body_bg.jpg) repeat center top;font-size: 12px;font-family:microsoft yahei,Arial,Console,Verdana,Courier New">
		<s:debug></s:debug>
		<jsp:include page="sidebar.jsp"></jsp:include>
		<jsp:include page="top.jsp"></jsp:include>
		<div class="container">
			<h2 style="color: #FFFFFF;font-weight: 200;margin-top:50px;margin-left: 80px;">Name的专栏</h2>
			<h5 style="color:#FF9900;margin-left: 80px;">个人介绍：大家好我是Name，请大家多多支持！</h5>
			<div class="row">
				<div class="col-md-3" style="margin-top:100px">
					<div class="panel-3">
						<ul style="margin-left:-30px;margin-top:5px;font-size:12px;margin-bottom: 5px;">个人资料</ul>
						<div style="border: 1px dashed #DDDDDD;"></div>
	     		   	  	<img src="view/3.jpg" style="margin-top:20px;width:150px;height: 150px;text-align: center;margin-left: 60px;"></img>
	     		   	  	<p class="text-muted" style="margin-left: 110px;font-size: 15px;">
	     		   	  		<span>Name</span>
	     		   	  	</p>
	     		   	  	<div style="display: inline-block;width: 100%;text-align: center;margin-top:8px;padding-bottom: 15px;margin-bottom: 7px;;">
	     		   	  		<a href="#" class="interact">发邮件</a>
	     		   	  		<a href="#" class="interact" style="background-image: url(img/skin-attent.png);margin-top:10px;">加关注</a>
	     		   	  	</div>
	     		   	  	<img src="img/bokezhuanjiamiddle.png" style="margin-top:0px;margin-left:110px;width:40px;height: 40px;"/>
	     		   	  	<div style="border: 1px dashed #ccc;"></div>
	     		   	  	<div style="display: block;word-break: break-all;margin-top: 4px; padding: 0px 4px 4px 0;text-align: left;">
	     		   	  		<a href="#" style="margin-left:15px;font-size:12px;margin-right: 10px;width: 21px;height: 24px;"><img src="img/zhuanlandaren.png" style="margin:10px 0px;margin-left: 6px;cursor: pointer;width: 21px;height: 24px;" /></a>
	     		   	  		<a href="#" style="font-size:12px;margin-right: 10px;width: 21px;height: 24px;"><img src="img/chizhiyiheng.png" style="margin:10px 0px;margin-left: 6px;cursor: pointer;width: 21px;height: 24px;"/></a>
	     		   	  	</div>
	     		   	  	<div style="display: block;padding:0px 5px;margin-left: 15px;margin-bottom:15px;">
	     		   	  		<li style="list-style-type:none"><span>访问：&nbsp;2000次</span></li>
							<li style="list-style-type:none;margin-top: 10px;"><span>积分：&nbsp;4000</span></li>
							<li style="list-style-type:none;margin-top: 10px;"><span>等级：&nbsp;14</span></li>
							<li style="list-style-type:none;margin-top: 10px;"><span>排行：&nbsp;2343</span></li>
	     		   	  	</div>
	     		   	  	<div style="border: 1px dashed #CCCCCC;"></div>
	     		   	  	<div style="display: block;padding:0px 5px;margin-left: 12px;margin-top:15px;margin-bottom: 15px;">
	     		   	  		<li style="list-style-type:none;display: inline;"><span>原创：&nbsp;151篇</span></li>
							<li style="position:absolute;left:150px;list-style-type:none;display: inline;"><span style="">转载：&nbsp;5篇</span></li>
							<div></div>
							<li style="list-style-type:none;margin-top: 10px;display: inline-block;"><span>翻译：&nbsp;0篇</span></li>
							<li style="list-style-type:none;position:absolute;left:150px;margin-top: 10px;display: inline;"><span>评论：&nbsp;199条</span></li>
	     		   	  	</div>
	     		   </div>
	     		   <div class="panel panel-default" style="margin-top: 20px;">
						<ul style="margin-left:-30px;margin-top:5px;font-size:12px;margin-bottom: 5px;">博客专栏</ul>
						<div style="border: 1px dashed #DDDDDD;"></div>
						<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<ul class="media-list">
	     		   	  			<li class="media" style="margin-top:-5px;margin-bottom: -5px;">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="view/2.jpg" style="border: 1px solid #DDDDDD;width:77px;height: 82px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a" style="color: #c88326;">Java</a></h3>
										<div style="margin-top: 12px;"></div>
	     		   	  					<span>文章：5篇</span>
	     		   	  					<div style="margin-top: 12px;"></div>
	     		   	  					<span>评论：188次篇</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  			<li class="media" style="margin-top:-5px;margin-bottom: -5px;">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="img/java.jpg" style="border: 1px solid #DDDDDD;width:77px;height: 82px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a" style="color: #c88326;">Java</a></h3>
										<div style="margin-top: 12px;"></div>
	     		   	  					<span>文章：5篇</span>
	     		   	  					<div style="margin-top: 12px;"></div>
	     		   	  					<span>评论：188次篇</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  			<li class="media" style="margin-top:-5px;margin-bottom: -5px;">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="view/2.jpg" style="border: 1px solid #DDDDDD;width:77px;height: 82px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a" style="color: #c88326;">Java</a></h3>
										<div style="margin-top: 12px;"></div>
	     		   	  					<span>文章：5篇</span>
	     		   	  					<div style="margin-top: 12px;"></div>
	     		   	  					<span>评论：188次篇</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  			<li class="media" style="margin-top:-5px;margin-bottom: -5px;">
	     		   	  				<a class="media-left" href="#">
	     		   	  					<img src="img/android-category.jpg" style="border: 1px solid #DDDDDD;width:77px;height: 82px;margin-top:25px;"/>
	     		   	  				</a>
	     		   	  				<div class="media-body">
										<h3><a href="#" class="media-body-a" style="color: #c88326;">Java</a></h3>
										<div style="margin-top: 12px;"></div>
	     		   	  					<span>文章：5篇</span>
	     		   	  					<div style="margin-top: 12px;"></div>
	     		   	  					<span>评论：188次篇</span>
	     		   	  				</div>
	     		   	  			</li>
	     		   	  		</ul>
	     		   	    </div>
					</div>
					<div class="panel panel-default" style="margin-top:10px;background-color: #FFFFFF;">
	     		   	  	<ul style="margin-left:-30px;margin-top:5px;font-size:12px;margin-bottom: 5px;">阅读排行</ul>
						<div style="border: 1px dashed #DDDDDD;"></div>
	     		   	  	<div class="panel-body" style="padding-bottom: 0px;padding-top: 0px;">
	     		   	  		<p style="margin-top:15px;margin-bottom: -15px;width:100%;">
	     		   	  			<a href="#" class="readrank"> 
	     		   	  				Android源码浅析（一）——VMware Workstation Pro和Ubuntu Kylin 16.04 LTS安装配置</a>
	     		   	  			<span style="display: inline-block;height: 14px;float: right;">(25515)</span>
	     		   	  		</p>
	     		   	  		<p style="width:100%;margin-bottom: -15px;text-decoration: none;">
	     		   	  			<a href="#" class="readrank"> 
	     		   	  				Android源码浅析（一）——VMware Workstation Pro和Ubuntu Kylin 16.04 LTS安装配置</a>
	     		   	  			<span style="display: inline-block;height: 14px;float: right;">(25515)</span>
	     		   	  		</p>
	     		   	  		<p style="width:100%;margin-bottom: -15px;text-decoration: none;">
	     		   	  			<a href="#" class="readrank"> 
	     		   	  				Android源码浅析（一）——VMware Workstation Pro和Ubuntu Kylin 16.04 LTS安装配置</a>
	     		   	  			<span style="display: inline-block;height: 14px;float: right;">(25515)</span>
	     		   	  		</p>
	     		   	  		<p style="width:100%;margin-bottom: -15px;text-decoration: none;">
	     		   	  			<a href="#" class="readrank"> 
	     		   	  				Android源码浅析（一）——VMware Workstation Pro和Ubuntu Kylin 16.04 LTS安装配置</a>
	     		   	  			<span style="display: inline-block;height: 14px;float: right;">(25515)</span>
	     		   	  		</p>
	     		   	  		<p style="width:100%;margin-bottom: -15px;text-decoration: none;">
	     		   	  			<a href="#" class="readrank"> 
	     		   	  				Android源码浅析（一）——VMware Workstation Pro和Ubuntu Kylin 16.04 LTS安装配置</a>
	     		   	  			<span style="display: inline-block;height: 14px;float: right;">(25515)</span>
	     		   	  		</p>
	     		   	  	</div>
	     		    </div>
				</div>
				<div class="col-md-9" style="margin-top:100px">
					<div class="acticle-container">
						<div class="acticle-title">
							<h1>
								<span style="background-image:url(img/skin-type-icon.png);background-position: 0px 0;background-repeat: no-repeat;display: inline-block;width:19px;height: 19px;margin-left: 19px;"></span>
								<a href="#">
							        <s:property value="#session.post.title"/>
								</a>
							</h1>
							<div style="margin-top: 20px;">
								<span class="text-muted" style="margin-left: 20px;">标签：
									<a href="#" style="font-size: 12px;color:#c88326;margin-right:10px;">Android</a>
									<a href="#" style="font-size: 12px;color:#c88326;margin-right: 10px;">ubuntu</a>
									<a href="#" style="font-size: 12px;color:#c88326;margin-right: 10px;">源码</a>
									<a href="#" style="font-size: 12px;color:#c88326;margin-right: 10px;">Android</a>
								</span>
							</div>
							<div style="display:block;float: right;margin-bottom: 10px;height: 100px;margin-top: 15px;">
								<span class="text-muted" style="margin-right: 20px;"><s:property value="#session.post.postDay"/></span>
								<span class="glyphicon glyphicon-eye-open" style="margin-left: 1px;"></span>
								<span class="text-muted" style="margin-right: 10px;"><s:property value="#session.post.view"/>人阅读</span>
								<a href="#" class="text-muted" style="font-size:12px;color:#c88326;margin-left: 10px;margin-right: 30px;"><span class="glyphicon glyphicon-comment" style="margin-right: 5px;"></span>评论</a>
							</div>
						</div>
						<div class="acticle-category">
								<span class="glyphicon glyphicon-th-list" style="font-size:14px;line-height: 28px;"></span>
								<span style="font-size:14px;text-decoration: none;color:#333;line-height: 28px;">分类&nbsp;:&nbsp;<a href="#" style="font-size:14px;text-decoration: none;color:#df3434;line-height: 28px;" ><s:property value="#session.post.category.cname"/></a></span>
						</div>
						<div class="acticle-content">
							<s:property value="#session.post.neirong" escape="false"/>
						</div>
					</div>
					<div class="acticle-reply">
						<div class="view-reply">
							<span style="font-size:16px;margin-top:10px;margin-left: 10px;border-bottom: 2px solid #c88326;padding-bottom: 10px;">查看评论</span>
							<div style="border: 1px dashed #DDDDDD;margin-top:10px"></div>
							<ul class="media-list">
								<s:iterator value="#session.replies" var="s">
		     		   	  			<li class="media" style="margin-left: 10px;margin-top:-5px">
		     		   	  				<a class="media-left" href="#">
		     		   	  					<img src="
		     		   	  					<s:if test="#s.user.userphoto != null">
		     		   	  						<s:property value="#s.user.userphoto"/>	
		     		   	  					</s:if>
		     		   	  					<s:else>
		     		   	  						${pageContext.request.contextPath }/img/blog.png
		     		   	  					</s:else>
		     		   	  				" style="border: 1px solid #DDDDDD;width:50px;height: 50px;margin-top:25px;"/>
		     		   	  				</a>
		     		   	  				<div class="media-body">
											<h3><a href="#" class="media-body-a" style="color: #c88326;"><s:property value="#s.user.username"/></a></h3>
											<div style="margin-top: 1px;"></div>
		     		   	  					<span><s:property value="#s.neirong"/></span>
		     		   	  				</div>
		     		   	  			</li>
		     		   	  			<div style="border: 1px dashed #DDDDDD;margin-top: 20px;"></div>
	     		   	  			</s:iterator>
	     		   	  		</ul>
	     		   	  		<div style="margin-top: 30px;"></div>
	     		   	  		<span style="font-size:16px;margin-top:110px;margin-left: 10px;border-bottom: 2px solid #c88326;padding-bottom: 10px;">回复评论</span>
	     		   	  		<div style="border: 1px dashed #DDDDDD;margin-top:10px;margin-bottom: 20px;"></div>
	     		   	  		<div style="margin-top: 20px;margin-left: 10px;margin-bottom: 55px;">
		     		   	  		<form id="replyform" action="${pageContext.request.contextPath }/reply_saveReply">
	     		   	  			 <input type="hidden" value="<s:property value="pid"/>" name="pid"/> 
		     		   	  			 <div id="neirong">
			     		   	  			 <div name="context">
			     		   	  			 
			     		   	  			 </div>
			     		   	  		 </div>
		     		   	  		    <button type="button" id="replybutton" class="btn btn-primary" style="margin-top: 15px;float:right;">
								      提交 
								    </button>
							    </form>
	     		   	  		</div>
	     		   	  		<script type="text/javascript">
		     		   	  		var editor = CKEDITOR.replace('context');</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
		<script>
			$(function(){
				$("#replybutton").click(function(){
					var stem = editor.document.getBody().getText();
					var neirong = stem;
					$("#neirong").after("<input name='neirong' type='hidden' value='"+neirong+"'/>");
					$("#replyform").submit();
				});
			});
		</script>
	</body>
</html>