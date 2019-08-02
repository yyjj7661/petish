package com.community.petish.user.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.community.petish.user.exception.AuthenticationException;
import com.community.petish.user.exception.PasswordNotMatchException;
import com.community.petish.user.exception.UserNotFoundException;

@RestControllerAdvice
public class UserRestControllerAdvice {

	@ExceptionHandler(AuthenticationException.class)
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	public void authenticationExceptionHandler(AuthenticationException ex) {
		
	}
	
	@ExceptionHandler(UserNotFoundException.class)
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public void userNotFoundExceptionHandler(UserNotFoundException ex) {
		
	}
	
	@ExceptionHandler(PasswordNotMatchException.class)
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	public void passwordNotMatchExceptionHandler(PasswordNotMatchException ex) {
		
	}
	
}
