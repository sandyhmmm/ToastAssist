<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">
p {
	font-size: 20vw;
	height: 100%;
	line-height: 100vh;
	text-align: center;
	text-shadow: 0 0 0.2em lime;
	line-height: 30vh;
	text-align: center;
}
</style>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	var stopwatch;
	var runningstate = 0; // 1 means the timecounter is running 0 means counter stopped
	var stoptime = 0;
	var lapcounter = 0;
	var currenttime;
	var lapdate = '';
	//var lapdetails;
	var namesArray = [];

	function addNames(name) {
		namesArray.push(name);
	}

	function timecounter(starttime) {
		currentdate = new Date();
		//lapdetails = document.getElementById('lapdetails');
		stopwatch = document.getElementById('stopwatch');

		var timediff = currentdate.getTime() - starttime;
		if (runningstate == 0) {
			timediff = timediff + stoptime
		}
		if (runningstate == 1) {
			stopwatch.innerHTML = formattedtime(timediff);
			refresh = setTimeout('timecounter(' + starttime + ');', 10);
		} else {
			window.clearTimeout(refresh);
			stoptime = timediff;
		}
	}
	function startandstop() {
		var startandstop = document.getElementById('startandstopbutton');
		var startdate = new Date();
		var starttime = startdate.getTime();
		if (runningstate == 0) {
			startandstop.innerHTML = 'Stop';
			runningstate = 1;
			timecounter(starttime);
		} else {
			startandstop.innerHTML = 'Start';
			runningstate = 0;
			lapdate = '';
		}
	}
	function resetstopwatch() {
		//lapdetails.value = '';
		lapcounter = 0;
		stoptime = 0;
		lapdate = '';
		window.clearTimeout(refresh);
		if (runningstate == 1) {
			var resetdate = new Date();
			var resettime = resetdate.getTime();
			timecounter(resettime);
		} else {
			stopwatch.innerHTML = "00:00:00";
		}
	}
	function formattedtime(unformattedtime) {
		var decisec = Math.floor(unformattedtime / 100) + '';
		var second = Math.floor(unformattedtime / 1000);
		var minute = Math.floor(unformattedtime / 60000);
		decisec = decisec.charAt(decisec.length - 1);
		second = second - 60 * minute + '';
		if (second <= 9 && minute <= 9) {
			return '0' + minute + ':' + '0' + second + ':' + '0' + decisec;
		} else if (minute > 9 && second <= 9) {
			return minute + ':' + '0' + second + ':' + '0' + decisec;
		} else {
			return minute + ':' + second + ':' + '0' + decisec;
		}

	}
	function doAjax() {

		var role = $('#roleInput').val();
		var rolePlayer = $('#rolePlayerInput').val();
		var time = $('#stopwatch').html();

		if (role == "" || rolePlayer == "") {
			alert("Both Role and Roleplayer needs values");

		} else {

			$.ajax({
				url : 'timerReport',
				data : ({
					role : role,
					rolePlayer : rolePlayer,
					time : time
				}),
				success : function(response) {
					resetstopwatch();
				},
				error : function(error) {
					$('#response').html(error);
				}
			});
		}
	}
	$(function() {

		$("#rolePlayerInput").autocomplete({
			source : namesArray
		});
	});
</script>
</head>
<body>
	<c:forEach var="name" items="${checkInArray}">
		<script type="text/javascript">
			addNames("${name}");
		</script>
	</c:forEach>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
	Role Player:
	<input id="rolePlayerInput" name="rolePlayerInput" /> Role:
	<input id="roleInput" name="roleInput" />
			<input type="hidden" name="meetingID" value= />
			<br>
			<br>
			<p class="jumbotron" id="stopwatch">00:00:00</p>
			<br>     
	<button id="startandstopbutton" type="button" onclick="startandstop();">Stop/Stop</button>
	    
	<button id="resetbutton" type="button" onclick="resetstopwatch();">Reset</button>

			<button id="submitbutton" type="button" onclick="doAjax();">Submit</button>

			<form action="timerGrid">
				<button>Complete</button>
			</form>

			<br>     
</tiles:putAttribute>
	</tiles:insertDefinition>

</body>
</html>