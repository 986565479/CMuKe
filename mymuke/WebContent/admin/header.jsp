<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>头部</title>
<script type="text/javascript">
	function adminlogout(){
		// Ajax 异步请求退出登录
		var url="${pageContext.request.contextPath}/AdminServlet";
		var args = {"action":"adminlogout","time":new Date()};
		$.post(url,args,function(data){
			if(data==1){
				window.location.replace("/muke/admin/login.jsp");
			}
		});
	}
</script>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="admin/index.jsp">慕课答疑平台</a>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
		    <c:if test="${sessionScope.admin == null}">
				<li><a href="admin/login.jsp">登录</a></li>
				</c:if>
			<c:if test="${sessionScope.admin != null}">
			<li><a>${sessionScope.admin.name}</a></li>
			<li><a href="admin/msgmanager.jsp">帖子管理</a></li>
			<li><a href="admin/usermanager.jsp">用户管理</a></li>
			<li><a href="admin/thememanager.jsp">主题管理</a></li>
			<li><a href="javascript:adminlogout()">退出</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	</div>
</nav>
	<div class="jumbotron masthead">
		<div class="container">
			<h1>慕课答疑平台-后台</h1>
		</div>
	</div>
</body>
</html>