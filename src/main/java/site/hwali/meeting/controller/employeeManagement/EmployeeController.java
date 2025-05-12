package site.hwali.meeting.controller.employeeManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.EmployeeService;

import java.util.List;

import static site.hwali.meeting.constant.PageConstants.DEFAULT_PAGE_SIZE;

@Controller
@RequestMapping("/admin")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/searchEmps")
    public String searchEmps(Employee empCond, @RequestParam(defaultValue = "1") int page, Model model) {
        // 将查询条件传回页面
        model.addAttribute("empCond", empCond);
        System.out.println("empCond = " + empCond);
        List<Employee> emps = employeeService.getEmpsByPage(empCond, page, DEFAULT_PAGE_SIZE);
        // 获取总记录数
        int total = employeeService.getTotalByStatus(empCond.getStatus());
        // 计算总页数
        int totalPages = (total + DEFAULT_PAGE_SIZE - 1) / DEFAULT_PAGE_SIZE;

        // 获取分页数据
        model.addAttribute("emps", emps);
        model.addAttribute("page", page);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);

        return "/employeeManagement/searchEmployee";
    }

    @RequestMapping("/disableEmp")
    public String disableEmp(int id) {
        employeeService.updateStatus(id,"2");
        return "redirect:/admin/searchEmps";
    }
@RequestMapping("/unlockEmp")
    public String unlockEmp(int id) {
        employeeService.updateStatus(id,"0");
        return "redirect:/admin/searchEmps";
    }

}
