package com.hqyj.mana.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Employer {
    private Integer id;

    private String name;

    private String sex;

    private String birthday;

    private String tel;

    private String email;

    private String major;

    private String dep;

    private String job;

    private String starttime;

    private String status;

    private String remark;
    
    private String birthDayStart;
    
    private String birthDayEnd;

    public String getBirthDayStart() {
		return birthDayStart;
	}

	public void setBirthDayStart(String birthDayStart) {
		this.birthDayStart = birthDayStart;
	}

	public String getBirthDayEnd() {
		return birthDayEnd;
	}

	public void setBirthDayEnd(String birthDayEnd) {
		this.birthDayEnd = birthDayEnd;
	}


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    

    public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}