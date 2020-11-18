package com.nsecretnews;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@SpringBootApplication
public class NsecretnewsApplication {

	public static void main(String[] args) {
		SpringApplication.run(NsecretnewsApplication.class, args);
	}
}
