package tw.designerfamily.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//相當於web.xml的java程式組態
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	//設定相當於beans.config.xml的java程式組態
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
//		return null;//沒有Root WebApplicationContext
	}
	
	//設定相當於mvc-servlet.xml的java程式組態
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {WebAppConfig.class};
//		return null;
	}
	
	//設定servlet mapping的網址
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter cef = new CharacterEncodingFilter("UTF-8",true);
//		cef.setEncoding("UTF-8");
//		cef.setForceEncoding(true);
		return new Filter[] {cef};
	}
	
	
	
}
