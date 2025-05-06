package site.hwali.meeting.service;

import site.hwali.meeting.model.MeetingRoom;

import java.util.List;

public interface MeetingRoomService {
    List<MeetingRoom> getMrsByPage(int pageNum, int pageSize);

    int getTotalCount();

    MeetingRoom getMrById(int id);

    int updateRoom(MeetingRoom meetingRoom);

    int addMr(MeetingRoom meetingRoom);

}
