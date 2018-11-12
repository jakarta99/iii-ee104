package team.lala.timebank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.service.CalculateService;

//@RestController
//@SpringBootApplication
public class StringBoot {

	@Autowired
	private CalculateService calculateService;

	@RequestMapping("/")
	String home() {

		String result = "<html><h1>Hello World!</h1></html>";

		int data = calculateService.add(1, 4);

		result += data;

		return result;
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(StringBoot.class, args);
	}

}