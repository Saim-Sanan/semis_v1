class ParentNotification {
  String? stdID;
  String? nID;
  String? noticeTitle;
  String? noticeDescription;
  String? issueDate;
  String? closedDate;
  String? status;
  dynamic noticeTypeID;
  dynamic noticetype;

  ParentNotification(
      {this.stdID,
        this.nID,
        this.noticeTitle,
        this.noticeDescription,
        this.issueDate,
        this.closedDate,
        this.status,
        this.noticeTypeID,
        this.noticetype});

  ParentNotification.fromJson(Map<String, dynamic> json) {
    stdID = json['stdID'];
    nID = json['NID'];
    noticeTitle = json['NoticeTitle'];
    noticeDescription = json['NoticeDescription'];
    issueDate = json['IssueDate'];
    closedDate = json['ClosedDate'];
    status = json['Status'];
    noticeTypeID = json['NoticeTypeID'];
    noticetype = json['Noticetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stdID'] = this.stdID;
    data['NID'] = this.nID;
    data['NoticeTitle'] = this.noticeTitle;
    data['NoticeDescription'] = this.noticeDescription;
    data['IssueDate'] = this.issueDate;
    data['ClosedDate'] = this.closedDate;
    data['Status'] = this.status;
    data['NoticeTypeID'] = this.noticeTypeID;
    data['Noticetype'] = this.noticetype;
    return data;
  }
}