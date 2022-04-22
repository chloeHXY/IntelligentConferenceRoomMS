<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>个人信息修改</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/wirte.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currDate = dateFormat.format(new Date());
    List dateList=new ArrayList();
    for (int i = 0; i < 16; i++) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateFormat.parse(currDate));

        calendar.add(Calendar.DAY_OF_MONTH, i);

        String nextDay= dateFormat.format(calendar.getTime());
        dateList.add(nextDay);
    }
    request.setAttribute("dateList",dateList);
%>
	<!-- 顶栏 -->
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
<%--	<jsp:include page="top.jsp"></jsp:include>--%>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
<%--			<jsp:include page="menu.jsp"></jsp:include>--%>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<h1 style=" color:#fff;">个人信息</h1>
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form"
							onsubmit="return check()"
							action="${pageContext.request.contextPath}/admin/changeUser"
							id="editfrom" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">用户ID</label>
								<div class="col-sm-10">
									<input readonly="readonly" type="text" class="form-control"
										id="id" name="id" value="${object.id}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										id="username" name="username" value="${object.username}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">用户密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
										name="password" value="${object.password}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">重复密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="repassword"
										name="repassword" value="${object.password}">
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
<script type="text/javascript">
    <%--设置菜单中--%>
    $("#nav li:nth-child(6)").addClass("active")

    <c:if test="${pagingVO != null}">
    if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
        $(".pagination li:last-child").addClass("disabled")
    }
    ;

    if (${pagingVO.curentPageNo} == ${1}) {
        $(".pagination li:nth-child(1)").addClass("disabled")
    }
    ;
    </c:if>

    function confirmd() {
        var msg = "您真的确定要删除吗？！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }

    $("#sub").click(function () {
        $("#form1").submit();
    });
</script>
<script type="text/javascript">
function check(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var repassword = document.getElementById("repassword").value;
	if(!username){
		alert("请输入用户名！");
		return false;
	}
	if(!password){
		alert("请输入密码！");
		return false;
	}
	if(!repassword){
		alert("请重复输入密码！");
		return false;
	}
	if(password!=repassword){
		alert("两次密码输入不确！");
		return false;
	}
	return true;
	}
</script>

</html>