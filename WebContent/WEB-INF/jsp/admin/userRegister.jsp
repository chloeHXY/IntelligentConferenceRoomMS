<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/wirte.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<%--导航栏开始--%>
<div id="bg">
	<!-- 代码 开始 -->
	<div id="container">
		<ul id="nav">
			<li><a class="cur" href="${pageContext.request.contextPath}/admin/showRoom">会议室<span>CONFERENCE</span></a></li>

			<li><a href="${pageContext.request.contextPath}/admin/showReservation">预约审核<span>CHECK</span></a></li>

			<li><a href="${pageContext.request.contextPath}/admin/showRecord">审核通过<span>PASS</span></a></li>

			<li><a href="${pageContext.request.contextPath}/admin/showRecordReject">审核打回<span>FAIL</span></a></li>

			<li><a href="${pageContext.request.contextPath}/admin/userRegister">用户注册<span>REGISTER</span></a></li>

			<li><a href="${pageContext.request.contextPath}/admin/showUser">个人信息<span>INFO</span></a></li>

		</ul>
		<div id="buoy"></div>
	</div>
	<%--	<script type="text/javascript">--%>
	<%--		$.nicenav(300);--%>
	<%--	</script>--%>
</div>
<div style="text-align:center;clear:both"><br><br><br><br>
</div>
<!-- 顶栏 -->
<%--<jsp:include page="top.jsp"></jsp:include>--%>
<!-- 中间主体 -->
<div class="container" id="content">
	<div class="row">
<%--		<jsp:include page="menu.jsp"></jsp:include>--%>
		<div class="col-md-10">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<h1 style="color:#fff;">用户注册</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" name="newUser" id="newUser" role="form" action="${pageContext.request.contextPath}/admin/userRegister" id="editfrom" method="post" onsubmit="return check()">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">用户(非管理员)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="id" id="id" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password2" placeholder="请再次输入密码">
							</div>
						</div>
						<div class="form-group" style="margin-left:400px">
							<button class="btn btn-default" type="submit">提交</button>
							<button class="btn btn-default">重置</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
</div>
<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
</div>
</body>
<script>
	$("#nav li:nth-child(5)").addClass("active")
	
	function check() {
		var id = document.getElementById("id").value;
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		if(id==""||id==null)
		{alert("请输入用户名称");return false;}
		if(password==""||password==null)
		{alert("请输入用户密码");return false;}
		if(password2==""||password2==null)
		{alert("请输入再次输入密码");return false;}
		if(password != password2)
		{alert("两次密码不一致，请重新输入");return false;}

	}
</script>
${error }
</html>