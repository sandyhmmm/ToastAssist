<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
			<div class="container">
				<table class="table">
					<tr>
						<th>Role Player</th>
						<th>Role</th>
						<th>Time Taken</th>
						<th>Timer</th>
					</tr>
					<c:forEach var="report" items="${timerReport}">
						<tr>
							<th>"${report.rolePlayer}"</th>
							<th>"${report.role}"</th>
							<th>"${report.timeTaken}"</th>
							<th>"${report.timer.name}"</th>
						</tr>
					</c:forEach>

				</table>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>