package com.tieto


import java.lang.ClassLoader.ParallelLoaders;

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.validator.EmailValidator

class UserController {

	def register = {}

	def login = {}

	def list = {}

	def registerAndLogIn() {
		def user = new User(params)
		if (!user.save(flush: true)) {
			render(view: "register", model: [user: user]);
			return;
		}
		session.user = user
		flash.message = "Hello ${user.name}!"
		redirect(uri:'/')
	}

	def authenticate() {
		def userInfo = new User(params)
		if (EmailValidator.getInstance().isValid(userInfo.email)) {
			def user = User.findByEmailAndPassword(params.email, params.password)
			if(user){
				session.user = user
				flash.message = "Hello ${user.name}!"
				redirect(uri:'/')
			} else {
				flash.message = "The password/username you entered is incorrect!"
				render(view:"login", model : [user: userInfo])
			}
			return;
		}
		userInfo.errors.rejectValue("email", "default.invalid.email.message")
		render(view:"login", model : [user: userInfo])
	}

	def logout() {
		flash.message = "Goodbye ${session.user.name}"
		session.user = null
		redirect(action:"login")
	}

	def mybooks() {
		[books: Book.findAllWhere(user: session.user)]
	}

	def giveBack() {
		def selectedBooks = Book.getAll(params.list('checkedBooks'))
		for (result in selectedBooks) {
			result.user = null
			result.save()
		}
		redirect(action: "mybooks")
	}


	def show(Long id) {
		def user = User.get(id)
		if (!user) {
			flash.message = "This user doesn't exist!"
			redirect(action: "list")
			return
		}
		[user: user]
	}

	def edit(Long id) {
		def user = User.get(id)
		if (!user) {
			flash.message = "This user doesn't exist!"
			redirect(action: "list")
			return
		}
		[user: user, books : Book.findAll()]
	}

	def update(Long id, Long version){
		def user = User.get(id)
		if (!user) {
			flash.message = "This user doesn't exist!"
			redirect(action: "list")
			return
		}
		if (version != null) {
			if (user.version > version) {
				flash.message = message(code: 'default.user.optimistic.locking.failure')
				render(view: "edit", model: [user: user, books : Book.findAll()])
				return
			}
		}

		user.properties = params
		Book.findAllWhere(user : user).each { it.user = null }
		Book.getAll(params.list('checkedBooks')).each { it.user = user }

		if (!user.save(flush: true)) {
			render(view: "edit", model: [user: user, books : Book.findAll()])
			return
		}

		flash.message = "User ${user} was successfully updated!"
		redirect(action: "show", id: user.id)
	}

	def delete(Long id) {
		def user = User.get(id)
		if (!user) {
			flash.message = "This doesn't exist!"
			redirect(action: "list")
			return
		}
		try {
			user.books.each {it.user = null}

			user.delete(flush: true)
			if (id.equals(session.user.id)) {
				logout()
				return;
			}

			flash.message = "The user was successfully deleted!"
			redirect(action: "list")
		} catch (DataIntegrityViolationException e) {
			flash.message = "The user couldn't be deleted!"
			redirect(action: "show", id: id)
		}
	}

	def userJson = {
		JSON.registerObjectMarshaller(User) {
			return [
				id : it.id,
				email : it.email,
				name : it.name,
				surname : it.surname,
				dateOfBirth : it.dateOfBirth.format('yyyy-MM-dd'),
				personalNo : it.personalNo
			]
		}
		def listResult = [items: User.findAll("from User as u where u.books.size > 1")]
		render listResult as JSON
	}

	def bookJson(Long id) {
		def user = User.get(id)
		if (!user) {
			return
		}
		JSON.registerObjectMarshaller(Book) {
			return [
				name : it.name,
				ISBN : it.ISBN,
				yearOfRelease : it.yearOfRelease.format('yyyy-MM-dd'),
				id : it.id
			]
		}
		def listResult = [items: Book.findAllWhere(user: user)]
		render listResult as JSON
	}
}
