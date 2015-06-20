<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New Meeting</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script>
	$(function() {
		$("#datepicker").datepicker();
	});

	function unavailableCB(cbName, elementName) {
		if (document.getElementById(cbName).checked) {
			document.getElementById(elementName).setAttribute("readonly",
					"readonly");
			document.getElementById(elementName).value = "Not Available";
		} else {
			document.getElementById(elementName).removeAttribute("readonly");
			document.getElementById(elementName).value = "";
		}

	}
</script>

</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="page-header">
				<h1>Create a new meeting</h1>
			</div>
			<div class="container" align="center">
				<table class="table">
					<form:form action="createMeeting" commandName="meeting">
						<tr>
							<td>Meeting Name:</td>
							<td><form:input class="form-control" path="meetingName"
									type="text" id="meetingName" required = "true"/></td>
						</tr>
						<tr>
							<td>Meeting Date:</td>
							<td><form:input class="form-control" path="meetingDate"
									type="text" id="datepicker" required = "true"/></td>
						</tr>
						<tr>
							<td>Humorist:</td>
							<td><form:input class="form-control" path="humorist"
									type="text" id="humorist" /></td>
							<td>Not Available: <input type="checkbox" id="cbHumorist"
								onclick="unavailableCB('cbHumorist','humorist')">
							</td>
						</tr>
						<tr>
							<td>Toastmaster:</td>
							<td><form:input class="form-control" path="toastmaster"
									type="text" id="toastmaster" /></td>
							<td>Not Available: <input type="checkbox" id="cbtoastmaster"
								onclick="unavailableCB('cbtoastmaster','toastmaster')">
							</td>
						<tr>
							<td>General Evaluator:</td>
							<td><form:input class="form-control" path="generalEvaluator"
									type="text" id="generalEvaluator" /></td>
							<td>Not Available: <input type="checkbox"
								id="cbgeneralEvaluator"
								onclick="unavailableCB('cbgeneralEvaluator','generalEvaluator')">
							</td>
						</tr>

						<tr>
							<td>Timer:</td>
							<td><form:input class="form-control" path="timer"
									type="text" id="timer" /></td>
							<td>Not Available: <input type="checkbox" id="cbtimer"
								onclick="unavailableCB('cbtimer','timer')">
							</td>
						<tr>
							<td>AhCounter:</td>
							<td><form:input class="form-control" path="aHCounter"
									type="text" id="aHCounter" /></td>
							<td>Not Available: <input type="checkbox" id="cbaHCounter"
								onclick="unavailableCB('cbaHCounter','aHCounter')">
							</td>
						</tr>
						<tr>
							<td>Grammarian:</td>
							<td><form:input class="form-control" path="grammarian"
									type="text" id="grammarian" /></td>
							<td>Not Available: <input type="checkbox" id="cbgrammarian"
								onclick="unavailableCB('cbgrammarian','grammarian')">
							</td>
						</tr>
						<tr>
							<td>Table Topics Master:</td>
							<td><form:input class="form-control" path="tTMaster"
									type="text" id="tTMaster" /></td>
							<td>Not Available: <input type="checkbox" id="cbtTMaster"
								onclick="unavailableCB('cbtTMaster','tTMaster')">
							</td>
						</tr>
						<tr>
							<td>Speaker 1:</td>
							<td><form:input class="form-control" path="speaker1"
									type="text" id="speaker1" /></td>
							<td>Not Available: <input type="checkbox" id="cbSp1"
								onclick="unavailableCB('cbSp1','speaker1')">
							</td>
						</tr>
						<tr>
							<td>Evaluator 1:</td>
							<td><form:input class="form-control" path="evaluator1"
									type="text" id="eval1" /></td>
							<td>Not Available: <input type="checkbox" id="cbEv1"
								onclick="unavailableCB('cbEv1','eval1')">
							</td>
						</tr>
						<tr>
							<td>Speaker 2:</td>
							<td><form:input class="form-control" path="speaker2"
									type="text" id="speaker2" /></td>
							<td>Not Available: <input type="checkbox" id="cbSp2"
								onclick="unavailableCB('cbSp2','speaker2')">
							</td>
						</tr>
						<tr>
							<td>Evaluator 2:</td>
							<td><form:input class="form-control" path="evaluator2"
									type="text" id="eval2" /></td>
							<td>Not Available: <input type="checkbox" id="cbEv2"
								onclick="unavailableCB('cbEv2','eval2')">
							</td>
						</tr>
						<tr>
							<td>Speaker 3:</td>
							<td><form:input class="form-control" path="speaker3"
									type="text" id="speaker3" /></td>
							<td>Not Available: <input type="checkbox" id="cbSp3"
								onclick="unavailableCB('cbSp3','speaker3')">
							</td>
						</tr>
						<tr>
							<td>Evaluator 3:</td>
							<td><form:input class="form-control" path="evaluator3"
									type="text" id="eval3" /></td>
							<td>Not Available: <input type="checkbox" id="cbEv3"
								onclick="unavailableCB('cbEv3','eval3')">
							</td>
						<tr>
							<td>Speaker 4:</td>
							<td><form:input class="form-control" path="speaker4"
									type="text" id="speaker4" /></td>
							<td>Not Available: <input type="checkbox" id="cbSp4"
								onclick="unavailableCB('cbSp4','speaker4')">
							</td>
						</tr>
						<tr>
							<td>Evaluator 4:</td>
							<td><form:input class="form-control" path="evaluator4"
									type="text" id="eval4" /></td>
							<td>Not Available: <input type="checkbox" id="cbEv4"
								onclick="unavailableCB('cbEv4','eval4')">
							</td>
						</tr>
						<tr>
							<td>Speaker 5:</td>
							<td><form:input class="form-control" path="speaker5"
									type="text" id="speaker5" /></td>

							<td>Not Available: <input type="checkbox" id="cbSp5"
								onclick="unavailableCB('cbSp5','speaker5')">
							</td>
						</tr>
						<tr>
							<td>Evaluator 5:</td>
							<td><form:input class="form-control" path="evaluator5"
									type="text" id="eval5" /></td>
							<td>Not Available: <input type="checkbox" id="cbEv5"
								onclick="unavailableCB('cbEv5','eval5')">
							</td>
						</tr>
						<tr>
							<td><form:button>Create</form:button></td>
						</tr>
					</form:form>

				</table>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</body>
</html>