package site.hwali.meeting.model;

import java.util.Date;

public class Meeting {
    private int meetingid;
    private String meetingname;
    private int roomid;
    private int reservationistid;
    private int numberofparticipants;
    private Date starttime;
    private Date endtime;
    private Date reservationtime;
    private Date canceledtime;
    private String description;
    private String status;

    public int getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(int meetingid) {
        this.meetingid = meetingid;
    }

    public String getMeetingname() {
        return meetingname;
    }

    public void setMeetingname(String meetingname) {
        this.meetingname = meetingname;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getReservationistid() {
        return reservationistid;
    }

    public void setReservationistid(int reservationistid) {
        this.reservationistid = reservationistid;
    }

    public int getNumberofparticipants() {
        return numberofparticipants;
    }

    public void setNumberofparticipants(int numberofparticipants) {
        this.numberofparticipants = numberofparticipants;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Date getReservationtime() {
        return reservationtime;
    }

    public void setReservationtime(Date reservationtime) {
        this.reservationtime = reservationtime;
    }

    public Date getCanceledtime() {
        return canceledtime;
    }

    public void setCanceledtime(Date canceledtime) {
        this.canceledtime = canceledtime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
