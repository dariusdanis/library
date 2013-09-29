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
		<h1>Book</h1>
		<fieldset class="form">
			<div class="fieldcontain">
				<label class="property-label"> Name: </label> <span
					class="property-value"> ${book.name }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Release year: </label> <span
					class="property-value"> ${book.yearOfRelease.format('yyyy-MM-dd') }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> ISBN: </label> <span
					class="property-value"> ${book.ISBN }
				</span>
			</div>
			<div class="fieldcontain">
				<label class="property-label"> Authors: </label>
				<g:each in="${book.authors }">
					<g:link action="show" id="${it.id }" controller="author">
						<span class="info"> ${it}
						</span>
					</g:link>
				</g:each>
			</div>
		</fieldset>
	</div>
	<g:if test="${session?.user?.admin}">
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${book.id}" />
				<g:link action="edit" controller="book" id="${book.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit action="delete" controller="book" value="Delete" />
			</fieldset>
		</g:form>
	</g:if>
	</div>
</body>
</html>