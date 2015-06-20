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
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true
		});
	});
</script>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div id="accordion">
				<c:forEach var="evaluation" items="${evaluations}">
					<h3>"${evaluation.evaluator.name}"</h3>
					<div>
						Role: <input type="text" class="form-control" readonly="readonly"
							value="${evaluation.role}"> <br> Commendations:
						<textarea class="form-control" rows="4">
				<c:out value="${evaluation.commendations}"></c:out>
				</textarea >
						<br> Recommendations:
						<textarea rows="4"class="form-control">
				<c:out value="${evaluation.recommendation}"></c:out>
				</textarea>
					</div>
				</c:forEach>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>