<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</head>
<body>

	<div>
	<c:if test="${canAdd == true }">
		<button type="button" class="openModal btn btn-info btn-sm"
			data-toggle="modal" data-target="#myModal">
			<span class="glyphicon glyphicon-usd" aria-hidden="true">Add
				Expense</span>
		</button>
		</c:if>
		<table class="table">
			<tr>
				<th>Member Name</th>
				<th>Amount</th>
				<th>Added By</th>
			</tr>
			<c:set scope="page" var="total" value="0.0"></c:set>
			<c:forEach var="balance" items="${balanceList}">
				<tr>
					<td><c:out value="${balance.member.name}"></c:out></td>
					<td><c:out value="${balance.amount}"></c:out></td>
					<td><c:out value="${balance.treasurer.name}"></c:out></td>
				</tr>
				<c:set scope="page" var="total" value="${total + balance.amount}"></c:set>
			</c:forEach>
			
		</table>
		<div class="panel panel-default">
				<div class="panel-body">
					Total:
					<c:out value="${total}"></c:out>
				</div>
			</div>
		
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">New Expense</h4>
					</div>
					<form:form action="addExpense" commandName="balanceSheet">
						<div class="modal-body">

							<div class="form-group">
								<label for="members">Members:</label>
								<form:select path="member" id="members">
									<form:options items="${members}" itemValue="email"
										itemLabel="name" />
								</form:select>
							</div>
							<div class="form-group">
								<label for="amount">Amount:</label>
								<form:input class="form-control glyphicon glyphicon-usd"
									path="amount" id="amount" />
							</div>
							<div class="form-group">
								<label for="comment">Comment:</label>
								<form:textarea class="form-control"
									path="comment" id="comment" rows="3" />
							</div>

							<div class="modal-footer">
								<form:button class="btn btn-info glyphicon glyphicon-ok">Credit</form:button>
								<button type="button" class="btn btn-warning"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>



</body>
</html>