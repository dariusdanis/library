package com.tieto

import javax.persistence.JoinTable;



class Book {

	static hasMany = [authors: Author]
	static belongsTo = [user: User]
	Date yearOfRelease
	String name
	String ISBN

	static constraints = {
		user(nullable: true)
		yearOfRelease(max: new Date())
		name(blank: false, nullable: false, size : 1..50)
		ISBN(blank: false, nullable: false, matches: "^((97(8|9))-)?\\d{10}", unique: true)
	}

	String toString(){
		"${name}"
	}

}
