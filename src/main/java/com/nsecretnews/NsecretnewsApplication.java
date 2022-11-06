package com.nsecretnews;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@SpringBootApplication
public class NsecretnewsApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(NsecretnewsApplication.class, args);
		// new SpringApplicationBuilder(NsecretnewsApplication.class).build().run(args);
	}
}
