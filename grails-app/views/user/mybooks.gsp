<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<g:form action="giveBack" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>Title</th>
					<th>Release year</th>
					<th>Give back</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${books}">
					<tr>
						<td><g:link action="show" id="${it.id }" controller="book">
								${it.name }
							</g:link></td>
						<td><g:link action="show" id="${it.id }" controller="book">
								${it.yearOfRelease.format('yyyy-MM-dd') }
							</g:link></td>
						<td><g:checkBox name="checkedBooks" value="${it.id }"
								checked="false" /></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<fieldset class="buttons">
			<input type="submit" value="Give back books!" />
		</fieldset>
	</g:form>
</body>
</html>