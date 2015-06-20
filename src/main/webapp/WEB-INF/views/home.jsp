<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<link href="/resources/css/main.css" rel="stylesheet" />
<html>
<head>
<title>Welcome to ToastAssist: Login</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.js"></script>
<link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/css/bootstrapvalidator.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/css/bootstrapvalidator.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#form").validate({
			rules : {
				'password' : {
					required : true
				},
				'email' : {
					required : true
				}
			}

		});

	});
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>ToastAssist</h1>
			<p>Assisting in making better leaders</p>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="well login-box">
					<form:form action="login" method="POST" commandName="memberTable"
						id="form" name="form">
						<legend>Welcome Toastmasters</legend>
						<div class="form-group">
							<label for="username-email">E-mail</label>
							<form:input type="email" class="form-control"
								placeholder="E-mail" path="email" id="username-email"
								name="email" required="true"></form:input>
							<form:errors path="email" cssClass="error" />

						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<form:password class="form-control" placeholder="Password"
								path="password" name="password" id="password" required="true"></form:password>
							<form:errors path="password" cssStyle="error" />

						</div>
						<div class="form-group text-center">
							<button class="btn btn-danger btn-cancel-action">Cancel</button>
							<form:button class="btn btn-success btn-login-submit" id="Submit" name="Submit">Login</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
</body>
</html>
