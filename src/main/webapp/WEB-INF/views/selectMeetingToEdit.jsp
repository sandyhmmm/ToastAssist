<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
	Open Meetings:
	<form:form action="openMeeting" commandName="checkIn">
		<form:select path="meeting">
			<form:options items="${openMeetings}" itemLabel="meetingName"
				itemValue="meetingID" />
		</form:select>
		<form:button>Open</form:button>
	</form:form>
	Checkin Meetings:
	<form:form action="openMeeting" commandName="checkIn">
		<form:select path="meeting">
			<form:options items="${checkInMeetings}" itemLabel="meetingName"
				itemValue="meetingID" />
		</form:select>
		<form:button>Open</form:button>
	</form:form>
	Complete Meetings:
	<form:form action="openMeeting" commandName="checkIn">
		<form:select path="meeting">
			<form:options items="${completeMeetings}" itemLabel="meetingName"
				itemValue="meetingID" />
		</form:select>
		<form:button>Open</form:button>
	</form:form>
	</tiles:putAttribute>
	</tiles:insertDefinition>
	
</body>
</html>