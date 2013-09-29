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

		<div class="info">
			<h1>New book</h1>
			<form action="save" method="post">
				<fieldset>
					<div class="fieldcontain">
						<label> Name: </label> <input type="text" id="name" name="name"
							value="${book?.name }" />
					</div>
					<div class="fieldcontain">
						<label> ISBN: </label> <input type="text" name="ISBN" id="ISBN"
							value="${book?.ISBN }" />
					</div>
					<div class="fieldcontain">
						<label> Release date: </label>
						<g:datePicker class="test" name="date" years="${1930..2013}"
							precision="day" value="${book?.yearOfRelease }" />
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