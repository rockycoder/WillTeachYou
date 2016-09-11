package com.app.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.web.ServiceApi.ICustomerService;

@Controller
@SessionAttributes( "userDetail" )
public class HomeController {

    @Autowired
    ICustomerService service;

    private static final Logger log = Logger.getLogger(HomeController.class);

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST}, value = "/*")
    public String genericRequestMapper(Model model, HttpServletRequest request) {
        try {
            String mapping = request.getServletPath().toString().substring(1);
            return "PageNotFound";
        } catch (Exception ex) {
            return "ErrorCode";
        }
    }

    @RequestMapping("/store")
    public String store(Model model, HttpServletRequest request) {
        return "redirect:index";
    }

    @RequestMapping("/index")
    public String index(Model model, HttpServletRequest request) {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model, HttpServletRequest request) {
        return "login";
    }

    @RequestMapping("/signup")
    public String signup(Model model, HttpServletRequest request) {
        return "signup";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/student")
    public String student(ModelMap model, HttpServletRequest request, HttpSession httpSession) {
        try {
            return "Student";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "ErrorCode";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/company")
    public String company(ModelMap model, HttpServletRequest request, HttpSession httpSession) {
        try {
            return "Company";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "ErrorCode";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/volunteer")
    public String volunteer(ModelMap model, HttpServletRequest request, HttpSession httpSession) {
        try {
            return "Volunteer";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "ErrorCode";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/request")
    public String createRequest(ModelMap model, HttpServletRequest request, HttpSession httpSession) {
        try {
            return "CreateRequest";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "ErrorCode";
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/accept")
    public String acceptRequest(ModelMap model, HttpServletRequest request, HttpSession httpSession) {
        try {
        	ArrayList<String> list = new ArrayList<String>();
        	list.add("Basic Computer Training");
        	list.add("Java");
        	list.add("C");
        	list.add("Maths");
        	list.add("Chemistry");
        	list.add("Physics");
        	list.add("English");
        	
        	model.addAttribute("list", list);
            return "AcceptRequest";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "ErrorCode";
        }
    }

    
    
}