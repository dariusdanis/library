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
    	yearOfRelease(blank: false, nullable: false)
		name(blank: false, nullable: false, size : 1..100)
		ISBN(blank: false, nullable: false, matches: "ISBN(-1(?:(0)|3))?:?\\x20(\\s)*[0-9]+[- ][0-9]+[- ][0-9]+[- ][0-9]*[- ]*[xX0-9]") 
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
	
}
