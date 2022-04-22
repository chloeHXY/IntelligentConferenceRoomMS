<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>预约审核管理</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/wirte.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/unslider.min.js"></script>

	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

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
<%--	<!-- 顶栏 -->--%>
<%--	<jsp:include page="top.jsp"></jsp:include>--%>
<%--	<!-- 中间主体 -->--%>
<%--	<!-- 把要轮播的地方写上来 -->--%>
<%--	<div class="banner" id="b04">--%>
<%--		<ul>--%>
<%--			<li><img src="${pageContext.request.contextPath}/images/01.jpg" alt="" width="680" height="400" ></li>--%>
<%--			<li><img src="${pageContext.request.contextPath}/images/02.jpg" alt="" width="680" height="400" ></li>--%>
<%--			<li><img src="${pageContext.request.contextPath}/images/03.jpg" alt="" width="680" height="400" ></li>--%>
<%--			<li><img src="${pageContext.request.contextPath}/images/04.jpg" alt="" width="680" height="400" ></li>--%>
<%--			<li><img src="${pageContext.request.contextPath}/images/05.jpg" alt="" width="680" height="400" ></li>--%>
<%--		</ul>--%>
<%--		<a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="${pageContext.request.contextPath}/images/arrowl.png" alt="prev" width="20" height="35"></a>--%>
<%--		<a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="${pageContext.request.contextPath}/images/arrowr.png" alt="next" width="20" height="37"></a>--%>
<%--	</div>--%>
<%--	<script>--%>
<%--		$(document).ready(function(e) {--%>
<%--			var unslider04 = $('#b04').unslider({--%>
<%--						dots: true--%>
<%--					}),--%>
<%--					data04 = unslider04.data('unslider');--%>

<%--			$('.unslider-arrow04').click(function() {--%>
<%--				var fn = this.className.split(' ')[1];--%>
<%--				data04[fn]();--%>
<%--			});--%>
<%--		});--%>
<%--	</script>--%>
	<div class="container" id="content" >
		<div class="row">
<%--			<jsp:include page="menu.jsp"></jsp:include>--%>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">待审核预约</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="${pageContext.request.contextPath}/admin/queryUser" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入借用人姓名" name="findByName" style="height:36px;">
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit" id="sub">搜索</span>
								</div>
							</form>
							<%--<button class="btn btn-default col-md-2" style="margin-top: 20px" onClick="location.href='${pageContext.request.contextPath}/admin/addTeacher'">
								添加教师信息
								<sapn class="glyphicon glyphicon-plus"/>
							</button>--%>

						</div>
				    </div>
				    <table class="table table-bordered">
<%--					        <thead>--%>
<%--					            <tr>--%>
<%--									<th>预约编号</th>--%>
<%--									<th>会议室</th>--%>
<%--									<th>借用日期</th>--%>
<%--									<th>开始时间</th>--%>
<%--									<th>结束时间</th>--%>
<%--									<th>借用人</th>--%>
<%--									<th>借用真实姓名</th>--%>
<%--									<th>借用原因</th>--%>
<%--									<th>联系方式</th>--%>
<%--									<th>状态</th>--%>
<%--									<th>操作</th>--%>
<%--					            </tr>--%>
<%--					        </thead>--%>
					        <tbody>
							<c:forEach  items="${reservationList}" var="item">
								<div class="single-member effect-3" style="max-height:397px;">
									<div class="member-info">
										<h5>预约编号:&nbsp; ${item.id}</h5>
										<h5>会议室:&nbsp; ${item.name}</h5>
										<h5>借用日期:&nbsp; <fmt:formatDate value="${item.date}"
																		dateStyle="medium" pattern="yyyy-MM-dd" /></h5>
										<h5>开始时间:&nbsp;<fmt:formatDate value="${item.beginTime}"
																	   dateStyle="medium" pattern="HH:mm:ss" /></h5>
										<h5>结束时间:&nbsp; <fmt:formatDate value="${item.endTime}"
																		dateStyle="medium" pattern="HH:mm:ss" /></h5>
										<h5>借用人:&nbsp;${item.user}</h5>
										<h5>借用人真实姓名:&nbsp;${item.username}</h5>
										<h5>借用原因:&nbsp; ${item.reason}</h5>
										<h5>联系方式:&nbsp; ${item.mobile}</h5>
										<h5>状态:&nbsp;${item.mark}</h5>
										<div class="social-touch">
											<button class="btn btn-default btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/admin/reviewReservation?id=${item.id}'">同意申请</button>
											<button class="btn btn-danger btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/admin/rejectReservation?id=${item.id}'">拒绝申请</button>
										</div>
									</div>
								</div>
<%--								<tr>--%>
<%--									<td>${item.id}</td>--%>
<%--									<td>${item.name}</td>--%>
<%--									<td><fmt:formatDate value="${item.date}" dateStyle="medium" pattern="yyyy-MM-dd"/></td>--%>
<%--									<!--pattern="HH:mm:ss"为24小时计时法，pattern="hh:mm:ss"为12小时计时法-->--%>
<%--									<td><fmt:formatDate value="${item.beginTime}" dateStyle="medium" pattern="HH:mm:ss"/></td>--%>
<%--									<td><fmt:formatDate value="${item.endTime}" dateStyle="medium" pattern="HH:mm:ss"/></td>--%>
<%--									<td>${item.user}</td>--%>
<%--									<td>${item.username}</td>--%>
<%--									<td>${item.reason}</td>--%>
<%--									<td>${item.mobile}</td>--%>
<%--									<td>${item.mark}</td>--%>
<%--									<td>--%>
<%--										<button class="btn btn-default btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/admin/reviewReservation?id=${item.id}'">同意申请</button>--%>
<%--										<button class="btn btn-danger btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/admin/rejectReservation?id=${item.id}'">拒绝申请</button>--%>
<%--									</td>--%>
<%--								</tr>--%>
							</c:forEach>
					        </tbody>
				    </table>
				    <div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.upPageNo}">&laquo;上一页</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a href="${pageContext.request.contextPath}/admin/showReservation?page=${pagingVO.totalCount}">最后一页&raquo;</a></li>
								</ul>
							</nav>
						</c:if>
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
		$("#nav li:nth-child(2)").addClass("active")

        <c:if test="${pagingVO != null}">
			if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
				$(".pagination li:last-child").addClass("disabled")
			};

			if (${pagingVO.curentPageNo} == ${1}) {
				$(".pagination li:nth-child(1)").addClass("disabled")
			};
        </c:if>

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>