package tw.designerfamily.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

//相當於mvc-servlet.xml的java程式組態
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "tw.designerfamily")
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
//	路徑去頭去尾
//	@Bean
//	public InternalResourceViewResolver viewResolver() {
//		InternalResourceViewResolver irvr = new InternalResourceViewResolver();
//		irvr.setPrefix("/WEB-INF/pages/");
//		irvr.setSuffix(".jsp");
//		irvr.setOrder(6);
//		return irvr;
//		
//	}

}
