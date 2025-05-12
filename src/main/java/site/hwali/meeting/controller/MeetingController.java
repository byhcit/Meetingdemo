package site.hwali.meeting.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String doAddMeeting(Meeting meeting, int[] mps, HttpSession session, Model model) {
        System.out.println("meeting = " + meeting);
        System.out.println("mps = " + (mps != null ? Arrays.toString(mps) : "null"));

        // 检查必填字段
        String validationError = validateMeetingData(meeting, mps);
        if (validationError != null) {
            model.addAttribute("error", validationError);
            model.addAttribute("mrs", meetingRoomService.getAllMrs());
            model.addAttribute("meeting", meeting);  // 回填会议数据
            model.addAttribute("selectedMps", mps);  // 回填参会人员
            return "bookMeeting";
        }

        // 检查会议时间
        String timeError = validateMeetingTime(meeting);
        if (timeError != null) {
            model.addAttribute("error", timeError);
            model.addAttribute("mrs", meetingRoomService.getAllMrs());
            model.addAttribute("meeting", meeting);  // 回填会议数据
            model.addAttribute("selectedMps", mps);  // 回填参会人员
            return "bookMeeting";
        }

        Employee currentuser = (Employee) session.getAttribute("currentuser");
        meeting.setReservationistid(currentuser.getEmployeeid());
        
        int result = meetingService.addMeeting(meeting, mps);
        if (result != 1) {
            model.addAttribute("error", "预定会议失败");
            model.addAttribute("mrs", meetingRoomService.getAllMrs());
            model.addAttribute("meeting", meeting);  // 回填会议数据
            model.addAttribute("selectedMps", mps);  // 回填参会人员
            return "bookMeeting";
        }
        return "redirect:/searchMeetings";
    }

    private String validateMeetingData(Meeting meeting, int[] mps) {
        // 检查会议名称
        if (meeting.getMeetingname() == null || meeting.getMeetingname().trim().isEmpty()) {
            return "会议名称不能为空";
        }
        if (meeting.getMeetingname().length() > 20) {
            return "会议名称不能超过20个字符";
        }

        // 检查参加人数
        if (meeting.getNumberofparticipants() <= 0) {
            return "参加人数必须大于0";
        }

        // 检查会议室
        if (meeting.getRoomid() <= 0) {
            return "请选择会议室";
        }

        // 检查参会人员
        if (mps == null || mps.length == 0) {
            return "请选择参会人员";
        }

        // 检查会议说明
        if (meeting.getDescription() != null && meeting.getDescription().length() > 200) {
            return "会议说明不能超过200个字符";
        }

        return null;
    }

    private String validateMeetingTime(Meeting meeting) {
        // 检查时间是否为空
        if (meeting.getStarttime() == null || meeting.getEndtime() == null) {
            return "会议开始时间和结束时间不能为空";
        }

        // 检查开始时间是否晚于结束时间
        if (meeting.getStarttime().after(meeting.getEndtime())) {
            return "会议开始时间不能晚于结束时间";
        }

        // 检查会议室是否被占用
        if (meetingService.isRoomOccupied(meeting.getRoomid(), meeting.getStarttime(), meeting.getEndtime())) {
            return "该会议室在选定时间段已被占用";
        }

        return null;
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

    @RequestMapping("/meetingdetails")
    public String meetingDetails(int id, Model model) {
        MeetingDTO meeting = meetingService.getMeetingDetails(id);
        if (meeting != null) {
            MeetingVO meetingVo = new MeetingVO();
            BeanUtils.copyProperties(meeting, meetingVo);
            model.addAttribute("meeting", meetingVo);
        }
        return "meetingDetail";
    }
}
