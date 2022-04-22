
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--shiro标签--%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-- 顶栏 -->
<%--导航栏开始--%>
<div id="bg">
    <!-- 代码 开始 -->
    <div id="container">
        <ul id="nav">
            <li><a class="cur" href="${pageContext.request.contextPath}/ordinary/showRoom">会议室信息<span>CONF</span></a></li>

            <li><a href="${pageContext.request.contextPath}/ordinary/showRecord">预约记录查询<span>CHK</span></a></li>

            <li><a href="${pageContext.request.contextPath}/ordinary/reserveRoom">预约会议室<span>PASS</span></a></li>

            <li><a href="${pageContext.request.contextPath}/ordinary/cancelApplication?user=<shiro:principal/>">取消预约申请<span>FAIL</span></a></li>

            <li><a href="${pageContext.request.contextPath}/ordinary/showUser">个人信息修改<span>REG</span></a></li>

            <li><a href="${pageContext.request.contextPath}/logout">退出系统<span>INFO</span></a></li>

        </ul>
        <div id="buoy"></div>
    </div>
    <%--	<script type="text/javascript">--%>
    <%--		$.nicenav(300);--%>
    <%--	</script>--%>
</div>
