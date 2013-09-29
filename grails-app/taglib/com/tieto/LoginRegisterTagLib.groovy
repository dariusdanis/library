package com.tieto

class LoginRegisterTagLib {
	
	def loginControl = {
		if(request.getSession(false) && session.user){
			out << "Hello ${session.user.name} "
			out << """${link(action:"logout", controller:"user"){"Logout"}}"""
		} else {
			out << """${link(action:"register", controller:"user"){"Register"}}"""
			out << """${link(action:"login", controller:"user"){"Login"}}"""
		}
	}
		
}
