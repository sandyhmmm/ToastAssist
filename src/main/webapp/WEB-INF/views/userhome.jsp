<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
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

			<div class="body">

				<div id="accordion">
					<c:forEach var="role"
						items="${sessionScope.memberTable.executiveComittee}">
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'Admin'}">
							<h3>Admin</h3>
							<div>
								<a class="list-group-item" href="addClubPage">Add Club</a> <a
									class="list-group-item" href="addPresidentPage">Add
									President</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'President'}">
							<h3>President</h3>
							<div>
								<a class="list-group-item" href="updateMembersPage">Update
									Members</a> <a class="list-group-item" href="editExcommMembers">Edit
									Executive Committee</a> <a class="list-group-item"
									href="viewMembers">View Member Roster</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'VicePresident-Education'}">
							<h3>Vice President - Education</h3>
							<div>
								<a class="list-group-item" href="updateMembersPage">Update
									Members</a> <a class="list-group-item" href="viewMembers">View
									Member Roster</a> <a class="list-group-item"
									href="createMeetingPage">Create New Meeting</a> <a
									class="list-group-item" href="reviewRequests">Review
									Requests</a> <a class="list-group-item" href="viewReports">View
									Reports</a> <a class="list-group-item" href="checkin">Check IN</a>
								<a class="list-group-item" href="meetingForTTSpeaker">Start
									TT Session</a> <a class="list-group-item" href="allMeetings">Open
									Meetings</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'VicePresident-Membership'}">
							<h3>Vice President - Membership</h3>
							<div>
								<a class="list-group-item" href="updateMembersPage">Update
									Members</a> <a class="list-group-item" href="viewMembers">View
									Member Roster</a> <a class="list-group-item" href="mailAllMembers">Mail
									Members</a> <a class="list-group-item" href="">Track Dues</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'VicePresident-PublicRelations'}">
							<h3>Vice President - Public Relations</h3>
							<div>
								<a class="list-group-item" href="viewMembers">View Member
									Roster</a> <a class="list-group-item" href="mailAllMembers">Mail
									Members</a>
									<a class="list-group-item" href="mailAllGuests">Mail
									Guests</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'Secretary'}">
							<h3>Secretary</h3>
							<div>
								<a class="list-group-item" href="viewMembers">View Member
									Roster</a> <a class="list-group-item" href="mailAllMembers">Mail
									Members</a> <a class="list-group-item" href="allMeetings">Open
									Meetings</a><a class="list-group-item" href="addGuestPage">Add Guests</a>
									<a class="list-group-item" href="mailAllGuests">Mail
									Guests</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'Treasurer'}">
							<h3>Treasurer</h3>
							<div>
								<a class="list-group-item" href="viewMembers">View Member
									Roster</a> <a class="list-group-item" href="getExpensesForClub">Track
									Expenses</a>
							</div>
						</c:if>
						<c:if
							test="${role.comitteeRoles.executiveComitteeRole == 'Sergeant At Arms'}">
							<h3>Sergeant At Arms</h3>
							<div>
								<a class="list-group-item" href="viewMembers">View Member
									Roster</a> <a class="list-group-item" href="allMeetings">Open Meetings</a>
									<a class="list-group-item" href="addGuestPage">Add Guests</a>
							</div>
						</c:if>

					</c:forEach>
				</div>
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item"
						src="https://www.youtube.com/embed/bbz2boNSeL0" frameborder="0"
						allowfullscreen></iframe>
				</div>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>