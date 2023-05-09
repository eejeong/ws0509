package com.kbstar.sales;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    SalesService service;

    @Test
    void contextLoads(){
        Sales obj =new Sales("2023-04-27",20000,"M");
        try{
            service.register(obj);
            service.get();
        }catch (Exception e){
            log.info("시스템오류================================================================================");
            e.printStackTrace();
        }
    }

}
