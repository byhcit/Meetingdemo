package site.hwali.meeting.controller.myProfile;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.MeetingRoom;
import site.hwali.meeting.model.vo.MeetingVO;
import site.hwali.meeting.service.MeetingRoomService;
import site.hwali.meeting.service.MeetingService;

import java.util.List;

@Controller
public class myBookingController {

    @Autowired
    MeetingService meetingService;

    @Autowired
    MeetingRoomService meetingRoomService;

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

    @RequestMapping("/myMeetingDetail")
    public String myMeetingDetail(int id, Model model){
        MeetingVO meeting = meetingService.getMeetingById(id);
        List<MeetingRoom> meetingRooms = meetingRoomService.getAllMrs();
        List<Employee> selectedEmps = meetingService.getMeetingParticipants(id);
        model.addAttribute("meeting", meeting);
        model.addAttribute("meetingRooms", meetingRooms);
        model.addAttribute("selectedEmps", selectedEmps);
        return "/myProfile/myMeetingDetail";
    }

    @RequestMapping("/updateBooking")
    public String updateBooking(MeetingVO meetingVO, Model model) {
        // 检查必填字段
        String validationError = validateMeetingData(meetingVO);
        if (validationError != null) {
            model.addAttribute("error", validationError);
            model.addAttribute("meeting", meetingVO);
            model.addAttribute("meetingRooms", meetingRoomService.getAllMrs());
            return "/myProfile/myMeetingDetail";
        }

        // 检查会议时间
        String timeError = validateMeetingTime(meetingVO);
        if (timeError != null) {
            model.addAttribute("error", timeError);
            model.addAttribute("meeting", meetingVO);
            model.addAttribute("meetingRooms", meetingRoomService.getAllMrs());
            return "/myProfile/myMeetingDetail";
        }

        meetingService.updateBooking(meetingVO);
        return "redirect:/myBooking";
    }

    private String validateMeetingData(MeetingVO meetingVO) {
        // 检查会议名称
        if (meetingVO.getMeetingname() == null || meetingVO.getMeetingname().trim().isEmpty()) {
            return "会议名称不能为空";
        }
        if (meetingVO.getMeetingname().length() > 20) {
            return "会议名称不能超过20个字符";
        }

        // 检查参加人数
        if (meetingVO.getNumberofparticipants() < 2) {
            return "参加人数必须大于等于2";
        }

        // 检查会议室
        if (meetingVO.getRoomid() <= 0) {
            return "请选择会议室";
        }

        // 检查会议说明
        if (meetingVO.getDescription() != null && meetingVO.getDescription().length() > 200) {
            return "会议说明不能超过200个字符";
        }

        return null;
    }

    private String validateMeetingTime(MeetingVO meetingVO) {
        // 检查时间是否为空
        if (meetingVO.getStarttime() == null || meetingVO.getEndtime() == null) {
            return "会议开始时间和结束时间不能为空";
        }

        // 检查开始时间是否晚于结束时间
        if (meetingVO.getStarttime().after(meetingVO.getEndtime())) {
            return "会议开始时间不能晚于结束时间";
        }

        // 检查会议室是否被占用（排除当前会议）
        if (meetingService.isRoomOccupied(meetingVO.getRoomid(), meetingVO.getStarttime(), meetingVO.getEndtime(), meetingVO.getMeetingid())) {
            return "该会议室在选定时间段已被占用";
        }

        return null;
    }
}
