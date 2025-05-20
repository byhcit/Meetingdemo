package site.hwali.meeting.controller.myProfile;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.vo.MeetingVO;
import site.hwali.meeting.service.MeetingService;

import java.util.List;

@Controller
public class MyMeetingController {
    @Autowired
    MeetingService meetingService;

    @RequestMapping("/myMeeting")
    public String myMeeting(@RequestParam(defaultValue = "1") int pageNum,
                            @RequestParam(defaultValue = "10") int pageSize,
                            Model model,
                            HttpSession session) {
        Employee me = (Employee) session.getAttribute("currentuser");
        List<MeetingVO> mList = meetingService.getMyMeetings(pageNum, pageSize, me.getEmployeeid());
        int total = meetingService.getMyMeetingsCount(me.getEmployeeid());
        int totalPages = (total + pageSize - 1) / pageSize;
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("meetings", mList);
        return "/myProfile/myMeeting";
    }
}
