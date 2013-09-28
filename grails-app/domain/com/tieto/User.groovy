package com.tieto

import grails.converters.JSON

class User {

	static hasMany = [books: Book]
	static transients = ['admin']
	
	String email
	String name
	String surname
	String personalNo
	Date dateOfBirth
	String password
	String role = "user"

	static constraints = {
		email(blank: false, nullable: false, unique: true, email: true, size: 1..100)
		name(blank:false, size: 1..100)
		surname(blank:false, size: 1..100)
		dateOfBirth(blank: false)
		password(blank: false, nullable: false, size: 1..100)
		personalNo validator: { obj ->
			return (obj.isNumber()) && (obj.toString().length() == 11)
		}
	}
	
	static mapping = {
		books cascade: 'none'
	}
	
	boolean isAdmin(){
		return role == "admin"
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof User) {
			if (((User)obj).id == id) {
				return true;
			}
		}
		return false;
	}
}
