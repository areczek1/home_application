package arek.inzynierka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class InzynierkaApplication {

	public static void main(String[] args) {

		SpringApplication.run(InzynierkaApplication.class, args);
	}

}
