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
public class myBookingController {

    @Autowired
    MeetingService meetingService;

    @RequestMapping("/myBooking")
    public String myBooking(@RequestParam(defaultValue = "1") int pageNum,
                            @RequestParam(defaultValue = "10") int pageSize,
                            Model model,
                            HttpSession httpSession) {
        int id = ((Employee) httpSession.getAttribute("currentuser")).getEmployeeid();
        int total = meetingService.getMyBookingCount(id);
        int totalPages = (total + pageSize - 1) / pageSize;
        List<MeetingVO> bookingLst = meetingService.getMyBooking(pageNum, pageSize, id);

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("booking", bookingLst);
        return "/myProfile/myBooking";
    }

    @RequestMapping("/cancelMeeting")
    public String cancelMeeting(int id,String name,Model model){
//        MeetingVO meeting = meetingService.getMeetingById(id);
        model.addAttribute("id",id);
        model.addAttribute("name", name);
        return "/myProfile/cancelMeeting";
    }

    @RequestMapping("/cancelBooking")
    public String cancelBooking(int id,String canceledreason){
        meetingService.updateMeeting(id,canceledreason);
        return "redirect:/myBooking";
    }
}
