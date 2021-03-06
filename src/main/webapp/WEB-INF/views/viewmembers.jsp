<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>View Members</title>
<script type="text/javascript">
	$(document).on("click", ".btn", function() {
		var mailID = $(this).data('id');
		$(".modal-body #mailId").val(mailID);
	});

	function sendMail() {
		var mailId = $('#mailId').val();
		var subject = $('#subject').val();
		var text = $('#mailText').html();
		alert(subject)
		$.ajax({
			url : 'sendInstantMail',
			data : ({
				to : mailId,
				subject : subject,
				text : text
			}),
			success : function(response) {
				alert(response);
			}
		});
	}
</script>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
	<div class="container">
		<h3>Membership Roster:</h3>
		<table class="table table-condensed">
			<tr>
				<th></th>
				<th>Name</th>
				<th>Mail Stop</th>
				<th>Addr L1</th>
				<th>Addr L2</th>
				<th>Addr L3</th>
				<th>Addr L4</th>
				<th>Email</th>
				<th>Secondary email</th>
				<th>Home</th>
				<th>Work</th>
				<th>Fax</th>
				<th>Mobile</th>
				<th>Membership Period</th>
				<th>Member Since</th>
				<th>Status(*)</th>
			</tr>
			<c:forEach var="member" items="${memberTables}">
				<tr>
					<td><button type="button"
							data-id='<c:out value="${member.email}"></c:out>'
							class="openModal btn btn-info btn-sm" data-toggle="modal"
							data-target="#myModal">
							<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
						</button></td>
					<td><c:out value="${member.name}" /></td>
					<td><c:out value="${member.mailStop}" /></td>
					<td><c:out value="${member.addrL1}" /></td>
					<td><c:out value="${member.addrL2}" /></td>
					<td><c:out value="${member.addrL3}" /></td>
					<td><c:out value="${member.addrL4}" /></td>
					<td><c:out value="${member.email}" /></td>
					<td><c:out value="${member.secondaryEmail}" /></td>
					<td><c:out value="${member.home}" /></td>
					<td><c:out value="${member.work}" /></td>
					<td><c:out value="${member.fax}" /></td>
					<td><c:out value="${member.mobile}" /></td>
					<td><c:out value="${member.membershipPeriod}" /></td>
					<td><c:out value="${member.memberSince}" /></td>
					<td><c:out value="${member.status}" /></td>
				</tr>
			</c:forEach>

		</table>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Mail</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="mailId">To:</label>
							 <input class="form-control"  id="mailId" type="text"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="subject">Subject:</label> 
							<input class="form-control"  id="subject" type="text" />
						</div>
						<div class="form-group">
							<label for="mailText">Text:</label> 
							<textarea class="form-control"  id="mailText" rows="5"></textarea>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button"
							class="btn btn-info glyphicon glyphicon-envelope"
							onclick="sendMail()" data-dismiss="modal">Send</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</tiles:putAttribute>
</tiles:insertDefinition>
</body>
</html>