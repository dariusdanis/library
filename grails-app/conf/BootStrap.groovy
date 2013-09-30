import com.tieto.Author;
import com.tieto.Book
import com.tieto.User;

import grails.util.Environment;
import grails.util.GrailsUtil

class BootStrap {

	def init = { servletContext ->
		if (Environment.DEVELOPMENT) {
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
					dateOfBirth: new GregorianCalendar( 1800, Calendar.JUNE, 1 ).time,
					email: "jonas@gmail.com",
					name: "Jonas",
					password: "jonas",
					personalNo: "12345678911",
					surname: "Jonas"
					)
			user.save()

			
			def user2 = new User(
					dateOfBirth: new GregorianCalendar( 1945, Calendar.JULY, 1 ).time,
					email: "tomas@gmail.com",
					name: "Tomas",
					password: "tomas",
					personalNo: "12345678912",
					surname: "Tomas"
					)
			user2.save()

			def user3 = new User(
					role: "admin",
					dateOfBirth: new GregorianCalendar( 1785, Calendar.JANUARY, 1 ).time,
					email: "admin@admin.com",
					name: "Admin",
					password: "admin",
					personalNo: "12345678913",
					surname: "Admin"
					)
			user3.save()

			def book = new Book(
					ISBN: "978-1933988931",
					name: "Food : from farm to fork statistics",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time,
					user: user2
					)
			book.authors = new ArrayList<Author>()
			book.authors.add(author2)
			book.authors.add(author)
			book.save()

			def book2 = new Book(
					ISBN: "978-1933988920",
					name: "Annual report 2012",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time,
					user: user3
					)
			book2.authors = new ArrayList<Author>()
			book2.authors.add(author)
			book2.save()

			def book3 = new Book(
					ISBN: "978-1933988921",
					name: "The European Union and the BRIC countries",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time,
					user: user
					)
			book3.authors = new ArrayList<Author>()
			book3.authors.add(author3)
			book3.authors.add(author)
			book3.save()

			def book4 = new Book(
					ISBN: "978-1933988922",
					name: "The international role of the euro",
					yearOfRelease: new GregorianCalendar( 1975, Calendar.DECEMBER, 1 ).time,
					user: user
					)
			book4.authors = new ArrayList<Author>()
			book4.authors.add(author3)
			book4.authors.add(author2)
			book4.save()

			def book5 = new Book(
					ISBN: "978-1933988923",
					name: "Risk assessment of the European banking system",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time,
					user: user3
					)
			book5.authors = new ArrayList<Author>()
			book5.authors.add(author)
			book5.save()

			def book6 = new Book(
					ISBN: "978-1933988924",
					name: "Investing in social Europe",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time
					)
			book6.authors = new ArrayList<Author>()
			book6.authors.add(author3)
			book6.authors.add(author2)
			book6.save()

			def book7 = new Book(
					ISBN: "978-1933988925",
					name: "Social economy and social entrepreneurship",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.MAY, 1 ).time
					)
			book7.authors = new ArrayList<Author>()
			book7.authors.add(author)
			book7.save()

			def book8 = new Book(
					ISBN: "978-1933988926",
					name: "Cohesion policy after 2013",
					yearOfRelease: new GregorianCalendar( 1985, Calendar.APRIL, 1 ).time
					)
			book8.authors = new ArrayList<Author>()
			book8.authors.add(author3)
			book8.authors.add(author)
			book8.save()
		}
	}

	def destroy = {
	}
}
