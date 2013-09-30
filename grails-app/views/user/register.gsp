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
			<g:hasErrors bean="${user}">
				<ul class="errors" role="alert">
					<g:eachError bean="${user}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="registerAndLogIn" method="post">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: user, field: 'email', 'error')}">
						<label for="email"> Email </label>
						<g:field type="email" required="" id="email" name="email"
							value="${user?.email}" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: user, field: 'name', 'error')}">
						<label for="name"> Name </label>
						<g:textField required="" id="name" name="name"
							value="${user?.name}" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: user, field: 'surname', 'error')}">
						<label for="surname"> Surname </label>
						<g:textField required="" id="surname" name="surname"
							value="${user?.surname}" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: user, field: 'personalNo', 'error')}">
						<label for="personalNo"> Personal No. </label>
						<g:textField required="" id=" personalNo" name="personalNo"
							value="${user?.personalNo}" />
					</div>

					<div class="dateOfBirth ${hasErrors(bean: user, field: 'dateOfBirth', 'error')}">
						<label for="dateOfBirth"> Birth date</label>
						<g:datePicker id="dateOfBirth" name="dateOfBirth" precision="day"
							value="${user?.dateOfBirth}" years="${1930..2013}" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: user, field: 'password', 'error')}">
						<label for="password"> Password </label>
						<g:passwordField required="" id="password" name="password"
							value="${user?.password}" />
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
