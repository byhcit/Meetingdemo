package site.hwali.meeting.mapper;

import org.apache.ibatis.annotations.Param;
import site.hwali.meeting.model.Meeting;

public interface MeetingMapper {
    int addMeeting(Meeting meeting);

    void addParticipants(@Param("meetingid") int id,@Param("mps") int[] mps);
}
