package com.learning.myspring.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class DemoApplication {
	
	@RequestMapping("/h")
	public String home() {
	  return "Hello";
	}
	
	public static void main(String[] args) {
		System.out.println( "Hello World ! App!" );  //这和Web没有关系，现在Spring的入口是Run
		//SpringApplication.run(DemoApplication.class, args);
	}

}
