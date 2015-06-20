<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<form:form action="addPresident" commandName="memberTable">
			<tr>
				<td>Customer Id:</td>
				<td><form:input path="customerId" /></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Mail Stop:</td>
				<td><form:input path="mailStop" /></td>
			</tr>
			<tr>
				<td>Address Line 1:</td>
				<td><form:input path="addrL1" /></td>
			</tr>
			<tr>
				<td>Address Line 2:</td>
				<td><form:input path="addrL2" /></td>
			</tr>
			<tr>
				<td>Address Line 3:</td>
				<td><form:input path="addrL3" /></td>
			</tr>
			<tr>
				<td>Address Line 4:</td>
				<td><form:input path="addrL4" /></td>
			</tr>
			<tr>
				<td>Email ID:</td>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td>Secondary Email ID:</td>
				<td><form:input path="secondaryEmail" /></td>
			</tr>
			<tr>
				<td>Home #:</td>
				<td><form:input path="home" /></td>
			</tr>
			<tr>
				<td>Work #:</td>
				<td><form:input path="work" /></td>
			</tr>
			<tr>
				<td>Fax #:</td>
				<td><form:input path="fax" /></td>
			</tr>
			<tr>
				<td>Membership Period:</td>
				<td><form:input path="membershipPeriod" /></td>
			</tr>
			<tr>
				<td>Member Since:</td>
				<td><form:input path="memberSince" /></td>
			</tr>
			<tr>
				<td>Status:</td>
				<td><form:select path="status">
						<form:option value="Active">Active</form:option>
						<form:option value="Grace">Grace</form:option>
					</form:select>
			</tr>
			<tr>
				<td>Club :</td>
				<td><form:select path="club">
						<form:options items="${clubList}" itemValue="clubNo" itemLabel="clubName"/>
					</form:select></td>
			</tr>
			<tr>
				<td colspan="2"><form:button>Submit</form:button></td>
			</tr>
		</form:form>
	</table>

</body>
</html>