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
	left: 339px;
	top: 103px;
}
</style>
</head>
<body>
	<div class="content scaffold-create" role="main">
		<h1>New author</h1>
		<g:if test="${flash.message}">
			<g:each in="${flash.message}">
				<div class="message">
					${it}
				</div>
			</g:each>
			${flash.clear()}
		</g:if>
		<g:form action="save" method="post">
			<fieldset class="form">
				<div class="fieldcontain">
					<label> Name: </label> <input type="text" id="name" name="name"
						value="${author?.name}" />
				</div>

				<div class="fieldcontain">
					<label> Surname: </label> <input type="text" id="surname"
						name="surname" value="${author?.surname }" />
				</div>

				<div class="fieldcontain">
					<label> Authors: </label> <select id="books"
						multiple="multiple" title="Click to Select Book"
						name="checkedBooks">
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
</body>
</html>