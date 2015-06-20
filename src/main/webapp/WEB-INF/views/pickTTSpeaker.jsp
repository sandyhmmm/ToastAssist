<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function doAjax() {

		$.ajax({
			url : 'nextTTSpeaker',
			success : function(response) {

				$("#speaker").html(response);
			},
			error : function(error) {
				alert(error);
				$('#response').html(error);
			}
		});
	}
</script>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<button class="btn btn-warning" onclick="doAjax()">Pick Next Speaker</button>
			<div class="jumbotron" id="speaker"></div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>