import com.tieto.Author;
import com.tieto.Book
import com.tieto.User;

import grails.util.GrailsUtil

class BootStrap {

	def init = { servletContext ->
		def author = new Author(
				name: "William",
				surname: "Shakespeare",
				)
		author.save()

		def author2 = new Author(
				name: "Agatha",
				surname: "Christie",
				)
		author2.save()

		def author3 = new Author(
				name: "Barbara",
				surname: "Cartland",
				)
		author3.save()
		
		def user = new User(
				dateOfBirth: new Date(),
				email: "jonas@gmail.com",
				name: "Jonas",
				password: "jonas",
				personalNo: "12345678912",
				surname: "Jonas"
				)
		user.save()

		def user2 = new User(
				dateOfBirth: new Date(),
				email: "tomas@gmail.com",
				name: "Tomas",
				password: "tomas",
				personalNo: "12345678912",
				surname: "Tomas"
				)
		user2.save()

		def user3 = new User(
				role: "admin",
				dateOfBirth: new Date(),
				email: "admin@admin.com",
				name: "Admin",
				password: "admin",
				personalNo: "12345678912",
				surname: "Admin"
				)
		user3.save()

		def book = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Food : from farm to fork statistics",
				yearOfRelease: new Date(),
				user: user2
				)
		book.authors = new ArrayList<Author>()
		book.authors.add(author2)
		book.authors.add(author)
		book.save()

		def book2 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Annual report 2012",
				yearOfRelease: new Date(),
				user: user3
				)
		book2.authors = new ArrayList<Author>()
		book2.authors.add(author)
		book2.save()

		def book3 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "The European Union and the BRIC countries",
				yearOfRelease: new Date(),
				user: user
				)
		book3.authors = new ArrayList<Author>()
		book3.authors.add(author3)
		book3.authors.add(author)
		book3.save()

		def book4 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "The international role of the euro",
				yearOfRelease: new Date().calendarDate,
				user: user
				)
		book4.authors = new ArrayList<Author>()
		book4.authors.add(author3)
		book4.authors.add(author2)
		book4.save()

		def book5 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Risk assessment of the European banking system",
				yearOfRelease: new Date()
				)
		book5.authors = new ArrayList<Author>()
		book5.authors.add(author)
		book5.save()

		def book6 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Investing in social Europe",
				yearOfRelease: new Date()
				)
		book6.authors = new ArrayList<Author>()
		book6.authors.add(author3)
		book6.authors.add(author2)
		book6.save()

		def book7 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Social economy and social entrepreneurship",
				yearOfRelease: new Date()
				)
		book7.authors = new ArrayList<Author>()
		book7.authors.add(author)
		book7.save()

		def book8 = new Book(
				ISBN: "ISBN-13 978-3-642-11746-6",
				name: "Cohesion policy after 2013",
				yearOfRelease: new Date()
				)
		book8.authors = new ArrayList<Author>()
		book8.authors.add(author3)
		book8.authors.add(author)
		book8.save()
	}

	def destroy = {
	}
}
