package com.cb.database.config;

import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableAsync
@EnableScheduling
public class ShutdownConfig {
    private final ConfigurableApplicationContext context;

    public ShutdownConfig(ConfigurableApplicationContext context) {
        this.context = context;
    }

    @Scheduled(fixedDelay = Long.MAX_VALUE)
    @Async
    public void shutdownApp() throws InterruptedException {
        Thread.sleep(300000);  // Wait for 5 minutes
        SpringApplication.exit(context, () -> 0);  // Then shutdown
    }
}
