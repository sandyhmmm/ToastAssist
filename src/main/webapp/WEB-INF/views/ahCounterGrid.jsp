<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
	<table class="table">
		<tr>
			<th>Role Player</th>
			<th>Role</th>
			<th>Ah</th>
			<th>Um</th>
			<th>like</th>
			<th>And/But/Or/So</th>
			<th>You Know</th>
			<th>Repeated Words</th>
			<th>Good Usage</th>
			<th>Word of Day Usage</th>
		</tr>
		<c:forEach var="report" items="${ahCounterReports}">
			<tr>
				<th>"${report.rolePlayer}"</th>
				<th>"${report.role}"</th>
				<th>"${report.ah}"</th>
				<th>"${report.um}"</th>
				<th>"${report.like}"</th>
				<th>"${report.andButOrSo}"</th>
				<th>"${report.youKnow}"</th>
				<th>"${report.repeatWords}"</th>
				<th>"${report.goodUsage}"</th>
				<th>"${report.wODUsage}"</th>
			</tr>
		</c:forEach>

	</table>
	</tiles:putAttribute>
	</tiles:insertDefinition>

</body>
</html>