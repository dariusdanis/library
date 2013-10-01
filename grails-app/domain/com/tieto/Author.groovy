package com.tieto

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
		"${name} ${surname}"
	}

}
