<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>
	<div class="content">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link action="list">
                    Back to list!
                </g:link></li>
			</ul>
		</div>
		<g:if test="${flash.message}">
			<div class="message">
				${
                flash.message
            }
			</div>
		</g:if>
		<div class="info">
			<h1>Author</h1>
			<fieldset class="form">
				<div class="fieldcontain">
					<label class="property-label"> Name: </label> <span
						class="property-value"> ${author.name }
					</span>
				</div>
				<div class="fieldcontain">
					<label class="property-label"> Surname: </label> <span
						class="property-value"> ${author.surname }
					</span>
				</div>
				<div class="fieldcontain">
					<label class="property-label"> Books: </label>
					<g:each in="${author.books }">
						<g:link action="show" id="${it.id }" controller="book">
							<span class="info"> ${it }
							</span>
						</g:link>
					</g:each>
				</div>
			</fieldset>
		</div>
		<g:if test="${session?.user?.admin}">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${author.id}" />
					<g:link action="edit" id="${author.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit action="delete" value="Delete" />
				</fieldset>
			</g:form>
		</g:if>
	</div>
</body>
</html>