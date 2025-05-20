package site.hwali.meeting.model.vo;

public class NoticeVo {
    private int meetingId;
    private String MeetingName;
    private String roomName;
    private String startTime;
    private String endTime;
    private String canceledReason;

    public int getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(int meetingId) {
        this.meetingId = meetingId;
    }

    public String getMeetingName() {
        return MeetingName;
    }

    public void setMeetingName(String meetingName) {
        MeetingName = meetingName;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCanceledReason() {
        return canceledReason;
    }

    public void setCanceledReason(String canceledReason) {
        this.canceledReason = canceledReason;
    }

    @Override
    public String toString() {
        return "NoticeVo{" +
                "meetingId=" + meetingId +
                ", MeetingName='" + MeetingName + '\'' +
                ", roomName='" + roomName + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", canceledReason='" + canceledReason + '\'' +
                '}';
    }
}
