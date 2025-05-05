package site.hwali.meeting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import site.hwali.meeting.service.EmployeeService;

@Controller
@RequestMapping("/amdin")
public class ApproveAccountController {

    public static final int PENDING_APPROVE = 0; //待审批

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/approveAccount")
    public String approveAccount(Model model) {
        model.addAttribute("emps", employeeService.getAllEmpsByStatus(PENDING_APPROVE));
        return "/approveAccount";
    }
}
