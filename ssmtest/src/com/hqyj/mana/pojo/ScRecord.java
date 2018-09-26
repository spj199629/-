package com.hqyj.mana.pojo;

import java.util.Date;

public class ScRecord {
    private Integer ygid;

    private Integer basepay;

    private Integer meritpay;

    private Integer reward;

    private Integer fkpay;

    private Integer scnumber;

    private String sendtime;

    
    public ScRecord() {
		super();
	}

	

	public ScRecord(Integer ygid, Integer basepay, Integer meritpay, Integer reward, Integer fkpay, Integer scnumber,
			String sendtime) {
		super();
		this.ygid = ygid;
		this.basepay = basepay;
		this.meritpay = meritpay;
		this.reward = reward;
		this.fkpay = fkpay;
		this.scnumber = scnumber;
		this.sendtime = sendtime;
	}



	public Integer getYgid() {
        return ygid;
    }

    public void setYgid(Integer ygid) {
        this.ygid = ygid;
    }

    public Integer getBasepay() {
        return basepay;
    }

    public void setBasepay(Integer basepay) {
        this.basepay = basepay;
    }

    public Integer getMeritpay() {
        return meritpay;
    }

    public void setMeritpay(Integer meritpay) {
        this.meritpay = meritpay;
    }

    public Integer getReward() {
        return reward;
    }

    public void setReward(Integer reward) {
        this.reward = reward;
    }

    public Integer getFkpay() {
        return fkpay;
    }

    public void setFkpay(Integer fkpay) {
        this.fkpay = fkpay;
    }

    public Integer getScnumber() {
        return scnumber;
    }

    public void setScnumber(Integer scnumber) {
        this.scnumber = scnumber;
    }

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

    
}