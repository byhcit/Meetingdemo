package site.hwali.meeting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.EmployeeService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class EmployeeController {
    public static final int DEFAULT_PAGE_SIZE = 10;

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/searchEmps")
    public String searchEmps(Employee empCond, @RequestParam(defaultValue = "1") int page, Model model) {
        // 将查询条件传回页面
        model.addAttribute("empCond", empCond);
        System.out.println("empCond = " + empCond);
        List<Employee> emps = employeeService.getEmpsByPage(empCond, page, DEFAULT_PAGE_SIZE);
        // 获取总记录数
        int total = emps.size();
        // 计算总页数
        int totalPages = (total + DEFAULT_PAGE_SIZE - 1) / DEFAULT_PAGE_SIZE;

        // 获取分页数据
        model.addAttribute("emps", emps);
        model.addAttribute("pageNum", page);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);

        return "searchEmployee";
    }
}
