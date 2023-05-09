package com.kbstar.service;

import com.kbstar.dto.Sales;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.SalesMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SalesService implements KBService<Character, Sales> {
    /**
     * 등록 및 가입 진행
     * argument:object
     * return:null
     *
     * @param sales
     */
    @Autowired
    SalesMapper mapper;

    @Override
    public void register(Sales sales) throws Exception {
        mapper.insert(sales);
    }

    @Override
    public void remove(Character character) throws Exception {

    }

    @Override
    public void modify(Sales sales) throws Exception {

    }

    @Override
    public Sales get(Character character) throws Exception {
        return null;
    }

    @Override
    public List get() throws Exception {
        List<Sales> list=mapper.selectall();
        return list;
    }
}