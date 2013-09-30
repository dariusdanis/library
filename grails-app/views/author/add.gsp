<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
<script type="text/javascript">
	//<![CDATA[

	jQuery(function($) {

		$("#books").bsmSelect({
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
	top: 103px;
}
</style>
</head>
<body>
	<div class="content">
		<div class="info">
			<h1>New author</h1>
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${author}">
				<ul class="errors" role="alert">
					<g:eachError bean="${author}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save" method="post">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: author, field: 'name', 'error')}">
						<label> Name: </label>
						<g:textField id="name" name="name" required=""
							value="${author?.name}" />
					</div>

					<div class="fieldcontain ${hasErrors(bean: author, field: 'surname', 'error')}">
						<label> Surname: </label>
						<g:textField id="surname" name="surname" required=""
							value="${author?.surname }" />
					</div>

					<div class="fieldcontain">
						<label> Authors: </label> <select id="books" multiple="multiple"
							title="Click to Select Book" name="checkedBooks">
							<g:each in="${books}">
								<option value="${it.id}">
									${it}
								</option>
							</g:each>
						</select>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<input type="submit" value="Add" />
				</fieldset>

			</g:form>
		</div>
	</div>
</body>
</html>