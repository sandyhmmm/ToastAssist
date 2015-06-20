<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
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
<script>
  $(function() {
    $( "#presidentSlider" ).slider({
    	  stop: function( event, ui ) {
    		  $("#president").val(ui.value);
    	  }
    });
    $( "#toastMasterSlider" ).slider({
    	  stop: function( event, ui ) {
    		  $("#toastMaster").val(ui.value);
        	  }
    });
    $( "#ttMasterSlider" ).slider({
    	  stop: function( event, ui ) {
    		  $("#tableTopicsMaster").val(ui.value);
        	  }
    });
    $( "#ttSpeakerSlider" ).slider({
    	  stop: function( event, ui ) {
    		  $("#tableTopicsSpeaker").val(ui.value);
        	  }
    });
    $( "#evaluatorsSlider" ).slider({
    	  stop: function( event, ui ) {
    		  $("#evaluators").val(ui.value);
        	  }
    });
  });
  </script>
</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
		<div class="container">
<table>
<tr><td>
President: <div id="presidentSlider"></div>
</td></tr>
<tr><td>
ToastMaster: <div id="toastMasterSlider"></div>
</td></tr>
<tr><td>
Table Topics Master: <div id="ttMasterSlider"></div>
</td></tr>
<tr><td>
Table Topics Speakers: <div id="ttSpeakerSlider"></div>
</td></tr>
<tr><td>
Evaluators: <div id="evaluatorsSlider"></div>
</td></tr>
</table>

<form:form action = "submitGEReport" commandName = "geReport">
<form:hidden path="president" id="president"></form:hidden>
<form:hidden path="toastMaster" id="toastMaster"></form:hidden>
<form:hidden path="tableTopicsMaster" id="tableTopicsMaster"></form:hidden>
<form:hidden path="tableTopicsSpeakers" id="tableTopicsSpeaker"></form:hidden>
<form:hidden path="evaluators" id="evaluators"></form:hidden>
Comment:
<form:textarea class="form-control" path="comments" required="true"/>
<form:button class="btn btn-info">Submit Evaluation</form:button>
</form:form>
</div>
</tiles:putAttribute>
</tiles:insertDefinition>

</body>
</html>