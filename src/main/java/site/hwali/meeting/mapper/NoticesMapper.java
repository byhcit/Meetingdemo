package site.hwali.meeting.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import site.hwali.meeting.model.dto.NoticeDto;

import java.util.List;

@Mapper
public interface NoticesMapper {
    /**
     * 获取未来7天内员工要参加的会议
     */
    List<NoticeDto> getUpcomingMeetings(@Param("empId") int empId, 
                                       @Param("offset") int offset, 
                                       @Param("limit") int limit);

    /**
     * 获取员工已取消的会议
     */
    List<NoticeDto> getCancelledMeetings(@Param("empId") int empId,
                                        @Param("offset") int offset,
                                        @Param("limit") int limit);

    /**
     * 获取未来7天内员工要参加的会议总数
     */
    int getUpcomingMeetingsCount(@Param("empId") int empId);

    /**
     * 获取员工已取消的会议总数
     */
    int getCancelledMeetingsCount(@Param("empId") int empId);
}
