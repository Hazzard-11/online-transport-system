package com.feedback;

import java.util.Date;

public class InquiryFeedback {
    private int id;
    private String senderName;
    private String senderEmail;
    private String senderRole;
    private String message;
    private Date dateSubmitted;
    private String status;
    private String remark;
    private Date remarkDate;

    public InquiryFeedback(String senderName, String senderEmail, String senderRole, String message) {
        this.senderName = senderName;
        this.senderEmail = senderEmail;
        this.senderRole = senderRole;
        this.message = message;
        this.status = "Pending";
    }

    public InquiryFeedback(int id, String senderName, String senderEmail, String senderRole,
                           String message, Date dateSubmitted, String status, String remark, Date remarkDate) {
        this.id = id;
        this.senderName = senderName;
        this.senderEmail = senderEmail;
        this.senderRole = senderRole;
        this.message = message;
        this.dateSubmitted = dateSubmitted;
        this.status = status;
        this.remark = remark;
        this.remarkDate = remarkDate;
    }

    // Getters and setters (encapsulated)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSenderName() { return senderName; }
    public void setSenderName(String senderName) { this.senderName = senderName; }

    public String getSenderEmail() { return senderEmail; }
    public void setSenderEmail(String senderEmail) { this.senderEmail = senderEmail; }

    public String getSenderRole() { return senderRole; }
    public void setSenderRole(String senderRole) { this.senderRole = senderRole; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Date getDateSubmitted() { return dateSubmitted; }
    public void setDateSubmitted(Date dateSubmitted) { this.dateSubmitted = dateSubmitted; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRemark() { return remark; }
    public void setRemark(String remark) { this.remark = remark; }

    public Date getRemarkDate() { return remarkDate; }
    public void setRemarkDate(Date remarkDate) { this.remarkDate = remarkDate; }
}
