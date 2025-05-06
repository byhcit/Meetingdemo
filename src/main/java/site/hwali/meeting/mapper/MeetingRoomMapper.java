package site.hwali.meeting.mapper;

import site.hwali.meeting.model.MeetingRoom;

import java.util.List;

public interface MeetingRoomMapper {
    List<MeetingRoom> selectByPage(int offset, int pageSize);
    int selectCount();

    MeetingRoom getMrById(int id);

    int updateRoom(MeetingRoom meetingRoom);

    int addMr(MeetingRoom meetingRoom);

    MeetingRoom getMrByRoomNum(int roomnum);
}
