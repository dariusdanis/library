<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>
	<div class="content">
		<g:if test="${session?.user?.admin}">
			<div class="nav">
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
							<th>
								${action}
							</th>
						</g:if>
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
							<g:if test="${ session?.user != null && !"Owner".equals(action)}">
								<td><g:checkBox name="checkedBooks" value="${it.id }"
										checked="false" /></td>
							</g:if>
							<g:elseif test="${session?.user != null}">
								<td><g:link action="show" id="${it.user?.id }" controller="user">
										${it?.user?.name }
									</g:link></td>
							</g:elseif>
						</tr>

					</g:each>
				</tbody>
			</table>
			<g:if test="${ session?.user != null && !"Owner".equals(action)}">
				<fieldset class="buttons">
					<input type="submit" value="Take books" />
				</fieldset>
			</g:if>
		</g:form>
	</div>
</body>
</html>
