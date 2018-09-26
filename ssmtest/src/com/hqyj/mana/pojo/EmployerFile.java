package com.hqyj.mana.pojo;

public class EmployerFile {
    private Integer fileid;

    private Integer ygid;

    private String filename;

    private String content;

    private String remark;

    private Integer typeid;

    public Integer getFileid() {
        return fileid;
    }

    public void setFileid(Integer fileid) {
        this.fileid = fileid;
    }

    public Integer getYgid() {
        return ygid;
    }

    public void setYgid(Integer ygid) {
        this.ygid = ygid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }
}