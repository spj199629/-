package com.hqyj.mana.pojo;

import java.util.Date;

public class TrainningRecord {
    private Integer recordid;

    private String pxtype;

    private Integer ygid;

    private String content;

    private String starttime;

    private String endtime;

    public Integer getRecordid() {
        return recordid;
    }

    public void setRecordid(Integer recordid) {
        this.recordid = recordid;
    }

    public String getPxtype() {
        return pxtype;
    }

    public void setPxtype(String pxtype) {
        this.pxtype = pxtype;
    }

    public Integer getYgid() {
        return ygid;
    }

    public void setYgid(Integer ygid) {
        this.ygid = ygid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

    
}