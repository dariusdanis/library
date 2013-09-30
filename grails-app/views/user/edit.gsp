<%=packageName%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	top: 274px;
}
</style>
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
		<div class="info">
			<h1>Edit</h1>

			<g:if test="${flash.message}">
					<div class="message">
						  ${flash.message}
					</div>
				${flash.clear()}
			</g:if>
			
			<g:hasErrors bean="${user}">
				<ul class="errors" role="alert">
					<g:eachError bean="${user}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form action="update" method="post">
				<fieldset class="form">
					<g:render template="form"/>
					<div class="fieldcontain">
						<label> Books: </label> <select id="books" multiple="multiple"
							title="Click to Select Book" name="checkedBooks">
							<g:each in="${availableBooks}">
								<option value="${it.id}">
									${it}
								</option>
							</g:each>
							<g:each in="${userBooks}">
								<option selected="selected" value="${it.id}">
									${it}
								</option>
							</g:each>

						</select>
					</div>
				</fieldset>
				<g:hiddenField name="id" value="${user.id }" />
				<g:hiddenField name="version" value="${user.version }" />
				<fieldset class="buttons">
					<input type="submit" value="Update" />
					<g:actionSubmit action="delete" value="Delete" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
