package com.zhidisoft.entity;

public class TaxOrgan {
    private Integer id;
    private String organName;
    private String parentId;
    private String address;
    private String phone;
    private String faxPhone;
    private String email;
    private Integer leaderId;
    private String taxTypeCode;
    private Integer state;
    private String recordDate;
    private Integer recordUserId;
    public TaxOrgan() {
        super();
    }
    public TaxOrgan(Integer id, String organName, String parentId,
                    String address, String phone, String faxPhone, String email,
                    Integer leaderId, String taxTypeCode, Integer state,
                    String recordDate, Integer recordUserId) {
        super();
        this.id = id;
        this.organName = organName;
        this.parentId = parentId;
        this.address = address;
        this.phone = phone;
        this.faxPhone = faxPhone;
        this.email = email;
        this.leaderId = leaderId;
        this.taxTypeCode = taxTypeCode;
        this.state = state;
        this.recordDate = recordDate;
        this.recordUserId = recordUserId;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getOrganName() {
        return organName;
    }
    public void setOrganName(String organName) {
        this.organName = organName;
    }
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getFaxPhone() {
        return faxPhone;
    }
    public void setFaxPhone(String faxPhone) {
        this.faxPhone = faxPhone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Integer getLeaderId() {
        return leaderId;
    }
    public void setLeaderId(Integer leaderId) {
        this.leaderId = leaderId;
    }
    public String getTaxTypeCode() {
        return taxTypeCode;
    }
    public void setTaxTypeCode(String taxTypeCode) {
        this.taxTypeCode = taxTypeCode;
    }
    public Integer getState() {
        return state;
    }
    public void setState(Integer state) {
        this.state = state;
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
        return "TaxOrgan [id=" + id + ", organName=" + organName
                + ", parentId=" + parentId + ", address=" + address
                + ", phone=" + phone + ", faxPhone=" + faxPhone + ", email="
                + email + ", leaderId=" + leaderId + ", taxTypeCode="
                + taxTypeCode + ", state=" + state + ", recordDate="
                + recordDate + ", recordUserId=" + recordUserId + "]";
    }


}


