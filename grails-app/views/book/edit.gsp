<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
<script type="text/javascript">
	//<![CDATA[

	jQuery(function($) {

		$("#authors").bsmSelect({
			addItemTarget : 'bottom',
			animate : true,
			highlight : true,
			plugins : [ $.bsmSelect.plugins.sortable({
				axis : 'y',
				opacity : 0.5
			}, {
				listSortableClass : 'bsmListSortableCustom'
			}), $.bsmSelect.plugins.compatibility() ]
		});

	});

	//]]>
</script>
<style type="text/css">
.bsmSelect {
	position: absolute;
	width: 222px;
	left: 256px;
	top: 148px;
}
</style>
</head>
<body>
	<div class="content">
		<div class="nav">
			<ul>
				<li><g:link action="list">
                    Back to list!
                </g:link></li>
			</ul>
		</div>
		<g:if test="${flash.message}">
			<g:each in="${flash.message}">
				<div class="message">
					${it}
				</div>
			</g:each>
			${flash.clear()}
		</g:if>
		<g:hasErrors bean="${book}">
			<ul class="errors" role="alert">
				<g:eachError bean="${book}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="info">
			<h1>New book</h1>
			<g:form action="update" method="post">
				<fieldset class="fieldcontain"> 
					<g:render template="form" />
					<div class="fieldcontain">
						<label for="lastName"> Authors: </label> <select id="authors"
							multiple="multiple" title="Click to Select Author"
							name="checkedAuthors">
							<g:each in="${authors}">
								<g:if test="${book.authors.contains(it)}">
									<option selected="selected" value="${it.id}">
										${it}
									</option>
								</g:if>
								<g:else>
									<option value="${it.id}">
										${it}
									</option>
								</g:else>
							</g:each>
						</select>
					</div>
				</fieldset>
				<g:hiddenField name="id" value="${book.id }" />
				<g:hiddenField name="version" value="${book.version }" />
				<fieldset class="buttons">
					<input type="submit" value="Update" />
					<g:actionSubmit action="delete" value="Delete" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>