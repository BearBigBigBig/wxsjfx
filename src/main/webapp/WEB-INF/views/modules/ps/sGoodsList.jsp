<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/ps/sGoods/">商品列表</a></li>
		<shiro:hasPermission name="ps:sGoods:edit"><li><a href="${ctx}/ps/sGoods/form">商品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sGoods" action="${ctx}/ps/sGoods/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商品分类ID：</label>
				<form:input path="classId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>类型ID：</label>
				<form:input path="generId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>商品副标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商品名称</th>
				<th>商品副标题</th>
				<th>备注</th>
				<th>更新时间</th>
				<shiro:hasPermission name="ps:sGoods:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sGoods">
			<tr>
				<td><a href="${ctx}/ps/sGoods/form?id=${sGoods.id}">
					${sGoods.name}
				</a></td>
				<td>
					${sGoods.title}
				</td>
				<td>
					${sGoods.remarks}
				</td>
				<td>
					<fmt:formatDate value="${sGoods.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="ps:sGoods:edit"><td>
    				<a href="${ctx}/ps/sGoods/form?id=${sGoods.id}">修改</a>
					<a href="${ctx}/ps/sGoods/delete?id=${sGoods.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>