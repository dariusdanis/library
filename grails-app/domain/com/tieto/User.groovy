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
		email(blank: false, nullable: false, unique: true, email: true, size: 1..50)
		name(blank:false, size: 1..50)
		surname(blank:false, size: 1..50)
		dateOfBirth (max: new Date())
		password(blank: false, nullable: false, size: 5..50)
		personalNo (unique: true,  validator: {
			return (it.isNumber()) && (it.length() == 11)
		})
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
	
	@Override
	public int hashCode() {
		return id;
	}
}
