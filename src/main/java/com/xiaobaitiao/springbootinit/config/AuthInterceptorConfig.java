package com.xiaobaitiao.springbootinit.config;

import com.xiaobaitiao.springbootinit.aop.AuthInterceptorHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 */
@Configuration
public class AuthInterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptorHandler()).excludePathPatterns("/**/login","/**/register","/**/register_verify").excludePathPatterns("/doc.html");
    }

    @Bean
    public AuthInterceptorHandler authInterceptorHandler(){
        return new AuthInterceptorHandler();
    }
}
