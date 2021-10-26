package com.zhidisoft.entity;

public class ImageLink {
    private Integer id;
    private String taskId;
    private String illustrate;
    private String url;
    private String recordDate;
    private Integer recordUserId;

    public ImageLink() {
        super();
    }

    public ImageLink(Integer id, String taskId, String illustrate, String url,
                     String recordDate, Integer recordUserId) {
        super();
        this.id = id;
        this.taskId = taskId;
        this.illustrate = illustrate;
        this.url = url;
        this.recordDate = recordDate;
        this.recordUserId = recordUserId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getIllustrate() {
        return illustrate;
    }

    public void setIllustrate(String illustrate) {
        this.illustrate = illustrate;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    @Override
    public String toString() {
        return "ImageLink [id=" + id + ", taskId=" + taskId + ", illustrate="
                + illustrate + ", url=" + url + ", recordDate=" + recordDate
                + ", recordUserId=" + recordUserId + "]";
    }

}
