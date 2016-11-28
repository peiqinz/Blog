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
				  margin-left:23px;
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
			.login-button{
				  height: 45px;
				  width: 300px;
				  padding: 6px 20px;
				  margin-bottom: 40px;
				  font-size: 20px;
				  color: #FFFFFF;
				  line-height: 1.42857143;
				  margin-left:23px;
			      background: #dc3c00;;
				  font-size: 1.5em;
				  border: 1px solid #CCCCCC;
				  border-radius: 4px;
				  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
				          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
				  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
				       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
				          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
			}
		</style>
	</head>
	<body>
		<div style="background-image: url(img/login-bg.png);padding: 60px 0 66px 0;border-top: 1px solid #e9e9e9;display: block;font-size: 12px;">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img src="img/login-banner.png" style="margin-left: 100px;"/>
					</div>
					<div class="col-md-6">
						<div style="background: #FFFFFF;margin:0px 100px">
							<div class="text-muted" style="padding-top: 20px;padding-left: 25px;display:inline-block">
								<h4>账号登录</h4><span><s:actionmessage theme="filesss"/></span>
							</div>
							<form action="user_loginUser" method="post">
								<div class="form-register">
									<div class="form-control-reg">
										<input name="email" class="form-control1" style="height: 40px;" placeholder="用户名"></input>
									</div>
									<div class="form-control-reg">
										<input type="password" name="password" class="form-control1" style="height: 40px;" placeholder="密码"></input>
									</div>
									<div class="checkbox">
										<label style="margin-left:30px;padding: 7px 13px;">
											<input type="checkbox" >下次自动登录</input>
										</label>
									</div>
									<button type="submit" class="login-button">登录</button>
								</div>
							</form>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>
