package site.hwali.meeting.model.vo;

import site.hwali.meeting.model.Meeting;

public class MeetingVO extends Meeting {
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

    public String getCanceledreason() {
        return canceledreason;
    }

    public void setCanceledreason(String canceledreason) {
        this.canceledreason = canceledreason;
    }
}