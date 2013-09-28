package com.tieto

class SecurityFilters {

	def filters = {
		adminOnly(controller:'*',
		action:"(create|edit|update|delete|save|listall|add)") {
			before = {
				if(!session?.user?.admin){
					flash.message = "Sorry, admin only"
					redirect(uri:'/')
					return false
				}
			}
		}
		
		listUsers(controller:'user',
		action:"(list|show)") {
			before = {
				if(!session?.user?.admin){
					flash.message = "Sorry, admin only"
					redirect(uri:'/')
					return false
				}
			}
		}

		userOnly(controller:'*',
		action:"(take|giveBack|mybooks|logout)") {
			before = {
				if(!session?.user){
					flash.message = "Sorry, user only"
					redirect(controller:"user", action:"login")
					return false
				}
			}
		}

		login(controller:'user',
		action:"(login|registerAndLogIn|register|authenticate)") {
			before = {
				if(session?.user){
					flash.message = "You are already"
					redirect(uri:'/')
					return false
				}
			}
		}
	}
}
