<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>预约记录查询</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/wirte.css">
	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- 顶栏 -->

	<!-- 中间主体 --><jsp:include page="top.jsp"></jsp:include>
	<div style="text-align:center;clear:both"><br><br><br><br>
	<div class="container" id="content">
		<div class="row">
<%--			<jsp:include page="menu.jsp"></jsp:include>--%>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">预约记录查询</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="${pageContext.request.contextPath}/ordinary/queryByUser" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入借用人" name="findByName">
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit" id="sub">搜索</span>
								</div>
							</form>
						</div>
				    </div>
				    <table class="table table-bordered">
<%--					        <thead>--%>
<%--					            <tr>--%>
<%--									<th>预约编号</th>--%>
<%--									<th>会议室</th>--%>
<%--									<th>借用人</th>--%>
<%--									<th>借用人真实姓名</th>--%>
<%--									<th>借用原因</th>--%>
<%--									<th>借用日期</th>--%>
<%--									<th>开始时间</th>--%>
<%--									<th>结束时间</th>--%>
<%--									<th>状态</th>--%>
<%--					            </tr>--%>
<%--					        </thead>--%>
							<tbody>
							<c:forEach items="${recordList}" var="item">
								<div class="single-member effect-3">
									<div class="member-info">
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
											<a class="fb-touch" href="#"></a>
											<a class="tweet-touch" href="#"></a>
											<a class="linkedin-touch" href="#"></a>
										</div>
									</div>
								</div>
							</c:forEach>
							</tbody>
				    </table>
				    <div class="panel-footer">
						<c:if test="${pagingVo != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.upPageNo}">&laquo;上一页</a></li>
									<li class="active"><a href="">${pagingVo.curentPageNo}</a></li>
									<c:if test="${pagingVo.curentPageNo+1 <= pagingVo.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.curentPageNo+1}">${pagingVo.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVo.curentPageNo+2 <= pagingVo.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.curentPageNo+2}">${pagingVo.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVo.curentPageNo+3 <= pagingVo.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.curentPageNo+3}">${pagingVo.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVo.curentPageNo+4 <= pagingVo.totalCount}">
										<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.curentPageNo+4}">${pagingVo.curentPageNo+4}</a></li>
									</c:if>
									<li><a href="${pageContext.request.contextPath}/ordinary/showRecord?page=${pagingVo.totalCount}">最后一页&raquo;</a></li>
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