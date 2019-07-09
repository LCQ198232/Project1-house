package com.team.house.util;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class HouseCondition extends Page {
    private String title;
    private String contact;
    private Date pubdate;
    private Integer did;
    private Integer sid;
    private Integer tid;
    private Integer startPrice;
    private Integer endPrice;
    private Integer ispass;

    public Integer getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Integer startPrice) {
        this.startPrice = startPrice;
    }

    public Integer getEndPrice() {
        return endPrice;
    }

    public void setEndPrice(Integer endPrice) {
        this.endPrice = endPrice;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getPubdate() {
        return pubdate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getIspass() {
        return ispass;
    }

    public void setIspass(Integer ispass) {
        this.ispass = ispass;
    }
}
