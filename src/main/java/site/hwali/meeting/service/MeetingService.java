package site.hwali.meeting.service;

import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;

import java.util.List;

public interface MeetingService {
    /**
     * 添加会议
     * @param meeting 会议信息
     * @param mps 参会人员ID数组
     * @return 添加结果
     */
    int addMeeting(Meeting meeting, int[] mps);

    /**
     * 搜索会议
     * @param query 搜索条件
     * @param page 页码
     * @param pageSize 每页大小
     * @return 会议列表
     */
    List<MeetingDTO> searchMeetings(MeetingSearchQuery query, int page, int pageSize);

    /**
     * 获取会议总数
     * @param query 搜索条件
     * @return 会议总数
     */
    int getTotalMeetings(MeetingSearchQuery query);

    /**
     * 获取会议详情
     * @param id 会议ID
     * @return 会议详情
     */
    MeetingDTO getMeetingDetails(int id);
}
