package team.lala.timebank.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {
//	@Autowired
//	private HttpServletRequest request;
//	String realPath = request.getServletContext().getRealPath("/");
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//Jasmine:設定檢舉佐證資料上傳與存取路徑
		registry
            .addResourceHandler("/image/**")
            .addResourceLocations("WEB-INF//image//");
//            .addResourceLocations("file:"+ realPath +"WEB-INF//image//");
	}
}
