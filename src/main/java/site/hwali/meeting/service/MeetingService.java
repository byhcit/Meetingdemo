package site.hwali.meeting.service;

import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;
import site.hwali.meeting.model.vo.MeetingVO;

import java.util.Date;
import java.util.List;

public interface MeetingService {
    /**
     * 添加会议
     *
     * @param meeting 会议信息
     * @param mps     参会人员ID数组
     * @return 添加结果
     */
    int addMeeting(Meeting meeting, int[] mps);

    /**
     * 搜索会议
     *
     * @param query    搜索条件
     * @param page     页码
     * @param pageSize 每页大小
     * @return 会议列表
     */
    List<MeetingDTO> searchMeetings(MeetingSearchQuery query, int page, int pageSize);

    /**
     * 获取会议总数
     *
     * @param query 搜索条件
     * @return 会议总数
     */
    int getTotalMeetings(MeetingSearchQuery query);

    /**
     * 获取会议详情
     *
     * @param id 会议ID
     * @return 会议详情
     */
    MeetingDTO getMeetingDetails(int id);

    boolean isRoomOccupied(int roomId, Date startTime, Date endTime);

    /**
     * 检查会议室是否被占用（排除指定会议）
     *
     * @param roomId 会议室ID
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @param excludeMeetingId 要排除的会议ID
     * @return 是否被占用
     */
    boolean isRoomOccupied(int roomId, Date startTime, Date endTime, int excludeMeetingId);

    List<MeetingVO> getMyMeetings(int pageNum, int pageSize, int id);

    int getMyMeetingsCount(int id);

    int getMyBookingCount(int id);

    List<MeetingVO> getMyBooking(int pageNum, int pageSize, int id);

    int updateMeeting(int id,String canceledreason);

    MeetingVO getMeetingById(int id);

    int updateBooking(MeetingVO meetingVO);

    /**
     * 获取会议参会人员
     *
     * @param meetingId 会议ID
     * @return 参会人员列表
     */
    List<Employee> getMeetingParticipants(int meetingId);
}
