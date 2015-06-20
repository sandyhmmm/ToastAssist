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
				<h3>Executive Comitte:</h3>
				<c:if test="${edit == true }">
					<button type="button" data-id=''
						class="openModal btn btn-info btn-sm" data-toggle="modal"
						data-target="#addModal">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
					</button>
				</c:if>
				<table class="table table-condensed">
					<tr>
						<th>Name</th>
						<th>Position</th>
						<th>Contact</th>
						<th>Mail</th>
						<c:if test="${edit == true }">
							<td></td>
						</c:if>
					</tr>
					<c:forEach var="role" items="${exComm}">
						<tr>
							<td><c:out value="${role.memberTable.name}" /></td>
							<td><c:out
									value="${role.comitteeRoles.executiveComitteeRole}" /></td>
							<td><c:out value="${role.memberTable.mobile}" /></td>
							<td><button type="button"
									data-id='<c:out value="${role.memberTable.email}"></c:out>'
									class="openModal btn btn-info btn-sm" data-toggle="modal"
									data-target="#myModal">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								</button></td>

							<c:if test="${edit == true }">
								<td><a href='deleteExcomm?exCommID=${role.comitteeID}'>Delete</a>
								</td>

							</c:if>
						</tr>
					</c:forEach>

				</table>
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
									<label for="mailId">To:</label> <input class="form-control"
										id="mailId" type="text" readonly="readonly" />
								</div>
								<div class="form-group">
									<label for="subject">Subject:</label> <input
										class="form-control" id="subject" type="text" />
								</div>
								<div class="form-group">
									<label for="mailText">Text:</label>
									<textarea class="form-control" id="mailText" rows="5"></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button"
									class="btn btn-info glyphicon glyphicon-envelope"
									onclick="sendMail()" data-dismiss="modal">Send</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>





				<div class="modal fade" id="addModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Add New Role</h4>
							</div>
							<form:form action="addExcomm" commandName="newExcomm">
								<div class="modal-body">
									<form:select path="memberTable" id="members">
										<form:options items="${members}" itemValue="email"
											itemLabel="name" />
									</form:select>
									<form:select path="comitteeRoles" id="roles">
										<form:options items="${roles}" itemValue="exCommRoleId"
											itemLabel="executiveComitteeRole" />
									</form:select>
								</div>
								<div class="modal-footer">
									<form:button class="btn btn-info glyphicon glyphicon-ok">Add</form:button>
									<button type="button" class="btn btn-warning"
										data-dismiss="modal">Close</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>