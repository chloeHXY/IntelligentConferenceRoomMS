<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>会议室信息查询</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/wirte.css">
	<script src="${pageContext.request.contextPath}/js/unslider.min.js"></script>
	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>

	<!-- 顶栏 -->
   <jsp:include page="top.jsp"></jsp:include>
	<div style="text-align:center;clear:both"><br><br><br><br>
	<!-- 中间主体 -->
	<jsp:include page="banner.jsp"></jsp:include>
		<!-- 把要轮播的地方写上来 -->
		<div class="banner" id="b04">
			<ul>
				<li><img src="${pageContext.request.contextPath}/images/01.png" alt="" width="680" height="400" ></li>
				<li><img src="${pageContext.request.contextPath}/images/02.png" alt="" width="680" height="400" ></li>
				<li><img src="${pageContext.request.contextPath}/images/03.png" alt="" width="680" height="400" ></li>
				<li><img src="${pageContext.request.contextPath}/images/04.png" alt="" width="680" height="400" ></li>
				<li><img src="${pageContext.request.contextPath}/images/05.png" alt="" width="680" height="400" ></li>
			</ul>
			<a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="${pageContext.request.contextPath}/images/arrowl.png" alt="prev" width="20" height="35"></a>
			<a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="${pageContext.request.contextPath}/images/arrowr.png" alt="next" width="20" height="37"></a>
		</div>
		<script>
			$(document).ready(function(e) {
				var unslider04 = $('#b04').unslider({
							dots: true
						}),
						data04 = unslider04.data('unslider');

				$('.unslider-arrow04').click(function() {
					var fn = this.className.split(' ')[1];
					data04[fn]();
				});
			});
		</script>
	<div class="container" id="content">
		<div class="row">
<%--			<jsp:include page="menu.jsp"></jsp:include>--%>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">会议室信息查询</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="${pageContext.request.contextPath}/ordinary/queryRoom" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入会议室" name="findByName">
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit" id="sub">搜索</span>
								</div>
							</form>

						</div>
				    </div>
<%--				    <table class="table table-bordered">--%>
<%--					        <thead>--%>
<%--					            <tr>--%>
<%--									<th>会议室编号</th>--%>
<%--									<th>会议室名称</th>--%>
<%--									<th>详细信息</th>--%>
<%--					            </tr>--%>
<%--					        </thead>--%>
<%--					        <tbody>--%>
<%--							<c:forEach  items="${roomList}" var="item">--%>
<%--								<tr>--%>
<%--									<td>${item.id}</td>--%>
<%--									<td>${item.name}</td>--%>
<%--									<td>${item.message}</td>--%>
<%--								</tr>--%>
<%--							</c:forEach>--%>
<%--					        </tbody>--%>
<%--				    </table>--%>
					<table class="table table-bordered">
						<tbody>
						<c:forEach items="${roomList}" var="item">
							<div class="single-member effect-3" style="max-height: 302px">
								<div class="member-image">

								</div>
								<div class="member-info">
									<h3>${item.name}</h3>
									<h5>${item.id}会议室</h5>
									<p>${item.message}</p>
<%--									<div class="social-touch">--%>
<%--										<button class="btn btn-default btn-xs btn-info"--%>
<%--												onClick="location.href='${pageContext.request.contextPath}/admin/editRoom?id=${item.id}'">修改</button>--%>
<%--										<button class="btn btn-default btn-xs btn-danger btn-primary"--%>
<%--												onclick="removeRoom(${item.id})">删除</button>--%>
<%--									</div>--%>
								</div>
							</div>
						</c:forEach>
						</tbody>
					</table>
				    <div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.upPageNo}">&laquo;上一页</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a href="${pageContext.request.contextPath}/ordinary/showRoom?page=${pagingVO.totalCount}">最后一页&raquo;</a></li>
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
		<%--设置菜单中选中背景色改变,不同导航栏,nth-child(1)中参数1不可重复--%>
		$("#nav li:nth-child(1)").addClass("active")

        <c:if test="${pagingVO != null}">
        if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
            $(".pagination li:last-child").addClass("disabled")
        };

        if (${pagingVO.curentPageNo} == ${1}) {
            $(".pagination li:nth-child(1)").addClass("disabled")
        };
        </c:if>

        function removeRoom(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("${pageContext.request.contextPath}/ordinary/removeRoom",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>