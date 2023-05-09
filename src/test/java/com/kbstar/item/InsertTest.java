package com.kbstar.item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    ItemService service;
    @Test
    void contextLoads() {
        Item obj = new Item(0, "브루노마스", 250000, "a.jpg", null);
        try {
            service.register(obj);
            service.get();
            log.info("--------------------------------------등록정상");
        } catch (Exception e) {
            log.info("--------------------------------------등록에러..");
            if (e instanceof DuplicateKeyException) {
                log.info("ID가 중복 되었습니다.");
            } else {
                log.info("시스템 장애입니다");
            }
        }

    }}
