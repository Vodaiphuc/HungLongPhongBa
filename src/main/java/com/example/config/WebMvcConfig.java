	package com.example.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.example.interceptor.AuthInterceptor;
import com.example.interceptor.ShopInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor auth;

	@Autowired
	ShopInterceptor shop;

	@Override
	public void configureViewResolvers(final ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		registry.viewResolver(resolver);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
				.addPathPatterns(
						"/admin/dashboard/**", 
						"/admin/user/**", 
						"/admin/category-product/**",
						"/admin/brand/**", 
						"/admin/category-blog/**", 
						"/admin/color/**", 
						"/admin/product/**",
						"/admin/invoice/**",
						"/admin/contact/**",
						"/admin/like/**",
						"/admin/review/**",
						"/admin/statistical/**")
				.excludePathPatterns(
						"/auth/**", 
						"/shop/**");
		registry.addInterceptor(shop)
				.addPathPatterns(
						"/shop/account/change-information/**", 
						"/shop/account/change-password/**",
						"/shop/like/**", 
						"/shop/review/**",
						"/shop/order-history/**")
				.excludePathPatterns(
						"/shop/account/login/**", 
						"/shop/account/register/**",
						"/shop/account/forgot-password/**", 
						"/shop/account/login/**", 
						"/shop/home/**",
						"/shop/product-detail/**", 
						"/shop/shop-category/**", 
						"/shop/cart/**", 
						"/shop/checkout/**",
						"/shop/confirmation/**", 
						"/shop/contact/**",
						"/shop/tracking/**");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		String dirName = "uploads";
		Path uploadDir = Paths.get(dirName);
		String uploadPath = uploadDir.toFile().getAbsolutePath();
		if (dirName.startsWith("../"))
			dirName = dirName.replace("../", "");
		registry.addResourceHandler("/" + dirName + "/**").addResourceLocations("file:/" + uploadPath + "/");
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}
}