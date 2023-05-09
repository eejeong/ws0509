package com.kbstar.item;

import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {
    @Autowired
    ItemService service;

    @Test
    void contextLoads() {

        try {
            service.remove(104);
            log.info("삭제정상");
        } catch (Exception e) {
            log.info("오류");
            e.printStackTrace();
        }

    }}
