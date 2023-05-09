package com.kbstar.marker;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() {
        try{
            service.modify(new Marker(108, "국수집", "http://www.naver.com", 37.639446, 127.014702, "kuk.jpg", "S"));
        } catch (Exception e){
            log.info("오류----------------------------");
        }
    }
}
