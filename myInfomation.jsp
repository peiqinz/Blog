<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
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
		<script type="text/javascript" src="date/jedate/jedate.js"></script>
		<style>
			.img-a{
				    color: #333;
				    display: block;
				    width: 70px;
				    text-align: center;
				    line-height: 14px;
				    float: left;
			}
			.img-div{
				    margin: 0;
				    padding: 0;
				    line-height: normal;
				    font-family: 'Microsoft YaHei';
				    width: 72px;
				    height: 32px;
				    border-right: 1px solid #f0f0f0;
				    float: left;
				    font-size: 14px;
				    color: #999;
				    text-align: center;
				    overflow: hidden;
				    display: block;
				    display: inline-block;
			}
			.infomation{
				color:#e9733a;
				margin-left:20px;
				margin-right: 20px;
			}
			.introduce{
				margin: 20px 25px;
				
			}
		</style>
		<script type="text/javascript">
		$(function(){
			$("#changepassword1").click(function(){
				var np = $(":input[name=newpassword]").val();
				var rnp = $(":input[name=renewpassword]").val();
				if(np == rnp){
					alert("ss");
					$("formchangepassword").submit();
				}else{
					alert(np);
					alert(rnp);
					alert("两次密码不一致");
					return false;
				}
			});
		});
		</script>
	</head>
	<body style="font-family: '微软雅黑';">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<jsp:include page="top.jsp"></jsp:include>
		<nav class="nav navbar-default" style="margin-bottom: 15px;" role="navigation">
			<div class="container">
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li ><a href="index">首页</a></li>
						<li class="active"><a href="user_findUserByUid">我的博客</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<div style="margin:10px 0px;width:100%;border: 1px solid #DDDDDD;background-color: #FFFFFF;border-radius: 2ox;">
							<div class="row">
								<div style="padding: 20px 40px;">
									<dl id="" style="display: inline-block;float:left;width: 150px;height: 200px;">
										<img src="${userphoto }" style="width: 150px;height: 150px;margin-bottom: 10px;"/>
										<dd class="img-div">
											<b class="img-a">0</b>
											<a href="#" class="text-muted">关注</a>	
										</dd>
										<dd class="img-div">
											<b class="img-a">0</b>
											<a href="#" class="text-muted">粉丝</a>
										</dd>
									</dl>
									<div style="display: block;float:left;width: 900px;margin-top: 10px;">
										<div style="">
											<span style="font-size: 20px;margin-left: 30px;"><s:property value='username'/></span>	
										</div>
										<div style="margin-top: 20px;margin-left: 15px;">
											<s:if test="industry == null">
												<span class="infomation">未选择行业</span>
											</s:if>
											<s:else>
												<span class="infomation">${industry }</span>
											</s:else>											
											<span class="text-muted">|</span>
											<s:if test="job == null">
												<span class="infomation">未填写职业</span>
											</s:if>
											<s:else>
												<span class="infomation">${job }</span>
											</s:else>
											<span class="text-muted">|</span>
											<s:if test="name == null">
												<span class="infomation">未填写名字</span>
											</s:if>
											<s:else>
												<span class="infomation">${name }</span>
											</s:else>
											<span class="text-muted">|</span>
											<s:if test="country == null">
												<span class="infomation">未填写国家</span>
											</s:if>
											<s:else>
												<span class="infomation">${country }</span>
											</s:else>
											<span class="text-muted">|</span>
											<s:if test="sex == null">
												<span class="infomation">未选择性别</span>
											</s:if>
											<s:else>
												<span class="infomation">
												<s:if test="sex == 1">
													男
												</s:if>
												<s:else>
													女
												</s:else>
												</span>
											</s:else>
											<span class="text-muted">|</span>
											<s:if test="birthday == null">
												<span class="infomation">未选择生日</span>
											</s:if>
											<s:else>
												<span class="infomation">${birthday }</span>
											</s:else>
										</div>
										<div style="border: 0.5px solid #f0f0f0;margin-left: 25px;margin-top: 10px;margin-bottom: 10px;"></div>
										<div class="introduce">
											<span class="text-muted">发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反发反反复复发反反复复发反反复复发反反复复发反反复复发反反复复发反反复复发反反复复发反反复复</span>
										</div>
									</div>
								</div>
								
							</div>
					</div>
					<div style="margin:10px 0px;width:100%;border: 1px solid #DDDDDD;background-color: #FFFFFF;border-radius: 2ox;padding: 20px 20px;">
						<ul class="nav nav-tabs" role="tablist">
						  <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">我的信息</a></li>
						  <li role="presentation"><a href="#myfiles" role="tab" data-toggle="tab">我的文件</a></li>
						  <li role="presentation"><a href="#changepassword" role="tab" data-toggle="tab">修改密码</a></li>
						  <li role="presentation"><a href="#uploadphoto" role="tab" data-toggle="tab">上传头像</a></li>
						  <li role="presentation"><a href="#uploadfiles" role="tab" data-toggle="tab">上传文件</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
						  <div role="tabpanel" class="tab-pane active" id="home">
						  	<div style="margin-top:20px;">
						  		<form action="user_saveInfo" class="form-horizontal" role="form">
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">行业</label>
								    <div class="col-md-5">
								      <input type="text" name="industry" value="${industry }" class="form-control" id="text" placeholder="行业">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">职业</label>
								    <div class="col-md-5">
								      <input type="text" name="job" value="${job }" class="form-control" id="inputPassword3" placeholder="职业">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">姓名</label>
								    <div class="col-md-5">
								      <input type="text"  name="name" value="${name }" class="form-control" id="inputPassword3" placeholder="姓名">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">国家</label>
								    <div class="col-md-5">
								      <input type="text" name="country" value="${country }" class="form-control" id="inputPassword3" placeholder="国家">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">生日</label>
								    <div class="col-md-5">
								      <input name="birthday" value="${birthday }" class="form-control" id="inputbirth">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
								    <div class="col-md-5">
								      <div>
								        <label>
								        	<s:if test="sex == 1">
									          <input type="radio" checked="checked" name="sex" id="sex" value="1"/>&nbsp;男
									          <input type="radio" id="sex" name="sex" value="0" style="margin-left: 10px;"/>&nbsp;女
								        	</s:if>
								        	<s:else>
									          <input type="radio" name="sex" id="sex" value="1"/>&nbsp;男
									          <input type="radio" checked="checked" id="sex" name="sex" value="0" style="margin-left: 10px;"/>&nbsp;女
								        	</s:else>
								        </label>
								      </div>
								    </div>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-md-5">
								      <button type="submit" class="btn btn-primary">提交</button>
								    </div>
								  </div>
								</form>
						  	</div>
						  </div>
						  <div role="tabpanel" class="tab-pane" id="myfiles">
						  	<div style="margin-top:20px;">
						  		
							    <table class="table">
								  <thead>
								  	<tr>
								  		<td>
								  			序列
								  		</td>
								  		<td>
								  			名称
								  		</td>
								  		<td>
								  			下载
								  		</td>
								  		<td>
								  			删除
								  		</td>
								  	</tr>
								  </thead>
								  <tbody>
								  	<s:iterator value="files" var="f">
									  	<tr>
									  		<td>
									  			<s:property value="#f.fid"/>
									  		</td>
									  		<td>
									  			<s:property value="#f.fname"/>
									  		</td>
									  		<td>
									  			<a href="${pageContext.request.contextPath }/myUpload_downloadFile?fid=<s:property value="#f.fid"/>">下载</a>
									  		</td>
									  		<td>
									  			<a href="${pageContext.request.contextPath }/myUpload_deleteFile?fid=<s:property value="#f.fid"/>">删除</a>
									  		</td>
									  	</tr>
								  	</s:iterator>
								  </tbody>
								</table>
						  	</div>
						  </div>
						  <div role="tabpanel" class="tab-pane" id="changepassword">
						  	<div style="margin-top:20px;">
						  		<form id="formchangepassowrd" action="user_modifyPassword" class="form-horizontal" role="form">
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">旧密码</label>
								    <div class="col-md-5">
								      <input type="password" name="oldpassword" class="form-control" id="text" placeholder="旧密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
								    <div class="col-md-5">
								      <input type="password" name="newpassword" class="form-control" id="inputPassword3" placeholder="密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">再次确认密码</label>
								    <div class="col-md-5">
								      <input type="password" name="renewpassword" class="form-control" id="inputPassword3" placeholder="确认密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-md-5">
								      <button id="changepassword1" class="btn btn-primary">提交</button>
								    </div>
								  </div>
								</form>
						  	</div>
						  </div>
						  <div role="tabpanel" class="tab-pane" id="uploadphoto">
						  	<form action="myUpload_uploadPhoto" method="post" id="uploadimgform" enctype="multipart/form-data">
						      	<div class="input-group">
							        <input type="file" name="file">
							        <button id="uploadimgbtn" class="btn btn-default">提交</button>
						      	</div>
						    </form>
						  </div>
						  <div role="tabpanel" class="tab-pane" id="uploadfiles">
						  	<form action="myUpload_uploadFile" id="uploadfilesform" method="post" enctype="multipart/form-data">
						      	<div class="input-group">
							        <input type="file" name="file">
									<button id="uploadfilesbtn" class="btn btn-default">提交</button>
						      	</div>
						    </form>
						  </div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
				$(function(){
					$("#birthday").click(function(){
						$(this).val("");
					});
				});
				
				$(function() {
				    var date = new Date();
				    var seperator1 = "-";
				    var month = date.getMonth() + 1;
				    var strDate = date.getDate();
				    if (month >= 1 && month <= 9) {
				        month = "0" + month;
				    }
				    if (strDate >= 0 && strDate <= 9) {
				        strDate = "0" + strDate;
				    }
				    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
				    jeDate({
						dateCell:"#inputbirth",
						format:"YYYY-MM-DD",
						isinitVal:false,
						isTime:false, //isClear:false,
						minDate:"1900-09-19",
						maxDate:currentdate,
						okfun:function(val){alert(val)}
					})
				});
				$("#uploadfilesbtn").click(function(){
					 $("#uploadfileform").submit();
				 });
				$("#uploadimgbtn").click(function(){
					 $("#uploadimgform").submit();
				 });
				</script>
				<jsp:include page="foot.jsp"></jsp:include>
		</body>
</html>
