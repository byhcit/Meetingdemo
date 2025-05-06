package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.MeetingRoomMapper;
import site.hwali.meeting.model.MeetingRoom;
import site.hwali.meeting.service.MeetingRoomService;

import java.util.List;
import java.util.Objects;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {
    @Autowired
    MeetingRoomMapper meetingRoomMapper;

    @Override
    public List<MeetingRoom> getMrsByPage(int pageNum, int pageSize) {
        int offset = (pageNum - 1) * pageSize;
        return meetingRoomMapper.selectByPage(offset, pageSize);
    }

    @Override
    public int getTotalCount() {
        return meetingRoomMapper.selectCount();
    }

    @Override
    public MeetingRoom getMrById(int id) {
        MeetingRoom mr = meetingRoomMapper.getMrById(id);
        if (mr != null && mr.getStatus() == null) {
            mr.setStatus(0); // 设置默认状态为启用
        }
        return mr;
    }

    @Override
    public int updateRoom(MeetingRoom meetingRoom) {
        return meetingRoomMapper.updateRoom(meetingRoom);
    }

    @Override
    public int addMr(MeetingRoom meetingRoom) {
        MeetingRoom mr = meetingRoomMapper.getMrByRoomNum(meetingRoom.getRoomnum());
        if (!Objects.isNull(mr)){
            return -1;
        }
        return meetingRoomMapper.addMr(meetingRoom);
    }

}
