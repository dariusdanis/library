<%@ page import="com.tieto.Book"%>

<div
	class="fieldcontain ${hasErrors(bean: book, field: 'name', 'error')}">
	<label> Name: </label>
	<g:textField required="" id="name" name="name" value="${book?.name}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: book, field: 'ISBN', 'error')}">
	<label> ISBN: </label>
	<g:textField required="" name="ISBN" id="ISBN" value="${book?.ISBN }" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: book, field: 'yearOfRelease', 'error')}">
	<label> Release date: </label>
	<g:datePicker class="test" name="yearOfRelease" years="${1930..2013}"
		value="${book?.yearOfRelease}" precision="day" />
</div>