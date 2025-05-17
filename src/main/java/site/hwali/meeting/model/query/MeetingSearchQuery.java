package site.hwali.meeting.model.query;

public class MeetingSearchQuery {
    private String meetingname;
    private String roomname;
    private String reservername;
    private String reservefromdate;
    private String reservetodate;
    private String meetingfromdate;
    private String meetingtodate;

    public String getMeetingname() {
        return meetingname;
    }

    public void setMeetingname(String meetingname) {
        this.meetingname = meetingname;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getReservername() {
        return reservername;
    }

    public void setReservername(String reservername) {
        this.reservername = reservername;
    }

    public String getReservefromdate() {
        return reservefromdate;
    }

    public void setReservefromdate(String reservefromdate) {
        this.reservefromdate = reservefromdate;
    }

    public String getReservetodate() {
        return reservetodate;
    }

    public void setReservetodate(String reservetodate) {
        this.reservetodate = reservetodate;
    }

    public String getMeetingfromdate() {
        return meetingfromdate;
    }

    public void setMeetingfromdate(String meetingfromdate) {
        this.meetingfromdate = meetingfromdate;
    }

    public String getMeetingtodate() {
        return meetingtodate;
    }

    public void setMeetingtodate(String meetingtodate) {
        this.meetingtodate = meetingtodate;
    }

    @Override
    public String toString() {
        return "MeetingSearchQuery{" +
                "meetingname='" + meetingname + '\'' +
                ", roomname='" + roomname + '\'' +
                ", reservername='" + reservername + '\'' +
                ", reservefromdate='" + reservefromdate + '\'' +
                ", reservetodate='" + reservetodate + '\'' +
                ", meetingfromdate='" + meetingfromdate + '\'' +
                ", meetingtodate='" + meetingtodate + '\'' +
                '}';
    }
}