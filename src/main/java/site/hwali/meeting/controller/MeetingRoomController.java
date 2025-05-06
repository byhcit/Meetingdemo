package site.hwali.meeting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.MeetingRoom;
import site.hwali.meeting.service.MeetingRoomService;

@Controller
public class MeetingRoomController {
    @Autowired
    MeetingRoomService meetingRoomService;

    @RequestMapping("/meetingRoom")
    public String meetingRoom(Model model,
                              @RequestParam(defaultValue = "1") int pageNum,
                              @RequestParam(defaultValue = "10") int pageSize) {
        System.out.println("pageSize = " + pageSize);
        // 获取总记录数
        int total = meetingRoomService.getTotalCount();
        // 计算总页数
        int totalPages = (total + pageSize - 1) / pageSize;

        // 获取分页数据
        model.addAttribute("mrs", meetingRoomService.getMeetingRoomsByPage(pageNum, pageSize));
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("total", total);
        model.addAttribute("totalPages", totalPages);

        return "meetingRoom";
    }

    @RequestMapping("/roomDetail")
    public String roomDetail(int id, Model model) {
        MeetingRoom mr = meetingRoomService.getMrById(id);
        if (mr == null) {
            return "redirect:/meetingRoom";
        }
        model.addAttribute("mr", mr);
        return "roomDetail";
    }

    @RequestMapping("/updateRoom")
    public String updateRoom(MeetingRoom meetingRoom) {
        int result = meetingRoomService.updateRoom(meetingRoom);
        return result == 1 ? "redirect:/meetingRoom" : "forward:/roomDetail";
    }

    @RequestMapping("/admin/addMeetingRoom")
    public String addMeetingRoom() {
        return "addMeetingRoom";
    }

    @RequestMapping("/admin/doAddMr")
    public String doAddMr(MeetingRoom meetingRoom, Model model) {
        int result = meetingRoomService.addMr(meetingRoom);
        if (result == -1) {
            model.addAttribute("error", "该房号已存在，请重新输入！");
            return "forward:/admin/addMeetingRoom";
        }
        if (result == 1) {
            return "redirect:/meetingRoom";
        } else {
            model.addAttribute("error", "添加失败，请重试！");
            return "redirect:/admin/addMeetingRoom";
        }
    }
}
