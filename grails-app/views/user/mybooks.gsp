<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<div class="content">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="giveBack" method="post">
			<table class="table">
				<thead>
					<tr>
						<th>Title</th>
						<th>Release year</th>
						<th>Return</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${books}">
						<tr>
							<td><g:link action="show" id="${it.id }" controller="book">
									${it.name }
								</g:link></td>
							<td>
								${it.yearOfRelease.format('yyyy-MM-dd') }
							</td>
							<td><g:checkBox name="checkedBooks" value="${it.id }"
									checked="false" /></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<fieldset class="buttons">
				<input type="submit" value="Return books!" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>