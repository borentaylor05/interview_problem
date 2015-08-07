
var app = angular.module("App",[]);

app.factory("users", function($http){
	var u = {};

	u.create = function(user){
		return $http.post("/users", user);
	};

	return u;
});

app.controller("UserCtrl", function(users){
	var u = this;

	u.create = function(user){
		users.create(user).success(function(resp){
			if(resp.status == 200){
				u.info = JSON.stringify(resp.user);
				u.link = "/users";
			}
		});
	};

	u.validSSN = function(ssn){
		if(ssn){
			if((parseInt(ssn) && ssn.length.toString().length === 9 ) || ssn.match(/^(\d{3}-?\d{2}-?\d{4}|XXX-XX-XXXX)$/i))
				return true; 
			else
				return false;
		}		
		return false;
	};

	u.validEmail = function(email){
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(email && email.match(regex))
			return true;
		else
			return false;
	};

	u.formInvalid = function(user){
		if(user){
			if(!u.validEmail(user.email) || !u.validSSN(user.social_security_number))
				return true;
			else
				return false;
		}		
	}

});