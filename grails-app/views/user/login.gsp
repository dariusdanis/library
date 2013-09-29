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

			<g:form action="authenticate" method="post">
				<fieldset class="form">
					<div class="fieldcontain">
						<label> Email </label> <input type="text" id="email" name="email"
							value="${email}" />
					</div>

					<div class="fieldcontain">
						<label> Password </label> <input type="password" id="password"
							name="password" />
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
