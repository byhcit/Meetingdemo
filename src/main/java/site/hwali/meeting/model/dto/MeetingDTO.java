package site.hwali.meeting.model.dto;

import site.hwali.meeting.model.Meeting;

public class MeetingDTO extends Meeting {
    private String roomname;
    private String reservername;
    private String canceledreason;

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

    public String getCanceledReason() {
        return canceledreason;
    }

    public void setCanceledReason(String canceledReason) {
        this.canceledreason = canceledReason;
    }
}