<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Register</title>
</head>
<body>
	<div class="content">
		<div class="info">
			<h1>Register</h1>
			<g:if test="${flash.message}">
				<g:each in="${flash.message}">
					<div class="message">
						${it}
					</div>
				</g:each>
				${flash.clear()}
			</g:if>

			<g:form action="registerAndLogIn" method="post">
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="email"> Email </label> <input type="text" id="email"
							name="email" value="${user?.email}" />
					</div>

					<div class="fieldcontain">
						<label for="name"> Name </label> <input type="text" id="name"
							name="name" value="${user?.name}" />
					</div>

					<div class="fieldcontain">
						<label for="surname"> Surname </label> <input type="text"
							id="surname" name="surname" value="${user?.surname}" />
					</div>

					<div class="fieldcontain">
						<label for="personalNo"> Personal No. </label> <input type="text"
							id=" personalNo" name="personalNo" value="${user?.personalNo}" />
					</div>

					<div class="dateOfBirth">
						<label for="dateOfBirth"> Birth date</label>
						<g:datePicker id="dateOfBirth" name="dateOfBirth" precision="day"
							value="${user?.dateOfBirth}" years="${1930..2013}" />
					</div>

					<div class="fieldcontain">
						<label for="password"> Password </label> <input type="password"
							id="password" name="password" value="${user?.password}" />
					</div>

				</fieldset>
				<fieldset class="buttons">
					<input type="submit" value="Register" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
