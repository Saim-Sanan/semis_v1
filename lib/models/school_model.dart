
class School {
  int mobileUsersId;
  int cnic;
  int branchId;
  int accessType;
  String schoolName;
  String branchName;
  String schoolAddress;
  String schoolWebAddress;
  String schoolEmail;
  String schoolPhoneNo;
  String? schoolLogo;
  String appApi;
  String branchStatus;
  int? userId;
  DateTime createdAt;
  DateTime updatedAt;

  School({
    required this.mobileUsersId,
    required this.cnic,
    required this.branchId,
    required this.accessType,
    required this.schoolName,
    required this.branchName,
    required this.schoolAddress,
    required this.schoolWebAddress,
    required this.schoolEmail,
    required this.schoolPhoneNo,
    required this.schoolLogo,
    required this.appApi,
    required this.branchStatus,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
    mobileUsersId: json["MobileUsersID"],
    cnic: json["CNIC"],
    branchId: json["BranchID"],
    accessType: json["AccessType"],
    schoolName: json["school_name"],
    branchName: json["branchName"],
    schoolAddress: json["school_address"],
    schoolWebAddress: json["school_web_address"],
    schoolEmail: json["school_email"],
    schoolPhoneNo: json["school_phone_no"],
    schoolLogo: json["school_logo"],
    appApi: json["AppApi"],
    branchStatus: json["BranchStatus"],
    userId: json["UserID"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "MobileUsersID": mobileUsersId,
    "CNIC": cnic,
    "BranchID": branchId,
    "AccessType": accessType,
    "school_name": schoolName,
    "branchName": branchName,
    "school_address": schoolAddress,
    "school_web_address": schoolWebAddress,
    "school_email": schoolEmail,
    "school_phone_no": schoolPhoneNo,
    "school_logo": schoolLogo,
    "AppApi": appApi,
    "BranchStatus": branchStatus,
    "UserID": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
