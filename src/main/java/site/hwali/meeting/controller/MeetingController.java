package site.hwali.meeting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import site.hwali.meeting.service.DepartmentService;
import site.hwali.meeting.service.EmployeeService;
import site.hwali.meeting.service.MeetingRoomService;
import site.hwali.meeting.service.MeetingService;

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


}
