package com.ALOHCMUTE;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.ALOHCMUTE.config.CustomSiteMeshFilter;

@SpringBootApplication
public class AlohcmuteApplication {

	public static void main(String[] args) {
		SpringApplication.run(AlohcmuteApplication.class, args);
	}

	@Bean
	public FilterRegistrationBean<CustomSiteMeshFilter> siteMeshFilter() {
		FilterRegistrationBean<CustomSiteMeshFilter> filterRegistrationBean= new FilterRegistrationBean<CustomSiteMeshFilter>();
		filterRegistrationBean.setFilter(new CustomSiteMeshFilter());
		filterRegistrationBean.addUrlPatterns("/*");
		return filterRegistrationBean;
	}
}
