package com.kbstar.sales;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class SelectTest {

    @Autowired
    SalesService service;

    @Test
    void contextLoads(){
        List<Sales> list =null;
        try{
            list=service.get();
            for(Sales obj:list){
                log.info(obj.toString());
            }
            log.info("select ok ================================================================================");
        }catch (Exception e){
            log.info("시스템오류================================================================================");
        }
    }

}
