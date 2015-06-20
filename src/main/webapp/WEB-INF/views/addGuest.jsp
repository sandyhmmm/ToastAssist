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

	<div class="container">
		<tiles:insertDefinition name="hometemplate">
			<tiles:putAttribute name="body">
				<div class="container">
					<form:form action="addGuest" commandName="guest">
Guest Name<form:input class="form-control" path="guestName"
							required="true" />
Guest Email<form:input class="form-control" type="email"
							path="guestEmailID" required="true" />
						<form:button class="btn btn-info">Add</form:button>
					</form:form>
				</div>
			</tiles:putAttribute>
		</tiles:insertDefinition>
</body>
</html>