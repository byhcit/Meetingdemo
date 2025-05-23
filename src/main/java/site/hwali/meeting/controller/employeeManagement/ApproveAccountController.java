package site.hwali.meeting.controller.employeeManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.EmployeeService;

import java.util.List;

import static site.hwali.meeting.constant.PageConstants.PENDING_APPROVE;

@Controller
@RequestMapping("/admin")
public class ApproveAccountController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/approveAccount")
    public String approveAccount(Model model, 
                               @RequestParam(defaultValue = "1") int pageNum,
                               @RequestParam(defaultValue = "10") int pageSize) {
        // 获取总记录数
        int total = employeeService.getTotalByStatus(PENDING_APPROVE);
        // 计算总页数
        int totalPages = (total + pageSize - 1) / pageSize;
        // 获取当前页的数据
        List<Employee> emps = employeeService.getEmpsByStatus(PENDING_APPROVE, pageNum, pageSize);
        
        model.addAttribute("emps", emps);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);
        return "/employeeManagement/approveAccount";
    }

    @RequestMapping("/updateStatus")
    public String updateStatus(@RequestParam("employeeid") int id, @RequestParam("status") String status) {
        int result = employeeService.updateStatus(id, status);
        return "redirect:/admin/approveAccount";
    }
}
