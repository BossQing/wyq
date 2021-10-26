package com.zhidisoft.entity;

public class Industry {
    private Integer id;
    private String industryName;
    private String recordDate;
    private Integer recordUserId;
    public Industry() {
        super();
    }
    public Industry(Integer id, String industryName, String recordDate,
                    Integer recordUserId) {
        super();
        this.id = id;
        this.industryName = industryName;
        this.recordDate = recordDate;
        this.recordUserId = recordUserId;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getIndustryName() {
        return industryName;
    }
    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }
    public String getRecordDate() {
        return recordDate;
    }
    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }
    public Integer getRecordUserId() {
        return recordUserId;
    }
    public void setRecordUserId(Integer recordUserId) {
        this.recordUserId = recordUserId;
    }

}


