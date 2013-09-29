package com.tieto

import javax.persistence.JoinTable;

class Author {

	static hasMany = [books : Book]
	static belongsTo = [Book]
	String name
	String surname
	
	static constraints = {
		name(blank: false, nullable: false, size: 1..50)
		surname(blank: false, nullable: false, size: 1..50)
	}
	
	@Override
	String toString(){
		name + " " + surname
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Author) {
			if (((Author)obj).id == id) {
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
