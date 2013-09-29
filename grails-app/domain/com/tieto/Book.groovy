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
		yearOfRelease(validator: {
			return it?.before(new Date())
		})
		name(blank: false, nullable: false, size : 1..50)
		ISBN(blank: false, nullable: false, matches: "^((97(8|9))-)?\\d{10}", unique: true)
	}

	String toString(){
		name
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Book) {
			if (((Book)obj).id == id) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return id;
	}
}
