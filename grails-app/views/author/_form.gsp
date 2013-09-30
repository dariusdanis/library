<%@ page import="com.tieto.Author"%>
<div
	class="fieldcontain ${hasErrors(bean: book, field: 'name', 'error')}">
	<label> Name: </label>
	<g:textField id="name" name="name" required="" value="${author?.name}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: book, field: 'surname', 'error')}">
	<label> Surname: </label>
	<g:textField id="surname" name="surname" required=""
		value="${author?.surname }" />
</div>