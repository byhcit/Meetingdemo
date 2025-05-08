package site.hwali.meeting.service;


import site.hwali.meeting.model.Meeting;

public interface MeetingService {
    int addMeeting(Meeting meeting, int[] mps);
}
