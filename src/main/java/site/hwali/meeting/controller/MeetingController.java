package site.hwali.meeting.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.hwali.meeting.model.Department;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.service.DepartmentService;
import site.hwali.meeting.service.EmployeeService;
import site.hwali.meeting.service.MeetingRoomService;
import site.hwali.meeting.service.MeetingService;

import java.util.Arrays;
import java.util.List;

@Controller
public class MeetingController {
    @Autowired
    MeetingService meetingService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    MeetingRoomService meetingRoomService;

    @RequestMapping("/bookMeeting")
    public String bookMeeting(Model model) {
        model.addAttribute("mrs", meetingRoomService.getAllMrs());
        return "bookMeeting";
    }

    @RequestMapping("/allDeps")
    @ResponseBody
    public List<Department> getAllDeps() {
        System.out.println("departmentService.getAllDeps() = " + departmentService.getAllDeps());
        return departmentService.getAllDeps();
    }

    @RequestMapping("/getEmpsByDepid")
    @ResponseBody
    public List<Employee> getEmpsByDepid(int id) {
        System.out.println("employeeService.getEmpsByDepid(id) = " + employeeService.getEmpsByDepid(id));
        return employeeService.getEmpsByDepid(id);
    }

    @RequestMapping("/doAddMeeting")
    public String doAddMeeting(Meeting meeting, int[] mps, HttpSession session) {
        System.out.println("meeting = " + meeting);
        System.out.println("mps = " + (mps != null ? Arrays.toString(mps) : "null"));
        
        Employee currentuser = (Employee) session.getAttribute("currentuser");
        meeting.setReservationistid(currentuser.getEmployeeid());
        int result = meetingService.addMeeting(meeting, mps);
        return result == 1 ? "redirect:/searchMeeting" : "redirect:/bookMeeting";
    }

    @RequestMapping("/searchMeeting")
    public String searchMeeting() {
        return "searchMeeting";
    }

}
