package com.kbstar.marker;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() {
        Marker obj = new Marker(0, "치킨집", "http://www.naver.com", 37.639446, 127.014702, "kuk.jpg", "S");
        try{
            service.register(obj);
            log.info("등록 정상-----------------------------");
        } catch (Exception e){
            log.info("에러-------------------------");
            e.printStackTrace();
        }
    }
}
