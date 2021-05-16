<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도와줘 잡스씨 관리자</title>
<style>
<%@include file="../style/admin.css"%>
</style>
</head>
<body>
	
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="<%=request.getContextPath()%>/adminlogin" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="manager-id" name="id" type="id" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="manager-Password" name="pass" type="pass" >
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" value="관리자 로그인" class="btn btn-lg btn-success btn-block">Login</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>