//HelloController.java
package com.learning.myspring.HelloController;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration
public class HelloController {
    @RequestMapping("/")
    @ResponseBody
    String home(){
        return "Hello Here is Spring";
    }
    public static void main(String[] args) {
        SpringApplication.run(HelloController.class,args);
    }
}