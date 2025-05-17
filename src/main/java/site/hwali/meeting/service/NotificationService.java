package site.hwali.meeting.service;

import java.util.Map;

public interface NotificationService {

    Map<String, Object> getMyNotices(int empId, int upcomingPage, int cancelledPage, int noticesSize);
}
