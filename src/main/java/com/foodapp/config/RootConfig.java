package com.foodapp.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.*;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import jakarta.persistence.EntityManagerFactory;

@Configuration
@ComponentScan(basePackages={"com.foodapp.dao","com.foodapp.service"})
@PropertySource("classpath:application.properties")
@EnableTransactionManagement

public class RootConfig {

    @Bean
    DataSource dataSource(Environment env){
        DriverManagerDataSource ds=new DriverManagerDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl(env.getRequiredProperty("db.url"));
        ds.setUsername(env.getRequiredProperty("db.username"));
        ds.setPassword(env.getRequiredProperty("db.password"));
        return ds;
    }

    @Bean
    LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource ds){
        LocalContainerEntityManagerFactoryBean f=new LocalContainerEntityManagerFactoryBean();
        f.setDataSource(ds);
        f.setPackagesToScan("com.foodapp.model");
        f.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        Properties p=new Properties();
        p.setProperty("hibernate.hbm2ddl.auto","none");
        p.setProperty("hibernate.show_sql","true");
        p.setProperty("hibernate.format_sql","true");
        p.setProperty("hibernate.jdbc.time_zone","UTC");
        f.setJpaProperties(p);
        return f;
    }

    @Bean
    PlatformTransactionManager transactionManager(EntityManagerFactory emf){
        return new JpaTransactionManager(emf);
    }

}