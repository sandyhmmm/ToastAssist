<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Request Role</title>
</head>
<body>


	<form:form action='requestRole' commandName="roleRequest" >
	<form:hidden path="meetingID" value = "${roleRequest.meetingID.meetingID }"/>
	<form:hidden path="requestedBy" value = "${roleRequest.requestedBy.email}"/>
	<form:hidden path="requestedTo" value = "${roleRequest.requestedTo.email}"/>
	
	
		<form:select path = "role" id="role">
			<c:if test="${roleRequest.meetingID.toastmaster == ''}">
				<form:option  value='toastmaster'>Toastmaster</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.generalEvaluator == ''}">
				<form:option  value='generalEvaluator'>General
					Evaluator</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.timer == ''}">
				<form:option  value='timer'>Timer</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.aHCounter ==''}">
				<form:option  value='aHCounter '>Ah
					Counter</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.grammarian ==''}">
				<form:option  value='grammarian'>Grammarian</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.tTMaster ==''}">
				<form:option  value='tTMaster'>Table
					Topics Master</form:option>
			</c:if>

			<c:if test="${roleRequest.meetingID.speaker1 ==''}">
				<form:option  value='speaker1'>Speaker
					1</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.evaluator1 ==''}">
				<form:option  value='evaluator1'>Evaluator
					1</form:option>
			</c:if>

			<c:if test="${roleRequest.meetingID.speaker2 ==''}">
				<form:option  value='speaker2'>Speaker
					2</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.evaluator2 ==''}">
				<form:option  value='evaluator2'>Evaluator
					2</form:option>
			</c:if>

			<c:if test="${roleRequest.meetingID.speaker3 ==''}">
				<form:option  value='speaker3'>Speaker
					3</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.evaluator3 ==''}">
				<form:option  value='evaluator3'>Evaluator
					3</form:option>
			</c:if>

			<c:if test="${roleRequest.meetingID.speaker4 ==''}">
				<form:option  value='speaker4'>Speaker
					4</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.evaluator4 ==''}">
				<form:option  value='evaluator4'>Evaluator
					4</form:option>
			</c:if>

			<c:if test="${roleRequest.meetingID.speaker5 ==''}">
				<form:option  value='speaker5'>Speaker
					5</form:option>
			</c:if>
			<c:if test="${roleRequest.meetingID.evaluator5 ==''}">
				<form:option  value='evaluator5'>Evaluator
					5</form:option>
			</c:if>
		</form:select>

		<form:button>Request</form:button>
	</form:form>


</body>
</html>