<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	var namesArray = [];
	function addNames(name) {
		namesArray.push(name);
	}
	$(function() {

		$("#rolePlayerInput").autocomplete({
			source : namesArray
		});
	});
</script>
</head>
<body>
	<c:forEach var="name" items="${checkInArray}">
		<script type="text/javascript">
			addNames("${name}");
		</script>
	</c:forEach>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<form:form action="submitEvaluation" commandName="evaluatorReport">
	
	Role Player: <form:input class="form-control" id="rolePlayerInput"
						name="rolePlayerInput" path="rolePlayer" required="true" data-fv-stringlength="true"
                data-fv-stringlength-max="100"
                data-fv-stringlength-message="The name must be less than 100 characters"/> 
	Role: <form:input class="form-control" id="roleInput" name="roleInput" path="role"
						required="true" />
					<br>
	Commendations: <form:textarea class="form-control" path="commendations" row="4" required="true"
	data-fv-stringlength="true"
                data-fv-stringlength-max="1000"
                data-fv-stringlength-message="The commendations must be less than 200 characters"/>
					<br>
	Recommendations: <form:textarea class="form-control"
						path="recommendation" rows="4" required="true"
						data-fv-stringlength="true"
                data-fv-stringlength-max="1000"
                data-fv-stringlength-message="The recommendations must be less than 200 characters"/>
					<form:button>Submit</form:button>
			</div>
			</form:form>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>