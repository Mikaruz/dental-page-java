package model;

public class Schedule {
    private int scheduleId;
    private String beginTime;
    private String endTime;

    public Schedule() {
    }

    public Schedule(int scheduleId, String beginTime, String endTime) {
        this.scheduleId = scheduleId;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
