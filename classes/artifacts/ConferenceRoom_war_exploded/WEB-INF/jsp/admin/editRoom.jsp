<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<%--	<jsp:include page="top.jsp"></jsp:include>--%>
	<!-- 中间主体 -->
		<div class="container" id="content">
		<div class="row">
<%--			<jsp:include page="menu.jsp"></jsp:include>--%>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 style="color:#fff;">修改会议室信息</h1>
						</div>
				    </div>
				    <div class="panel-body">
						<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/editRoom" id="editForm" method="post">
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">会议室编号</label>
							    <div class="col-sm-10">
							      <input readonly="readonly"  type="number" class="form-control" id="inputEmail3" value="${roomList.id}" name="id" placeholder="请输入课程号">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">会议室名称</label>
									<div class="col-sm-10">
							      <input type="text" class="form-control" id="inputPassword3" name="name" value="${roomList.name}" placeholder="请输入会议室名称">
							    </div>
							  </div>

							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">会议室详细信息</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="message" value="${roomList.message}" placeholder="会议室详细信息">
								</div>
							</div>

							<div class="form-group" style="text-align: center">
								<button class="btn btn-default" type="submit">提交</button>
								<button class="btn btn-default" type="reset">重置</button>
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

</html>