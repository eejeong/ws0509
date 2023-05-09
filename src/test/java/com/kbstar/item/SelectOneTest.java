package com.kbstar.item;

import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectOneTest {
    @Autowired
    ItemService service;

    @Test
    void contextLoads() {
        try {
            service.get(104);
        } catch (Exception e) {
            log.info("에러..");
            e.printStackTrace();
        }

    }}
