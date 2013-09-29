package com.tieto


import grails.converters.JSON;

import org.json.simple.JSONArray;
import org.springframework.dao.DataIntegrityViolationException

class UserController {

	def register = {}

	def login = {}

	def list = {}

	def registerAndLogIn() {
		def user = new User(dateOfBirth: params.dateOfBirth,
		email: params.email,
		name: params.name,
		password: params.password,
		personalNo: params.personalNo,
		surname: params.surname)

		if (!user.validate()) {
			def listOfErrors = new ArrayList();
			user.errors.allErrors.each {
				listOfErrors.add(message(code: 'default.'+ it.getCode() +'.'+ it.getArguments()[0] + '.message'));
			}
			flash.message = listOfErrors
			render(view:"register", model : [user : user])
		} else {
			user.save(flush: true)
			session.user = user
			flash.message = "Hello ${user.name}!"
			redirect(uri:'/')
		}
	}

	def authenticate() {
		def user = User.findByEmailAndPassword(
				params.email, params.password)
		if(user){
			session.user = user
			flash.message = "Hello ${user.name}!"
			redirect(uri:'/')
		} else{
			flash.message = "Sorry, ${params.email}. Please try again."
			render(view:"login", model : [email : params.email])
		}
	}

	def logout() {
		flash.message = "Goodbye ${session.user.name}"
		session.user = null
		redirect(action:"login")
	}

	def mybooks() {
		def books = Book.findAllWhere(user: session.user)
		[books: books]
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
			flash.message = "User dosn't exist!"
			redirect(action: "list")
			return
		}
		[user: user]
	}

	def edit(Long id) {
		def user = User.get(id)
		if (!user) {
			flash.message = "User dosn't exist!"
			redirect(action: "list")
			return
		}
		[user: user, availableBooks : Book.findAllWhere(user : null), userBooks : Book.findAllWhere(user : user)]
	}

	def update(Long id, Long version){
		def listOfErrors = new ArrayList();
		def user = User.get(id)
		if (!user) {
			flash.message = "User dosn't exist!"
			redirect(action: "list")
			return
		}
		if (version != null) {
			if (user.version > version) {
				listOfErrors.add(message(code: 'default.user.optimistic.locking.failure'))
				flash.message=listOfErrors
				render(view: "edit", model: [user: user, availableBooks : Book.findAllWhere(user : null), userBooks : Book.findAllWhere(user : user)])
				return
			}
		}

		user.properties = params
		Book.findAllWhere(user : user).each { it.user = null }
		Book.getAll(params.list('checkedBooks')).each { it.user = user }

		if (!user.save(flush: true)) {
			user.errors.allErrors.each {
				listOfErrors.add(message(code: 'default.'+ it.getCode() +'.'+ it.getArguments()[0] + '.message'));
			}
			flash.message = listOfErrors
			render(view: "edit", model: [user: user, availableBooks : Book.findAllWhere(user : null), userBooks : Book.findAllWhere(user : user)])
			return
		}

		flash.message = "User " + user.name + " was updated successfully"
		redirect(action: "show", id: user.id)
	}

	def delete(Long id) {
		def user = User.get(id)
		if (!user) {
			flash.message = "User dosn't exist!"
			redirect(action: "list")
			return
		}
		try {
			user.books.each {it.user = null}

			user.delete(flush: true)
			if (user.equals(session.user)) {
				logout()
				return;
			}

			flash.message = "User successfully deleted"
			redirect(action: "list")
		} catch (DataIntegrityViolationException e) {
			flash.message = "User could not be deleted"
			redirect(action: "show", id: id)
		}
	}

	def userJson = {
		def user = User.findAll("from User as u where u.books.size > 1")
		JSON.registerObjectMarshaller(User) {
			def array = [:]
			array['id'] = it.id
			array['email'] = it.email
			array['name'] = it.name
			array['surname'] = it.surname
			array['dateOfBirth'] = it.dateOfBirth.format('yyyy-MM-dd')
			array['personalNo'] = it.personalNo
			return array
		}
		def listResult = [items: user]
		render listResult as JSON
	}

	def bookJson(Long id) {
		def user = User.get(id)
		if (!user) {
			return
		}
		JSON.registerObjectMarshaller(Book) {
			def array = [:]
			array['name'] = it.name
			array['ISBN'] = it.ISBN
			array['yearOfRelease'] = it.yearOfRelease.format('yyyy-MM-dd')
			array['id'] = it.id
			return array
		}
		def books = Book.findAllWhere(user: user)
		def listResult = [items: books]
		render listResult as JSON
	}
}
