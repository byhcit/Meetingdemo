package site.hwali.meeting.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;

import java.util.List;

@Mapper
public interface MeetingMapper {
    /**
     * 根据条件搜索会议
     */
    List<MeetingDTO> searchMeetings(@Param("meetingCond") MeetingSearchQuery query, @Param("offset") int offset, @Param("pageSize") int pageSize);

    /**
     * 获取符合条件的会议总数
     */
    int getTotalMeetings(@Param("meetingCond") MeetingSearchQuery meetingCond);

    /**
     * 根据ID获取会议
     */
    MeetingDTO getMeetingDetails(int id);

    /**
     * 添加会议
     */
    int addMeeting(Meeting meeting);

    /**
     * 添加会议参与者
     */
    void addParticipants(@Param("meetingid") int meetingId, @Param("mps") int[] mps);
}
