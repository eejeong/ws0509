package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j // log
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    BCryptPasswordEncoder encoder;
    @Autowired
    CustService custService;
    String dir = "cust/";

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    //@Validated를 넣으면 Cust DTO 만들 때 넣었던 제약사항들을 체크하겠다는 뜻
    public String addimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for (ObjectError e : es) {
                msg += e.getDefaultMessage();
                msg += "<br>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(cust.getPwd());
        custService.register(cust);
        return "redirect:all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        model.addAttribute("clist", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        Cust cust = null;
        cust = custService.get(id);
        model.addAttribute("custdetail", cust);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for (ObjectError e : es) {
                msg += e.getDefaultMessage();
                msg += "<br>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.modify(cust);
        return "redirect:/cust/detail?id="+cust.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        custService.remove(id);
        return "redirect:/cust/all";
    }
}
