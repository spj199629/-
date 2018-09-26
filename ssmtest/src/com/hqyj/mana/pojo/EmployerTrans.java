package com.hqyj.mana.pojo;

import java.util.Date;

public class EmployerTrans {
    private Integer trid;

    private Integer ygid;

    private String oldjob;

    private String newjob;

    private String transtime;

    private String transreason;
    
    

    
    public EmployerTrans() {
		super();
	}

	public EmployerTrans(Integer trid, Integer ygid, String oldjob, String newjob, String transtime,
			String transreason) {
		super();
		this.trid = trid;
		this.ygid = ygid;
		this.oldjob = oldjob;
		this.newjob = newjob;
		this.transtime = transtime;
		this.transreason = transreason;
	}

	public Integer getTrid() {
        return trid;
    }

    public void setTrid(Integer trid) {
        this.trid = trid;
    }

    public Integer getYgid() {
        return ygid;
    }

    public void setYgid(Integer ygid) {
        this.ygid = ygid;
    }

    public String getOldjob() {
        return oldjob;
    }

    public void setOldjob(String oldjob) {
        this.oldjob = oldjob;
    }

    public String getNewjob() {
        return newjob;
    }

    public void setNewjob(String newjob) {
        this.newjob = newjob;
    }

    

    public String getTranstime() {
		return transtime;
	}

	public void setTranstime(String transtime) {
		this.transtime = transtime;
	}

	public String getTransreason() {
        return transreason;
    }

    public void setTransreason(String transreason) {
        this.transreason = transreason;
    }
}