package team.lala.timebank.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//Jasmine:設定檢舉佐證資料上傳與存取路徑
		registry
            .addResourceHandler("/penaltyProoves/**")
            .addResourceLocations("file:D:/penaltyProoves/");
    }
}
