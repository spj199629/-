package com.hqyj.mana.pojo;

import java.util.Date;

public class KaoQinRecord {
    private Integer recordid;

    private Integer ygid;

    private String type;

    private Integer jcmoney;

    private String recordtime;
    
    

    public KaoQinRecord() {
		super();
	}

	public KaoQinRecord(Integer recordid, Integer ygid, String type, Integer jcmoney, String recordtime) {
		super();
		this.recordid = recordid;
		this.ygid = ygid;
		this.type = type;
		this.jcmoney = jcmoney;
		this.recordtime = recordtime;
	}

	public Integer getRecordid() {
        return recordid;
    }

    public void setRecordid(Integer recordid) {
        this.recordid = recordid;
    }

    public Integer getYgid() {
        return ygid;
    }

    public void setYgid(Integer ygid) {
        this.ygid = ygid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getJcmoney() {
        return jcmoney;
    }

    public void setJcmoney(Integer jcmoney) {
        this.jcmoney = jcmoney;
    }

	public String getRecordtime() {
		return recordtime;
	}

	public void setRecordtime(String recordtime) {
		this.recordtime = recordtime;
	}

   
}