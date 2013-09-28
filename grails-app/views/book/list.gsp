<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>
	<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="book" action="add">
                    New book
                </g:link></li>
			</ul>
		</div>
	</g:if>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>

	<g:form action="take" method="post">
		<table class="table">
			<thead>
				<tr>
					<th>Title</th>
					<th>Release year</th>
					<g:if test="${ session?.user != null }">
						<th>Take</th>
					</g:if>
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
						<g:if test="${ session?.user != null }">
							<td><g:checkBox name="checkedBooks" value="${it.id }"
									checked="false" /></td>
						</g:if>
					</tr>

				</g:each>
			</tbody>
		</table>
		<g:if test="${ session?.user != null }">
			<fieldset class="buttons">
				<input type="submit" value="Take books" />
			</fieldset>
		</g:if>
	</g:form>
</body>
</html>
