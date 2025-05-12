package site.hwali.meeting.controller.employeeManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.hwali.meeting.service.DepartmentService;

import java.util.Objects;
//部门管理
@Controller
@RequestMapping("/admin")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/deps")
    public String departments(Model model) {
        model.addAttribute("deps", departmentService.getAllDeps());
        return "/employeeManagement/department";
    }

    @RequestMapping("/addDept")
    public String addDepartment(String name, Model model) {
        System.out.println("name = " + name);
        if (Objects.isNull(name) || name.isBlank()) {
            model.addAttribute("error", "部门名称不可为空");
            return "forward:/admin/deps";
        }

        int count = departmentService.getDeptCountByName(name);
        if (count > 0) {
            model.addAttribute("error", "部门名称已存在");
            return "forward:/admin/deps";
        }

        int res = departmentService.addDept(name);
        if (res == 0) {
            model.addAttribute("error", "部门新增失败");
            return "forward:/admin/deps";
        }

        return "redirect:/admin/deps";
    }

    @RequestMapping("deleteDep")
    public String deleteDep(int id) {
        departmentService.deleteDep(id);
        return "redirect:/admin/deps";
    }

    @RequestMapping("updateDep")
    @ResponseBody
    public String updateDep(int id, int name) {
        int result = departmentService.updateDep(id, name);
        return result == 1 ? "success" : "error";
    }
}
