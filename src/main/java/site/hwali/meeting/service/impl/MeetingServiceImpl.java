package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.MeetingMapper;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;
import site.hwali.meeting.service.MeetingService;

import java.util.Date;
import java.util.List;

@Service
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    private MeetingMapper meetingMapper;

    @Override
    public int addMeeting(Meeting meeting, int[] mps) {
        meeting.setReservationtime(new java.util.Date());
        meeting.setStatus("0");
        int result = meetingMapper.addMeeting(meeting);
        if (result == 1 && mps != null) {
            meetingMapper.addParticipants(meeting.getMeetingid(), mps);
        }
        return result;
    }

    @Override
    public List<MeetingDTO> searchMeetings(MeetingSearchQuery query, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return meetingMapper.searchMeetings(query, offset, pageSize);
    }

    @Override
    public int getTotalMeetings(MeetingSearchQuery query) {
        return meetingMapper.getTotalMeetings(query);
    }

    @Override
    public MeetingDTO getMeetingDetails(int id) {
        return meetingMapper.getMeetingDetails(id);
    }

    @Override
    public boolean isRoomOccupied(int roomId, Date startTime, Date endTime) {
        return meetingMapper.isRoomOccupied(roomId, startTime, endTime) > 0;
    }
}
