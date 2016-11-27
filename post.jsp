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
<script type="text/javascript" src="utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="utf8-jsp/ueditor.all.js"></script>

<style>
.post {
	margin: 20px 0px;
	background-color: #FFFFFF;
	padding: 10px 10px;
	width: 100%;
	border-radius: 2px;
	border: 1px dashed #DDDDDD;
}
</style>

<script type="text/javascript">
	$(".righttabs-1").hide();
</script>
</head>
<body
	style="background-color: #e7ecef; font-size: 12px; font-family: microsoft yahei, Arial, Console, Verdana, Courier New">
	<jsp:include page="sidebar.jsp"></jsp:include>
	<jsp:include page="top.jsp"></jsp:include>
	<nav class="nav navbar-default" style="margin-bottom: 15px;"
		role="navigation">
		<div class="container">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页</a></li>
					<li><a href="#">博客专栏</a></li>
					<li><a href="#">我的博客</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="post">
					<div
						style="margin-top: 20px; margin-left: 10px; margin-bottom: 55px;">
						<span
							style="font-size: 16px; margin-top: 10px; margin-left: 10px; border-bottom: 2px solid #c88326; padding-bottom: 10px;">发帖</span>
						<div
							style="border: 1px dashed #DDDDDD; margin-top: 10px; margin-bottom: 20px;"></div>
						<div class="input-group"
							style="margin-left: 5px; margin-bottom: 2px;">
							<span class="input-group-addon">标题</span> <input type="text"
								class="form-control" name="title" placeholder="请列出标题">
						</div>
						<div style="margin-left: 5px;">

							<script id="editor" type="text/plain">
		     		   	  			 
		     		   	  		</script>

						</div>
						<div class="category-select">
							<div class="text-muted"
								style="margin-top: 10px; margin-left: 10px; font-size: 13px;">
								文章分类</div>
							<div
								style="font-size: 15px; margin-left: 10px; margin-top: 10px;">
								<s:iterator var="c" value="categories">
									<input type="radio" name="cid"
										value="<s:property value="#c.cid"/>"></input>
									<span style="margin-right: 25px;"><s:property
											value="#c.cname" /></span>
								</s:iterator>
							</div>
						</div>
						<button type="button" id="form" class="btn btn-primary"
							style="margin-top: 15px; float: right;">提交</button>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(".righttabs-1").hide();
	</script>
	<script type="text/javascript">
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;

		UE.getEditor('editor', {
			//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
			//toolbars:[['FullScreen','simpleupload','Source', 'Undo', 'Redo','Bold','test']],
			//focus时自动清空初始化时的内容
			autoClearinitialContent : true,
			//关闭字数统计
			wordCount : false,
			//关闭elementPath
			elementPathEnabled : false,
			//默认的编辑区域高度
			initialFrameHeight : 600
		//更多其他参数，请参考ueditor.config.js中的配置项
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$("#form")
					.click(
							function() {
								var title = $(":input[name=title]").val();
								var cid = $(":input[name=cid]:checked").val();
								//对编辑器的操作最好在编辑器ready之后再做
								var neirong = UE.getEditor('editor')
										.getContent();
								var txt = UE.getEditor('editor')
										.getContentTxt();
								var summary = txt.substr(0, 100) + "..";
								var url = "${pageContext.request.contextPath }/post_postActicle.action";
								var args = {
									"title" : title,
									"neirong" : neirong,
									"summary" : summary,
									"cid" : cid
								};
								$.post(url, args);
							});
		});
	</script>
</body>
</html>
