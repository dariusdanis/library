package com.tieto

import org.springframework.dao.DataIntegrityViolationException

class BookController {

	def list = {
		[books : Book.findAllWhere(user: null), action : "Take"]
	}

	def add = {
		[authors: Author.findAll()]
	}

	def take() {
		def selectedBooks = Book.getAll(params.list('checkedBooks'))
		if (selectedBooks) {
			for (result in selectedBooks) {
				result.user = session.user
				result.save()
			}
			flash.message = "The books was taken successfully!"
			redirect(controller: "user", action: "mybooks")
			return;
		} 
		redirect(action: "list")
	}

	def listall() {
		render(view: "list", model : [books : Book.findAll(), action : "Owner"]);
	}

	def save() {
		def book = new Book(params)
		book.authors = Author.getAll(params.list('checkedAuthors'))
		if (!book.save(flush: true)) {
			render(view:"add", model : [book : book, authors : Author.findAll()])
			return;
		}
		flash.message="The book was successfully added!"
		redirect(action: "show", id: book.id);
	}

	def show(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "This book doesn't exist!"
			redirect(action: "list")
			return
		}
		[book: book]
	}

	def edit(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "This book doesn't exist!"
			redirect(action: "list")
			return
		}
		[book: book, authors: Author.findAll()]
	}

	def update(Long id, Long version) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "This book doesn't exist!"
			redirect(action: "list")
			return
		}
		if (version != null) {
			if (book.version > version) {
				flash.message=message(code: 'default.book.optimistic.locking.failure')
				render(view: "edit", model: [book: book, authors: Author.findAll()])
				return
			}
		}
		book.properties = params
		book.authors = Author.getAll(params.list('checkedAuthors'))
		if (!book.save(flush: true)) {
			render(view: "edit", model: [book: book, authors: Author.findAll()])
			return
		}
		flash.message = "Book ${book.name} was successfully updated!"
		redirect(action: "show", id: book.id)
	}

	def delete(Long id) {
		def book = Book.get(id)
		if (!book) {
			flash.message = "This book doesn't exist!"
			redirect(action: "list")
			return
		}
		try {
			book.delete(flush: true)
			flash.message = "The book was successfully deleted!"
			redirect(action: "list")
		} catch (DataIntegrityViolationException e) {
			flash.message = "The book couldn't  be deleted!"
			redirect(action: "show", id: id)
		}
	}
}
