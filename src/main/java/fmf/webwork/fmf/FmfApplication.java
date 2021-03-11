package fmf.webwork.fmf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = { "fmf.webwork.fmf.repository" })
public class FmfApplication {

    public static void main(String[] args) {
        SpringApplication.run(FmfApplication.class, args);
    }

}
