package site.hwali.meeting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.hwali.meeting.model.Department;
import site.hwali.meeting.service.DepartmentService;
import site.hwali.meeting.service.impl.DepartmentServiceImpl;

import java.util.Objects;

@Controller
@RequestMapping("/admin")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/departments")
    public String departments(Model model) {
        model.addAttribute("deps", departmentService.getAllDeps());
        return "departments";
    }

    @RequestMapping("/addDept")
    public String addDepartment(String name, Model model) {
        System.out.println("name = " + name);
        if (Objects.isNull(name) || name.isBlank()) {
            model.addAttribute("error", "部门名称不可为空");
            return "forward:/admin/departments";
        }

        int count = departmentService.getDeptCountByName(name);
        if (count > 0) {
            model.addAttribute("error", "部门名称已存在");
            return "forward:/admin/departments";
        }

        int res = departmentService.addDept(name);
        if (res == 0) {
            model.addAttribute("error", "部门新增失败");
            return "forward:/admin/departments";
        }

        return "redirect:/admin/departments";
    }

    @RequestMapping("deleteDep")
    public String deleteDep(int id) {
        departmentService.deleteDep(id);
        return "redirect:/admin/departments";
    }

    @RequestMapping("updateDep")
    @ResponseBody
    public String updateDep(int id, int name) {
        int result = departmentService.updateDep(id, name);
        return result == 1 ? "success" : "error";
    }
}
