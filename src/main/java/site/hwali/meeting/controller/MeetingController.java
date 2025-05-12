package site.hwali.meeting.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import site.hwali.meeting.model.Department;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;
import site.hwali.meeting.model.vo.MeetingSearchVO;
import site.hwali.meeting.model.vo.MeetingVO;
import site.hwali.meeting.service.DepartmentService;
import site.hwali.meeting.service.EmployeeService;
import site.hwali.meeting.service.MeetingRoomService;
import site.hwali.meeting.service.MeetingService;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static site.hwali.meeting.constant.PageConstants.DEFAULT_PAGE_SIZE;

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
        return result == 1 ? "redirect:/searchMeetings" : "redirect:/bookMeeting";
    }

    @RequestMapping("/searchMeetings")
    public String searchMeeting(MeetingSearchVO searchVO,
                                @RequestParam(required = false, defaultValue = "1") int page,
                                Model model) {
        MeetingSearchQuery query = new MeetingSearchQuery();
        BeanUtils.copyProperties(searchVO, query);
        System.out.println("query = " + query);
        List<MeetingDTO> meetings = meetingService.searchMeetings(query, page, DEFAULT_PAGE_SIZE);
        List<MeetingVO> mLst = meetings.stream()
                .map(dto -> {
                    MeetingVO vo = new MeetingVO();
                    BeanUtils.copyProperties(dto, vo);
                    return vo;
                })
                .collect(Collectors.toList());
        int total = meetingService.getTotalMeetings(query);
        // 计算总页数
        int totalPages = (total + DEFAULT_PAGE_SIZE - 1) / DEFAULT_PAGE_SIZE;

        model.addAttribute("meetings", mLst);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("meetingCond", searchVO);

        return "searchMeeting";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public Meeting getMeetingDetails(@PathVariable("id") int meetingId) {
        return meetingService.getMeetingDetails(meetingId);
    }

    @RequestMapping("/meetingdetails")
    public String meetingDetails( int id, Model model) {
        MeetingDTO meeting = meetingService.getMeetingDetails(id);
        MeetingVO meetingVo = new MeetingVO();
        BeanUtils.copyProperties(meeting,meetingVo);
        model.addAttribute("meeting", meetingVo);
        return "meetingDetail";
    }
}
