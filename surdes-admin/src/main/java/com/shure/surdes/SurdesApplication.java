package com.shure.surdes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class SurdesApplication {
    public static void main(String[] args) {
        SpringApplication.run(SurdesApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  启动成功啦   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
