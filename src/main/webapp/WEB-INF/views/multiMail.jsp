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
	<h2>"${title}"</h2>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<form:form action="sendMultiMail" commandName="simpleMailMessage">
					<table  class="table">
						<tr>
							<td>To:</td>
							<td><form:input path="to" class="form-control" type="text" name="recipient"
									size="65" /></td>
						</tr>
						<tr>
							<td>Subject:</td>
							<td><form:input path="subject" class="form-control" type="text" name="subject"
									size="65" /></td>
						</tr>
						<tr>
							<td>Message:</td>
							<td><form:textarea class="form-control" path="text" rows="10"
									name="message"></form:textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><form:button
								class="btn btn-info"	value="Send E-mail">Send E-mail</form:button></td>
						</tr>
					</table>
				</form:form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>