package site.hwali.meeting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
    @GetMapping("/halou")
    public String hello(Model model){
        model.addAttribute("hello","hello hwali");
        return "hello";
    }
}
