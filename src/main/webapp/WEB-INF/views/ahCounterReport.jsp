<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	var ahCount = 0;
	var umCount = 0;
	var likeCount = 0;
	var youKnowCount = 0;
	var andButOrSoCount = 0;
	var wODUsageCount = 0;
	var namesArray = [];

	function ahClick() {
		ahCount = ahCount + 1;
		document.getElementById('ahHidCount').value = ahCount;
		document.getElementById('ahButton').innerHTML = ahCount;
	}
	function umClick() {
		umCount = umCount + 1;
		document.getElementById('umHidCount').value = umCount;
		document.getElementById('umButton').innerHTML = umCount;
	}
	function likeClick() {
		likeCount = likeCount + 1;
		document.getElementById('likeHidCount').value = likeCount;
		document.getElementById('likeButton').innerHTML = likeCount;
	}
	function youKnowClick() {
		youKnowCount = youKnowCount + 1;
		document.getElementById('youKnowHidCount').value = youKnowCount;
		document.getElementById('youKnowButton').innerHTML = youKnowCount;
	}
	function andButOrSoClick() {
		andButOrSoCount = andButOrSoCount + 1;
		document.getElementById('andButOrSoHidCount').value = andButOrSoCount;
		document.getElementById('andButOrSoButton').innerHTML = andButOrSoCount;
	}
	function wODUsageClick() {
		wODUsageCount = wODUsageCount + 1;
		document.getElementById('wODUsageHidCount').value = wODUsageCount;
		document.getElementById('wODUsageButton').innerHTML = wODUsageCount;
	}
	function doAjax() {

		var ah = 0;
		var um = 0;
		var like = 0;
		var youKnow = 0;
		var andButOrSo = 0;
		var wODUsage = 0;

		var role = $('#role').val();
		var rolePlayer = $('#rolePlayer').val();
		ah = $('#ahHidCount').val();
		um = $('#umHidCount').val();
		like = $('#likeHidCount').val();
		youKnow = $('#youKnowHidCount').val();
		andButOrSo = $('#andButOrSoHidCount').val();
		wODUsage = $('#wODUsageHidCount').val();
		var repeatedWords = $('#repeatedWords').val();
		var goodUsage = $('#goodUsage').val();

		if (role == "" || rolePlayer == "") {
			alert("Both Role and Roleplayer needs values");

		} else {

			if (goodUsage == "") {
				goodUsage = "n/a";
			}
			if (repeatedWords == "") {
				repeatedWords = "n/a";
			}
			if (ah == "") {
				ah = 0;
			}
			if (um == "") {
				um = 0;
			}
			if (like == "") {
				like = 0;
			}
			if (youKnow == "") {
				youKnow = 0;
			}
			if (andButOrSo == "") {
				andButOrSo = 0;
			}
			if (wODUsage == "") {
				wODUsage = 0;
			}
			$.ajax({
				url : 'ahCounterReportAjax',
				data : ({
					rolePlayer : rolePlayer,
					role : role,
					ah : ah,
					um : um,
					repeatedWords : repeatedWords,
					like : like,
					youKnow : youKnow,
					andButOrSo : andButOrSo,
					goodUsage : goodUsage,
					wODUsage : wODUsage
				}),
				success : function(response) {
					alert(response);
				},
				error : function(error) {
					alert(error);
				}
			});
		}
	}
</script>

</head>
<body>

	<tiles:insertDefinition name="hometemplate">
		<tiles:putAttribute name="body">
			<div class="container">
				<form action="ahCounterReport">
					Role Player: <input class="form-control" id="rolePlayer"
						name="rolePlayer" /> Role : <input id="role" name="role" /> <br>
					Ahs:
					<button class="btn btn-info" id="ahButton" onclick="ahClick()"
						type="button">0</button>
					<input type="hidden" id="ahHidCount" name="ah" /> Ums:
					<button class="btn btn-info" id="umButton" onclick="umClick()"
						type="button">0</button>
					<input type="hidden" id="umHidCount" name="um" /> Repeated Word: <input
						id="repeatWords" name="repeatWords" /> Likes:
					<button class="btn btn-info" id="likeButton" onclick="likeClick()"
						type="button">0</button>
					<input type="hidden" id="likeHidCount" name="like" /> You Know:
					<button class="btn btn-info" id="youKnowButton"
						onclick="youKnowClick()" type="button">0</button>
					<input class="form-control" type="hidden" id="youKnowHidCount"
						name="youKnow" /><br> And/But/Or/So:
					<button class="btn btn-info" id="andButOrSoButton"
						onclick="andButOrSoClick()" type="button">0</button>
					<input class="form-control" type="hidden" id="andButOrSoHidCount"
						name="andButOrSo" /> Good Usage: <input id="goodUsage"
						name="goodUsage" /> WOD Usage:
					<button class="btn btn-info" id="wODUsageButton"
						onclick="wODUsageClick()" type="button">0</button>
					<input type="hidden" id="wODUsageHidCount" name="wODUsage" /> <br>
					<button class="btn btn-warning" onclick="doAjax()" type="button">Submit</button>
				</form>
				<form action="ahCounterGrid">
		<input class = "btn btn-warning" type="submit" value="Complete and View">
	</form>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>

</body>
</html>