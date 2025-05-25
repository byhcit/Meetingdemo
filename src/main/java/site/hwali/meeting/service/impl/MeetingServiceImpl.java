package site.hwali.meeting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.hwali.meeting.converter.BeanConverter;
import site.hwali.meeting.mapper.MeetingMapper;
import site.hwali.meeting.model.Employee;
import site.hwali.meeting.model.Meeting;
import site.hwali.meeting.model.dto.MeetingDTO;
import site.hwali.meeting.model.query.MeetingSearchQuery;
import site.hwali.meeting.model.vo.MeetingVO;
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

    @Override
    public boolean isRoomOccupied(int roomId, Date startTime, Date endTime, int excludeMeetingId) {
        return meetingMapper.isRoomOccupiedExcludeMeeting(roomId, startTime, endTime, excludeMeetingId) > 0;
    }

    @Override
    public List<MeetingVO> getMyMeetings(int pageNum, int pageSize, int id) {
        int offset = (pageNum - 1) * pageSize;
        List<MeetingDTO> mLst = meetingMapper.getMyMeetings(offset, pageSize, id);
        List<MeetingVO> myMeetings = BeanConverter.convertLst(mLst, MeetingVO.class);
        return myMeetings;
    }

    @Override
    public List<MeetingVO> getMyBooking(int pageNum, int pageSize, int id) {
        int offset = (pageNum - 1) * pageSize;
        List<MeetingDTO> mLst = meetingMapper.getMyBooking(offset, pageSize, id);
        List<MeetingVO> myBooking = BeanConverter.convertLst(mLst, MeetingVO.class);
        return myBooking;
    }

    @Override
    public int getMyMeetingsCount(int id) {
        return meetingMapper.selectCount(id);
    }

    @Override
    public int getMyBookingCount(int id) {
        return meetingMapper.getMyBookingCount(id);
    }

    @Override
    public int updateMeeting(int id,String canceledreason) {
        return meetingMapper.cancelMeeting(id,new Date(),canceledreason);
    }

    @Override
    public MeetingVO getMeetingById(int id) {
        return BeanConverter.convert(meetingMapper.getMeetingById(id),MeetingVO.class);
    }

    @Override
    public int updateBooking(MeetingVO meetingVO) {
        return meetingMapper.updateMeeting(meetingVO);
    }

    @Override
    public List<Employee> getMeetingParticipants(int meetingId) {
        return meetingMapper.getMeetingParticipants(meetingId);
    }
}
