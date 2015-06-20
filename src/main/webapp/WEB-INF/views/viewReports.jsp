<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	Available Roles:
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<form:form action="selectMeetingReport" commandName="meeting">
					<label class="radio"><input type="radio" name="radioOption"
						value="timerPage" checked="checked">Timer</label>
					<label class="radio"><input type="radio" name="radioOption"
						value="ahCounterPage">Ah Counter</label>
					<label class="radio"><input type="radio" name="radioOption"
						value="evaluatorReport">Evaluation Report</label>
					<!-- <label class="radio">
					<input type="radio" name="radioOption"
						value="generalEvaluationReport"> General Evaluation</label> -->
					<label class="radio"><form:select path="meetingID" >
							<form:options items="${meetings}" itemValue="meetingID"
								itemLabel="meetingName" />
						</form:select> <form:button class="btn btn-warning">Submit</form:button>
				</form:form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>

</body>
</html>