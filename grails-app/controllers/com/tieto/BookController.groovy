package com.tieto

import org.springframework.dao.DataIntegrityViolationException

class BookController {

	def list = {
		def books = Book.findAllWhere(user: null)
		[books : books]
	}

	def add = {
		[authors: Author.findAll()]
	}

	def take() {
		def selectedBooks = Book.getAll(params.list('checkedBooks'))
		for (result in selectedBooks) {
			result.user = session.user
			result.save()
		}
		redirect(uri:'/')
	}

	def listall() {
		[books : Book.getAll()]
	}
	
	def save() {
		def book = new Book(
				ISBN: params.ISBN,
				name: params.name,
				yearOfRelease: params.date
				)

		if (!book.validate()) {
			def listOfErrors = new ArrayList();
			book.errors.allErrors.each {
				listOfErrors.add(message(code: 'default.bad.'+ it.getArguments()[0] + '.message'));
			}
			flash.message = listOfErrors
			render(view:"add", model : [book : book, authors : Author.findAll()])
		} else {
			book.authors = Author.getAll(params.list('checkedAuthors'))
			book.save()
			redirect(action: "show", id: book.id);
		}
	}

	def show(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "Book dosn't exist!"
			redirect(action: "list")
			return
		}
		[book: book]
	}

	def edit(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "Book dosn't exist!"
			redirect(action: "list")
			return
		}
		[book: book, authors: Author.findAll()]
	}

	def update(Long id, Long version) {
		def listOfErrors = new ArrayList();
		def book = Book.get(id)
		if (!book) {
			flash.message = "Book dosn't exist!"
			redirect(action: "list")
			return
		}
		if (version != null) {
			if (book.version > version) {
				listOfErrors.add(message(code: 'default.book.optimistic.locking.failure'))
				flash.message=listOfErrors
				render(view: "edit", model: [book: book, authors: Author.findAll()])
				return
			}
		}
		book.properties = params
		book.authors = Author.getAll(params.list('checkedAuthors'))
		if (!book.save(flush: true)) {
			book.errors.allErrors.each {
				listOfErrors.add(message(code: 'default.bad.'+ it.getArguments()[0] + '.message'))
			}
			flash.message = listOfErrors
			render(view: "edit", model: [book: book, authors: Author.findAll()])
			return
		}
		flash.message = "Book " + book.name + " was updated successfully"
		redirect(action: "show", id: book.id)
	}

	def delete(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "Book dosn't exist!"
			redirect(action: "list")
			return
		}
		try {
			book.delete(flush: true)
			flash.message = "Book successfully deleted"
			redirect(action: "list")
		} catch (DataIntegrityViolationException e) {
			flash.message = "Book could not be deleted"
			redirect(action: "show", id: id)
		}
	}

}
