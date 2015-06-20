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
	<table>
		<form:form action="addClub" commandName="club">
			<tr>
				<td>Club No:</td>
				<td><form:input path="clubNo" /></td>
			</tr>
			<tr>
				<td>Club Name:</td>
				<td><form:input path="clubName" /></td>
			</tr>
			<tr>
				<td>Area:</td>
				<td><form:input path="area" /></td>
			</tr>
			<tr>
				<td>Division:</td>
				<td><form:input path="division" /></td>
			</tr>
			<tr>
				<td>District:</td>
				<td><form:input path="district" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button name="Submit">Submit</form:button></td>
			</tr>

		</form:form>
	</table>

</body>
</html>