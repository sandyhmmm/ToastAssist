<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
			<form:form action="checkMeIn" commandName="checkIn">
				<form:select class="form-control" path="meeting">
					<form:options   items="${meetingList}" itemLabel="meetingName"
						itemValue="meetingID" />
				</form:select>
				<br>
				<form:button class="btn btn-warning">Check Me In</form:button>
			</form:form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>