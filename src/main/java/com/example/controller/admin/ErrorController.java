package com.example.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.exception.HTTP404Exception;
import com.example.exception.HTTP500Exception;
import com.example.helper.PageTypeEnum;

@Controller
@RequestMapping(value = "error/admin")
public class ErrorController {

	@RequestMapping(value = "/500")
	@ExceptionHandler(HTTP500Exception.class)
	public String handle500NotFoundException(HTTP500Exception ex) {
		System.err.println(ex.getErrorMessage());
		return PageTypeEnum.ADMIN_ERROR_500.type;
	}

	@RequestMapping(value = "/404")
	@ExceptionHandler(HTTP404Exception.class)
	public String handle404NotFoundException(HTTP404Exception ex) {
		System.err.println(ex.getErrorMessage());
		return PageTypeEnum.ADMIN_ERROR_404.type;
	}
}
