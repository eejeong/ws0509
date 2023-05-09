package com.kbstar.service;

import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service

public class ItemService implements KBService<Integer, Item> {
    @Autowired
    ItemMapper mapper;
    /**
     * 등록 및 가입 진행
     * argument: Object
     * retunr:null
     *
     * @param item
     */
    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
        log.info("Send Mail..." + item.getId());

    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);

    }

    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);

    }

    @Transactional(readOnly = true)
    @Override
    public Item get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }

    public List<Item> search(ItemSearch ms) throws Exception {
        return mapper.search(ms);
    }

}