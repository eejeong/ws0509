package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Random;

@Slf4j // log
@Controller
@RequestMapping("/adm")
public class AdmController {

    @Autowired
    AdmService admService;

    //Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "adm/";

    // 127.0.0.1/adm
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        //logger.info("------------------------------------------------");
        Random r = new Random();
        int inx = r.nextInt(1000)+1;
        log.info(inx+""); // logback.xml의 %msg%
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, String id){
        Adm adm = new Adm("admin01", "pwd01", 1);
        model.addAttribute("gadm", adm);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"get");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Adm> list = null;
        try {
            list = admService.get();
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("alist", list);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"all");
        return "index";
    }

}
