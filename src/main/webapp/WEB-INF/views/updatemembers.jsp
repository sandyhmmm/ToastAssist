<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form method="post" action="updateMembers"
				enctype="multipart/form-data">
				
				<label for = "upload">File to upload:</label>
				 <input class="btn btn-default" id="upload"  type="file" name="file">
				
				
				<input type="submit"  value="Upload"> Press here to upload
				the file! <input   type="hidden" name="name" value="value" />
				
			</form>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>