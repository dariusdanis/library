<html>
<head>

<title>Stateful Array Grid Example</title>
<meta name="layout" content="main" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/ext-3.4.1/resources/css', file: 'ext-all.css') }" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/ext-3.4.1/gridfilters/css', file: 'GridFilters.css')}" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'js/ext-3.4.1/gridfilters/css', file: 'RangeMenu.css')}" />

<g:javascript src="ext-3.4.1/adapter/ext/ext-base.js"></g:javascript>
<g:javascript src="ext-3.4.1/ext-all.js"></g:javascript>
<!-- extensions -->
<g:javascript src="ext-3.4.1/gridfilters/menu/RangeMenu.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/menu/ListMenu.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/GridFilters.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/Filter.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/StringFilter.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/DateFilter.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/ListFilter.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/NumericFilter.js"></g:javascript>
<g:javascript src="ext-3.4.1/gridfilters/filter/BooleanFilter.js"></g:javascript>
<g:javascript src="grid.js"></g:javascript>
</head>
<body>
	<div class="content">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>

		<div id="grid"></div>
	</div>
</body>
</html>