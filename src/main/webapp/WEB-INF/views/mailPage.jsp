<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="sendMail" commandName="simpleMailMessage">
		<table border="0" width="80%">
			<tr>
				<td>To:</td>
				<td><form:input path="replyTo" type="text" name="recipient"
						size="65" /></td>
			</tr>
			<tr>
				<td>Subject:</td>
				<td><form:input path="subject" type="text" name="subject"
						size="65" /></td>
			</tr>
			<tr>
				<td>Message:</td>
				<td><form:textarea path="text" cols="50" rows="10"
						name="message"></form:textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><form:button value="Send E-mail">Send E-mail</form:button>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>