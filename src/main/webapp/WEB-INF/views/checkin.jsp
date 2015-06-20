<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var guestDiv = '';
	var memberDiv = '';
	function getRadioValue() {
		var strResult;
		var elements = document.getElementsByName("checkinchoice");
		for (var i = 0, l = elements.length; i < l; i++) {
			if (elements[i].checked) {
				strResult = elements[i].value;
			}
		}
		if (strResult == "guest") {
			$('#guestEmailID').readonly = "";
			$('#guestCheckIN').disabled = false;
		} else {
			$('#choicediv').html(memberDiv);
		}
	}
	function doAjaxCheckIn() {
		var meetingID = $('#meetingID').val();
		var guestEmailID = $('#guestEmailID').val();
		var guestName = $('#guestName').val();
		$.ajax({
			url : 'saveGuest',
			data : ({
				guestName : guestName,
				guestEmailID : guestEmailID,
				meetingID : meetingID
			}),

			success : function(response) {

				$('#response').html(response);
			},
			error : function(error) {

				$('#response').html(error);
			}
		});

	}
	function doAjax() {
		var meetingID = $('#meetingID').val();
		var email = $('#guestEmailID').val();

		$.ajax({
			url : 'searchGuestByEmail',
			data : ({
				email : email,
				meetingID : meetingID
			}),
			success : function(response) {

				$('#response').html(response);
			},
			error : function(error) {
				alert(error);
				$('#response').html(error);
			}
		});
	}
	function memberCheckIn() {
		var meetingID = $('#meetingID').val();
		var customerID = $('#customerId').val();
		alert(customerID);

		$.ajax({
			url : 'checkInMembers',
			data : ({
				customerID : customerID,
				meetingID : meetingID
			}),
			success : function(response) {

				$('#response').html(response);
			},
			error : function(error) {

				$('#response').html(error);
			}
		});
	}
</script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


</head>
<body>
	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<!--  <input name="checkinchoice" type="radio" value="guest" />Guest
	<input name="checkinchoice" type="radio" value="member" />Member
	<button id="btnContinue" onclick="getRadioValue()">Continue</button> -->
				<select id="meetingID"><c:forEach var="meeting"
						items="${meetings}">
						<option value="${meeting.meetingID}"
							label='"${meeting.meetingName}" - "${meeting.meetingDate}"'>
					</c:forEach></select><br>
					Guests:
					<br>
					 Enter email id: <input class="form-control" id="guestEmailID"
					name="guestEmailID" />
				<button class="btn btn-warning" id="guestCheckIN" type="button"
					onclick="doAjax()">Submit</button>
				<br> Existing Members: <select id="customerId"><c:forEach
						var="member" items="${memberTables}">
						<option value="${member.customerId}" label="${member.name}">
					</c:forEach></select>
				<button class="btn" onclick="memberCheckIn()">Check In</button>
				<div id="response"></div>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>

</body>
</html>