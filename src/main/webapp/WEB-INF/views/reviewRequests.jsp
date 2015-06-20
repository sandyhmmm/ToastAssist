<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Request</title>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<table class="table">
					<tr>
						<th>Meeting</th>
						<th>Role</th>
						<th>Requested By</th>
						<th>Approve</th>
					</tr>
					<form action="approveRequest" method="post">
						<c:forEach var="request" items="${roleRequests}">
							<tr>
								<td><input type="text" name="meeting"
									value="${request.meetingID.meetingName}"></td>
								<td><input type="text" name="role" value="${request.role}">
								</td>
								<td><input type="text" name="requestedBy"
									value="${request.requestedBy.name}"></td>
								<td><input type="checkbox" name="approve"
									value="${request.roleRequestID}">Approve</td>
							</tr>

						</c:forEach>
						<tr>
							<td><input class="btn btn-info" type="submit"></td>
						</tr>
					</form>
				</table>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>