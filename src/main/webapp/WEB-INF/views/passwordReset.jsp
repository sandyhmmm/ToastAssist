<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form:form method="POST" commandName="memberTable"
					action="resetPassword">
					<table>
						<tr>
							<td>Enter your old password:</td>
							<td><input type="password" name="oldPassword" required = "true"/></td>
						</tr>
						<tr>
							<td>Enter new password:</td>
							<td><form:password path="password" required = "true"/></td>
						</tr>
						<tr>
							<td>Re-enter your new password:</td>
							<td><input type="password" name="newPass" required = "true"/></td>
						</tr>
						<tr>
							<td colspan="2"><form:button>Change Password</form:button></td>
						</tr>
					</table>
				</form:form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>