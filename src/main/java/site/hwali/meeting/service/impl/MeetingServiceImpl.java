package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.mapper.MeetingMapper;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.service.MeetingService;

import java.util.Date;

@Service
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    MeetingMapper meetingMapper;

    @Override
    public int addMeeting(Meeting meeting, int[] mps) {
        meeting.setReservationtime(new Date());
        int result = meetingMapper.addMeeting(meeting);
        meetingMapper.addParticipants(meeting.getMeetingid(),mps);
        return result;
    }
}
