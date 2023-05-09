package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    MarkerDescService service;

    @Test
    void contextLoads() {
        MarkerDesc obj = new MarkerDesc(0, 107, "양갈비꼬치", 20000, "kuk.jpg");
        try{
            service.register(obj);
            log.info("등록 정상-----------------------------");
        } catch (Exception e){
            log.info("에러-------------------------");
            e.printStackTrace();
        }
    }
}

