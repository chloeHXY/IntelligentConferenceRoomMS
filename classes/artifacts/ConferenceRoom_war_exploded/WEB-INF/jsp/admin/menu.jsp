<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav" >
        <li><a href="${pageContext.request.contextPath}/admin/showRoom" style="border-radius: 0px">会议室信息管理<span class="glyphicon glyphicon-pencil pull-right"/></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showReservation" style="border-radius: 0px">预约审核管理<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecord" style="border-radius: 0px">审核通过记录查询<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecordReject" style="border-radius: 0px">拒绝预约记录查询<span class="glyphicon glyphicon-pencil pull-right" /></a></li>

        <li><a href="${pageContext.request.contextPath}/admin/userRegister" style="border-radius: 0px">用户注册管理<sapn class="glyphicon glyphicon-repeat pull-right" /></a></li>
       <li><a href="${pageContext.request.contextPath}/admin/showUser" style="border-radius: 0px">修改个人信息<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/logout" style="border-radius: 0px">退出系统<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <%--<li class="disabled"><a href="##">Responsive</a></li>--%>
    </ul>
</div>