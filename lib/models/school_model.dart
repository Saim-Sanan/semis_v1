class School {
  String? mobileUsersId;
  String? cnic;
  String? branchId;
  String? schoolName;
  String? branchName;
  String? schoolAddress;
  String? schoolWebAddress;
  String? schoolEmail;
  String? schoolPhoneNo;
  String? status;
  String? schoolLogo;
  String? appApi;
  DateTime? createdAt;
  DateTime? updatedAt;

  School({
    this.mobileUsersId,
    this.cnic,
    this.branchId,
    this.schoolName,
    this.branchName,
    this.schoolAddress,
    this.schoolWebAddress,
    this.schoolEmail,
    this.schoolPhoneNo,
    this.status,
    this.schoolLogo,
    this.appApi,
    this.createdAt,
    this.updatedAt,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        mobileUsersId: json["MobileUsersID"],
        cnic: json["CNIC"],
        branchId: json["BranchID"],
        schoolName: json["school_name"],
        branchName: json["branchName"],
        schoolAddress: json["school_address"],
        schoolWebAddress: json["school_web_address"],
        schoolEmail: json["school_email"],
        schoolPhoneNo: json["school_phone_no"],
        status: json["status"],
        schoolLogo: json["school_logo"],
        appApi: json["AppApi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "MobileUsersID": mobileUsersId,
        "CNIC": cnic,
        "BranchId": branchId,
        "school_name": schoolName,
        "branchName": branchName,
        "school_address": schoolAddress,
        "school_web_address": schoolWebAddress,
        "school_email": schoolEmail,
        "school_phone_no": schoolPhoneNo,
        "status": status,
        "school_logo": schoolLogo,
        "AppApi": appApi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
