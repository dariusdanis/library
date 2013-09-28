<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>

	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>

	<div id="navMain">
		<h2>Categories:</h2>
		<br />
		<ul>
			<li><g:link action="list" controller="book"> Available books </g:link></li>
			<li><g:link action="list" controller="author"> Authors</g:link></li>
			<g:if test="${session?.user != null}">
				<li><g:link controller="user" action="mybooks"> My books </g:link></li>
			</g:if>

		</ul>
		<br />
		<g:if test="${session?.user?.admin}">
			<h2>Admin meniu:</h2>
			<br />
			<ul>
				<li><g:link controller="user" action="list"> All users </g:link></li>
				<li><g:link controller="book" action="listall"> All Books </g:link></li>
			</ul>
		</g:if>
	</div>
</body>
</html>
