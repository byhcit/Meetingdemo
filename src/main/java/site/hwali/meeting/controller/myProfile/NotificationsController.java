package site.hwali.meeting.controller.myProfile;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.service.NotificationService;

import java.util.Map;

import static site.hwali.meeting.constant.PageConstants.NOTICES_SIZE;

@Controller
public class NotificationsController {

    @Autowired
    NotificationService notificationService;

    @GetMapping("/notifications")
    public String notifications(
            @RequestParam(defaultValue = "1") int upcomingPage,
            @RequestParam(defaultValue = "1") int cancelledPage,
            HttpSession session,
            Model model) {

        // 获取当前登录用户ID
        int empId = ((Employee) session.getAttribute("currentuser")).getEmployeeid();

        // 获取会议通知数据
        Map<String, Object> notices = notificationService.getMyNotices(empId, upcomingPage, cancelledPage, NOTICES_SIZE);
        model.addAttribute("upcomingMeetings", notices.get("upcomingMeetings"));
        model.addAttribute("upcomingTotalPages", notices.get("upcomingTotalPages"));
        model.addAttribute("cancelledMeetings", notices.get("cancelledMeetings"));
        model.addAttribute("cancelledTotalPages", notices.get("cancelledTotalPages"));
        model.addAttribute("upcomingPage", upcomingPage);
        model.addAttribute("cancelledPage", cancelledPage);
        System.out.println("notices.get(\"upcomingMeetings\") = " + notices.get("upcomingMeetings"));
        System.out.println("notices.get(\"upcomingTotalPages\") = " + notices.get("upcomingTotalPages"));
        System.out.println("notices.get(\"cancelledMeetings\") = " + notices.get("cancelledMeetings"));
        System.out.println("notices.get(\"cancelledTotalPages\") = " + notices.get("cancelledTotalPages"));

        return "/myProfile/notification";
    }
}
