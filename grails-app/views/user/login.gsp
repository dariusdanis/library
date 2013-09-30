<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<div class="content">
		<div class="info">
			<h1>Login</h1>

			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
					${flash.clear()}
				</div>
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
			<g:form action="authenticate" method="post">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: user, field: 'email', 'error')}">
						<label> Email: </label>
						<g:field type="email" name="email" maxlength="50" required=""
							value="${user?.email}" />
					</div>
					<div class="fieldcontain ${hasErrors(bean: user, field: 'password', 'error')}">
						<label> Password: </label>
						<g:passwordField name="password" maxlength="50" required="" />
					</div>
				</fieldset>
				<fieldset class="buttons">
					<input type="submit" value="Login" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
