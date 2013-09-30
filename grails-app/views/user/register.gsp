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
				    <g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<input type="submit" value="Register" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
