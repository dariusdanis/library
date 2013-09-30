package com.tieto

import org.springframework.dao.DataIntegrityViolationException

class AuthorController {

	def list = {
		[authors : Author.findAll()]
	}

	def add = {
		[books : Book.findAll()]
	}

	def save() {
		def author = new Author(params)
		Book.getAll(params.list('checkedBooks')).each {
			it.authors.add(author)
		}
		if (!author.save(flush: true)) {
			render(view:"add", model : [author : author, books : Book.findAll()])
			return;
		}
		flash.message="Author added successfully"
		redirect(action: "show", id: author.id);
	}

	def show(Long id) {
		def author = Author.get(id)
		if (!author) {
			flash.message = "Author dosn't exist!"
			redirect(action: "list")
			return
		}
		[author: author]
	}

	def edit(Long id) {
		def author = Author.get(id)
		if (!author) {
			flash.message = "Author dosn't exist!"
			redirect(action: "list")
			return
		}
		[author: author, books: Book.getAll()]
	}

	def update(Long id, Long version) {
		def listOfErrors = new ArrayList();
		def author = Author.get(id)
		if (!author) {
			flash.message = "Author dosn't exist!"
			redirect(action: "list")
			return
		}
		if (version != null) {
			if (author.version > version) {
				flash.message=message(code: 'default.author.optimistic.locking.failure')
				render(view: "edit", model: [author: author])
				return
			}
		}
		author.properties = params
		Book.getAll(author.books*.id).each {
			it.authors.remove(author)
		}
		Book.getAll(params.list('checkedBooks')).each {
			it.authors.add(author)
		}
		if (!author.save(flush: true)) {
			render(view: "edit", model: [author: author])
			return
		}
		flash.message = "Author " + author.name + " " + author.surname + " was updated successfully"
		redirect(action: "show", id: author.id)
	}

	def delete(Long id) {
		def author = Author.get(id)
		if (!author) {
			flash.message = "Book dosn't exist!"
			redirect(action: "list")
			return
		}
		try {
			author.books.each {
				it.authors.remove(author)
			}
			author.books.clear()
			author.delete(flush: true)
			flash.message = "Author successfully deleted"
			redirect(action: "list")
		} catch (DataIntegrityViolationException e) {
			flash.message = "Book could not be deleted"
			redirect(action: "show", id: id)
		}
	}
}
