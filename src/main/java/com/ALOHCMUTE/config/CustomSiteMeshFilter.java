package com.ALOHCMUTE.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter{
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/login", "/decorators/login.jsp")
		.addDecoratorPath("/home", "/decorators/home.jsp")
		.addDecoratorPath("/homeweb", "/decorators/web.jsp")
		.addDecoratorPath("/add", "/decorators/home.jsp")
		.addDecoratorPath("/edit/*", "/decorators/home.jsp")
		.addDecoratorPath("/message", "/decorators/message.jsp")
		.addDecoratorPath("/message/receiverId*", "/decorators/message.jsp")
		.addDecoratorPath("/message/findUserName*", "/decorators/message.jsp")
        .addDecoratorPath("/profile", "/decorators/home.jsp")
		.addDecoratorPath("/profile/*", "/decorators/home.jsp")
		.addDecoratorPath("/comments/*", "/decorators/home.jsp")
        .addDecoratorPath("/registration", "/decorators/registration.jsp")

		
		.addDecoratorPath("/admin/*", "admin.jsp")
		.addExcludedPath("/login*").addExcludedPath("/login/*")
		.addExcludedPath("/alogin*").addExcludedPath("/alogin/*")
		.addExcludedPath("/api/**").addExcludedPath("/api/**");
	}
}