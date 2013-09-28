<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link action="list">
                    Back to list!
                </g:link></li>
		</ul>
	</div>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<div class="content scaffold-create" role="main">
		<h1>User</h1>
		<fieldset class="form">
			<div class="fieldcontain">
				<label class="property-label"> Email: </label> <span
					class="property-value"> ${user.email }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Name: </label> <span
					class="property-value"> ${user.name }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Surname: </label> <span
					class="property-value"> ${user.surname }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Personal No.: </label> <span
					class="property-value"> ${user.personalNo }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Birth date: </label> <span
					class="property-value"> ${user.dateOfBirth.format('yyyy-MM-dd') }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Password: </label> <span
					class="property-value"> ${user.password }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Role: </label> <span
					class="property-value"> ${user.role }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Books: </label>
				<g:each in="${user.books }">
					<g:link action="show" id="${it.id }" controller="book">
						<span class="info"> ${it}
						</span>
					</g:link>
				</g:each>
			</div>
		</fieldset>
	</div>
	<g:form>
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${user.id}" />
			<g:link action="edit" controller="user" id="${user.id}">
				<g:message code="default.button.edit.label" default="Edit" />
			</g:link>
			<g:actionSubmit action="delete" value="Delete" />
		</fieldset>
	</g:form>
</body>
</html>
