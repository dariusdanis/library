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
			<form action="save" method="post">
				<fieldset>
					<div
						class="fieldcontain ${hasErrors(bean: book, field: 'name', 'error')}">
						<label> Name: </label>
						<g:textField required="" id="name" name="name"
							value="${book?.name }" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: book, field: 'ISBN', 'error')}">
						<label> ISBN: </label>
						<g:textField required="" name="ISBN" id="ISBN"
							value="${book?.ISBN }" />
					</div>
					<div
						class="fieldcontain ${hasErrors(bean: book, field: 'yearOfRelease', 'error')}">
						<label> Release date: </label>
						<g:datePicker class="test" id="yearOfRelease" name="yearOfRelease"
							years="${1930..2013}" precision="day"
							value="${book?.yearOfRelease }" />
					</div>

					<div class="fieldcontain">
						<label for="lastName"> Authors: </label> <select id="authors"
							multiple="multiple" title="Click to Select Author"
							name="checkedAuthors">
							<g:each in="${authors}">
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
			</form>
		</div>
	</div>
</body>
</html>