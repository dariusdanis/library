<%@ page import="com.tieto.User"%>

<div
	class="fieldcontain ${hasErrors(bean: user, field: 'email', 'error')}">
	<label for="email"> Email </label>
	<g:field type="email" required="" id="email" name="email"
		value="${user?.email}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: user, field: 'name', 'error')}">
	<label for="name"> Name </label>
	<g:textField required="" id="name" name="name" value="${user?.name}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: user, field: 'surname', 'error')}">
	<label for="surname"> Surname </label>
	<g:textField required="" id="surname" name="surname"
		value="${user?.surname}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: user, field: 'personalNo', 'error')}">
	<label for="personalNo"> Personal No. </label>
	<g:textField required="" id=" personalNo" name="personalNo"
		value="${user?.personalNo}" />
</div>

<div
	class="dateOfBirth ${hasErrors(bean: user, field: 'dateOfBirth', 'error')}">
	<label for="dateOfBirth"> Birth date</label>
	<g:datePicker id="dateOfBirth" name="dateOfBirth" precision="day"
		value="${user?.dateOfBirth}" years="${1930..2013}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: user, field: 'password', 'error')}">
	<label for="password"> Password </label>
	<g:passwordField required="" id="password" name="password"
		value="${user?.password}" />
</div>
