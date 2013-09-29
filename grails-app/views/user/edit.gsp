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
				<g:each in="${flash.message}">
					<div class="message">
						${it}
					</div>
				</g:each>
				${flash.clear()}
			</g:if>

			<g:form action="update" method="post">
				<fieldset class="form">
					<div class="fieldcontain">
						<label for="email"> Email: </label> <input type="text" id="email"
							name="email" value="${user.email}" />
					</div>

					<div class="fieldcontain">
						<label for="name"> Name: </label> <input type="text" id="name"
							name="name" value="${user.name}" />
					</div>

					<div class="fieldcontain">
						<label for="surname"> Surname: </label> <input type="text"
							id="surname" name="surname" value="${user.surname}" />
					</div>

					<div class="fieldcontain">
						<label for="personalNo"> Personal No.: </label> <input type="text"
							id=" personalNo" name="personalNo" value="${user.personalNo}" />
					</div>

					<div class="dateOfBirth">
						<label for="dateOfBirth"> Birth date: </label>
						<g:datePicker id="dateOfBirth" name="dateOfBirth" precision="day"
							value="${user.dateOfBirth}" />
					</div>

					<div class="fieldcontain">
						<label for="password"> Password: </label> <input type="text"
							id="password" name="password" value="${user.password}" />
					</div>


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
