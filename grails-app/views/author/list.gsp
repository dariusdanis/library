<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>

	<g:if test="${session?.user?.admin}">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="author" action="add">
                    New author
                </g:link></li>
			</ul>
		</div>
	</g:if>
	   <g:if test="${flash.message}">
        <div class="message">
            ${flash.message}
        </div>
    </g:if>
	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Surname</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${authors}">
				<tr>
					<td>
					   <g:link action="show" id="${it.id }" controller="author">${it.name }</g:link>
					</td>
					<td>
						<g:link action="show" id="${it.id }" controller="author">${it.surname }</g:link>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>

</body>
</html>