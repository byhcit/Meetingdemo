package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.NoticesMapper;
import site.hwali.meeting.model.dto.NoticeDto;
import site.hwali.meeting.service.NotificationService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NotificationServiceImpl implements NotificationService {
    
    @Autowired
    private NoticesMapper noticesMapper;

    @Override
    public Map<String, Object> getMyNotices(int empId, int upcomingPage, int cancelledPage, int noticesSize) {
        Map<String, Object> result = new HashMap<>();
        
        // 判断是查询未来7天会议还是已取消会议
        boolean isUpcomingPage = upcomingPage > 0;
        boolean isCancelledPage = cancelledPage > 0;
        
        // 如果是首次加载（两个页码都是1），则同时加载两种会议
        if (upcomingPage == 1 && cancelledPage == 1) {
            // 加载未来7天会议
            List<NoticeDto> upcomingMeetings = noticesMapper.getUpcomingMeetings(empId, 0, noticesSize);
            int upcomingTotal = noticesMapper.getUpcomingMeetingsCount(empId);
            int upcomingTotalPages = (int) Math.ceil((double) upcomingTotal / noticesSize);
            result.put("upcomingMeetings", upcomingMeetings);
            result.put("upcomingTotalPages", upcomingTotalPages);
            
            // 加载已取消会议
            List<NoticeDto> cancelledMeetings = noticesMapper.getCancelledMeetings(empId, 0, noticesSize);
            int cancelledTotal = noticesMapper.getCancelledMeetingsCount(empId);
            int cancelledTotalPages = (int) Math.ceil((double) cancelledTotal / noticesSize);
            result.put("cancelledMeetings", cancelledMeetings);
            result.put("cancelledTotalPages", cancelledTotalPages);
        } else {
            // 根据点击的分页按钮决定查询哪种会议
            if (isUpcomingPage) {
                int upcomingOffset = (upcomingPage - 1) * noticesSize;
                List<NoticeDto> upcomingMeetings = noticesMapper.getUpcomingMeetings(empId, upcomingOffset, noticesSize);
                int upcomingTotal = noticesMapper.getUpcomingMeetingsCount(empId);
                int upcomingTotalPages = (int) Math.ceil((double) upcomingTotal / noticesSize);
                result.put("upcomingMeetings", upcomingMeetings);
                result.put("upcomingTotalPages", upcomingTotalPages);
            }
            
            if (isCancelledPage) {
                int cancelledOffset = (cancelledPage - 1) * noticesSize;
                List<NoticeDto> cancelledMeetings = noticesMapper.getCancelledMeetings(empId, cancelledOffset, noticesSize);
                int cancelledTotal = noticesMapper.getCancelledMeetingsCount(empId);
                int cancelledTotalPages = (int) Math.ceil((double) cancelledTotal / noticesSize);
                result.put("cancelledMeetings", cancelledMeetings);
                result.put("cancelledTotalPages", cancelledTotalPages);
            }
        }
        
        return result;
    }
}
