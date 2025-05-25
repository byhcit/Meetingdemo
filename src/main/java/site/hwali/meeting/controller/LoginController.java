package site.hwali.meeting.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import site.hwali.meeting.model.Department;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.DepartmentService;
import site.hwali.meeting.service.EmployeeService;

import java.util.List;
import java.util.Objects;

@Controller
public class LoginController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/")
    public String login() {
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(String username, String password, Model model, HttpSession httpSession) {
        Employee employee = employeeService.doLogin(username, password);
        System.out.println("employee = " + employee);
        if (ObjectUtils.isEmpty(employee)) {
            model.addAttribute("error", "用户名或密码输入错误,登录失败");
            return "forward:/";
        } else {
            if ("0".equals(employee.getStatus())) {
                model.addAttribute("error", "用户待审批");
                return "forward:/";
            } else if ("2".equals(employee.getStatus())) {
                model.addAttribute("error", "用户审批未通过");
                return "forward:/";
            } else {
                httpSession.setAttribute("currentuser", employee);
                return "redirect:/notifications";
            }
        }
    }

    @RequestMapping("/register")
    public String register(Model model) {
        List<Department> deps = departmentService.getAllDeps();
        model.addAttribute("deps", deps);
        return "/employeeManagement/register";
    }

    @RequestMapping("/doReg")
    public String doReg(Employee employee, Model model) {
        int result = employeeService.doReg(employee);
        if (result == 1) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "注册失败");
            model.addAttribute("employee",employee);
            return "/employeeManagement/register";
        }
    }

    @PostMapping("/changepwd")
    public String changePassword(String oldPwd, String newPwd, String confirmPwd,
                                 HttpSession session, Model model) {
        Employee currentUser = (Employee) session.getAttribute("currentuser");
        if (Objects.isNull(currentUser)) {
            return "redirect:/";
        }

        if (!newPwd.equals(confirmPwd)) {
            model.addAttribute("error", "两次输入的新密码不一致！");
            return "changepwd";
        }

        int result = employeeService.updatePassword(currentUser.getEmployeeid(), oldPwd, newPwd);
        if (result == 1) {
            model.addAttribute("message", "密码修改成功！");
            return "redirect:/notifications";
        } else {
            model.addAttribute("error", "原密码错误！");
            return "changepwd";
        }
    }

    @RequestMapping("/toChangePassword")
    public String toChangePassword() {
        return "changepwd";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // 清除session
        session.invalidate();
        // 重定向到登录页面
        return "redirect:/";
    }
}
