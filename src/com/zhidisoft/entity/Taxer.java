package com.zhidisoft.entity;
public class Taxer {
    private Integer id;
    private String taxerCode;
    private String taxerName;
    private String mobile;
    private String address;
    private String sex;
    private String birthday;
    private String email;
    private Integer organId;
    private Integer state;
    private Integer mgr;
    private Integer admin;
    private String recordDate;
    private Integer recordUserId;
    public Taxer() {
        super();
    }
    public Taxer(Integer id, String taxerCode, String taxerName, String mobile,
                 String address, String sex, String birthday, String email,
                 Integer organId, Integer state, Integer mgr, Integer admin,
                 String recordDate, Integer recordUserId) {
        super();
        this.id = id;
        this.taxerCode = taxerCode;
        this.taxerName = taxerName;
        this.mobile = mobile;
        this.address = address;
        this.sex = sex;
        this.birthday = birthday;
        this.email = email;
        this.organId = organId;
        this.state = state;
        this.mgr = mgr;
        this.admin = admin;
        this.recordDate = recordDate;
        this.recordUserId = recordUserId;
    }

    public Taxer(Integer id, String taxerCode, String taxerName, String mobile, String address, String sex, String birthday, String email, Integer organId) {
        this.id = id;
        this.taxerCode = taxerCode;
        this.taxerName = taxerName;
        this.mobile = mobile;
        this.address = address;
        this.sex = sex;
        this.birthday = birthday;
        this.email = email;
        this.organId = organId;
    }
    public Taxer( String taxerCode, String taxerName, String mobile, String address, String sex, String birthday, String email, Integer organId) {
        this.taxerCode = taxerCode;
        this.taxerName = taxerName;
        this.mobile = mobile;
        this.address = address;
        this.sex = sex;
        this.birthday = birthday;
        this.email = email;
        this.organId = organId;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTaxerCode() {
        return taxerCode;
    }
    public void setTaxerCode(String taxerCode) {
        this.taxerCode = taxerCode;
    }
    public String getTaxerName() {
        return taxerName;
    }
    public void setTaxerName(String taxerName) {
        this.taxerName = taxerName;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Integer getOrganId() {
        return organId;
    }
    public void setOrganId(Integer organId) {
        this.organId = organId;
    }
    public Integer getState() {
        return state;
    }
    public void setState(Integer state) {
        this.state = state;
    }
    public Integer getMgr() {
        return mgr;
    }
    public void setMgr(Integer mgr) {
        this.mgr = mgr;
    }
    public Integer getAdmin() {
        return admin;
    }
    public void setAdmin(Integer admin) {
        this.admin = admin;
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
        return "Taxer [id=" + id + ", taxerCode=" + taxerCode + ", taxerName="
                + taxerName + ", mobile=" + mobile + ", address=" + address
                + ", sex=" + sex + ", birthday=" + birthday + ", email="
                + email + ", organId=" + organId + ", state=" + state
                + ", mgr=" + mgr + ", admin=" + admin + ", recordDate="
                + recordDate + ", recordUserId=" + recordUserId + "]";
    }

}
