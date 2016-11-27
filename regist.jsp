<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>注册---Blog</title>
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/mybs.css" />
		<link rel="stylesheet" href="css/blog.css" />
		<script type="text/javascript" src="js/jquery-2.2.4.js" ></script>
		<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script>
		$(function(){
			$(":input[name=password]").change(function(){
				$(this).parent().nextAll("label").remove();
			});
			$(":input[name=repassword]").change(function(){
				$(this).parent().nextAll("label").remove();
			});
			$(":input[name=checkcode1]").change(function(){
				$(this).parent().nextAll("label").remove();
			});
		});
		$(function(){
			$(":input[name=username]").change(function(){
				var val = $(this).val();
				val = $.trim(val);
				var $this = $(this);
				if(val != ""){
					// 当前节点后面的所有 Font 兄弟节点删除
					$this.parent().nextAll("label").remove();
					var url = "user_validateUsername";
					var args = {"username":val, "time":new Date()};
					
					$.post(url, args, function(data){
						//表示可用
						if(data.validateUsername == "1"){
							$this.parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>用户名可用</label>");
						}
						//不可用
						else if(data.validateUsername == "0"){
							$this.parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>用户名不可用</label>")
						}else{
							alert("服务器错误");
						}
					});
				}else{
					$this.after("<span>用户名不能为空</span>");
					$(this).val("");
					$this.focus();
				}
			});
		});
		$(function(){
			$(":input[name=email]").change(function(){
				var val = $(this).val();
				val = $.trim(val);
				var $this = $(this);
				if(val != ""){
					$this.parent().nextAll("label").remove();
					var url = "user_validateEmail";
					var args = {"email":val, "time":new Date()};
					
					$.post(url, args, function(data){
						//表示可用
						if(data.validateEmail == "1"){
							$this.parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>邮箱可用</label>");
						}
						//不可用
						else if(data.validateEmail == "0"){
							$this.parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>邮箱不可用</label>")
						}else{
							alert("服务器错误");
						}
					});
				}else{
					$this.after("<span>邮箱不能为空</span>");
					$(this).val("");
					$this.focus();
				}
			});
		});
		
		$(function(){
			$("form").submit(function(){
				var username = $(":input[name=username]").val();
				if(username == ''){
					$(":input[name=username]").parent().nextAll("label").remove();
					$(":input[name=username]").parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>用户名还没输</label>");
					return false;
				}
				var email = $(":input[name=email]").val().trim();
				if(email == ''){
					$(":input[name=email]").parent().nextAll("label").remove();
					$(":input[name=email]").parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>邮箱还没输</label>");
					return false;
				}
				var password = $(":input[name=password]").val().trim();
				if(password == ''){
					$(":input[name=password]").parent().nextAll("label").remove();
					$(":input[name=password]").parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>密码还没输</label>");
					return false;
				}
				var repassword = $(":input[name=repassword]").val().trim();
				if(repassword == ''){
					$(":input[name=repassword]").parent().nextAll("label").remove();
					$(":input[name=repassword]").parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>密码还没输</label>")
					return false;
				}
				var checkcode1 = $(":input[name=checkcode1]").val().trim();
				if(checkcode1 == ''){
					$(":input[name=checkcode1]").parent().nextAll("label").remove();
					$(":input[name=checkcode1]").parent().after("<label class='col-sm-4 control-label'  style='text-align:left;color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;'>请输入验证码</label>")
					return false;
				}
				return true;
			});
		});
		
		$(function(){
			$("#img1").click(function(){
				$(this).attr("src","${pageContext.request.contextPath}/checkImg.action?time="+new Date().getTime());
			});
		});
		
		</script>
		<style>
			.form-register{
				margin:auto;
				width:100%;
			}
			.form-control-reg{
				display: inline-block;
				margin: 10px 0px;
			}
			.form-control1{
				  display: inline-block;
				  height: 34px;
				  width: 300px;
				  padding: 6px 12px;
				  font-size: 14px;
				  line-height: 1.42857143;
				  color: #555;
				  background-color: #fff;
				  background-image: none;
				  border: 1px solid #ccc;
				  border-radius: 4px;
				  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
				          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
				  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
				       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
				          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
			}
		</style>
	</head>
	<s:debug/>
	<body style="background-color: #e7ecef; text-align:center;">
		<div class="righttabs-1">
			<a href="#"><img style="margin-bottom:15px" src="view/write_blog.png"></a>
		</div>
		<div class="righttabs-2">
			<a href="#"><img style="margin-bottom:15px" src="view/opinion.png"></a>
		</div>
		<div class="righttabs-3">
			<a href="#"><img style="margin-bottom:15px;" src="view/expert_apply.png"></a>
		</div>
		<nav class="nav navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">博客</a>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="margin:40px;">
				<form action="user_registerUser" method="post" class="form-horizontal" role="form">
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">用户名</label>
					   <div class="col-md-5">
					     <input type="text" name="username" value="${username }" class="form-control" style="height:40px;" id="text" placeholder="用户名">
					   </div>
					</div>
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">邮箱</label>
					   <div class="col-md-5">
					     <input type="text" name="email" class="form-control" value="${email }" style="height:40px;" id="text" placeholder="邮箱">
					   </div>
					
					</div>
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">密码</label>
					   <div class="col-md-5">
					     <input type="password" name="password" class="form-control" value="${password }" style="height:40px;" id="text" placeholder="密码">
					   </div>
					</div>
					<div class="form-group">
					   <label class="col-sm-3 control-label "  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">再一次输入密码</label>
					   <div class="col-md-5">
					     <input type="password" name="repassword" class="form-control" style="height:40px;" id="text" placeholder="再一次输入密码">
					   </div>
					</div>
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">验证码</label>
					   <div class="col-md-5">
					     <input type="text" class="form-control" name="checkcode1" style="float:left;height:40px;width:150px;" id="text" placeholder="验证码" >
					     <img alt="" id="img1" onclick="change()" src="${pageContext.request.contextPath }/checkImg.action">
					   </div>
					</div>
					<span><s:actionerror /></span>
					
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">
					   	
					   </label>
					   <div class="col-md-5">
					   	 <label class="pull-right" style="margin-left: 5px;">同意条款</label>
					     <input type="checkbox" class="pull-right"/>
					   </div>
					</div>
					<div class="form-group">
					   <label class="col-sm-3 control-label"  style="color:#9D9D9D;font-size:15px;line-height: 24px;font-family: 'Microsoft YaHei';font-weight: normal;">
					   </label>
					   <div class="col-md-5">
					     <button class="btn btn-primary pull-right" type="submit">提交</button>
					   </div>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</body>
</html>

