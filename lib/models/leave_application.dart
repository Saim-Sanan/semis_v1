class LeaveApplication {
  String? leaveId;
  String? type;
  String? cause;
  DateTime? fromDate;
  DateTime? toDate;
  String? status;
  String? employeeId;
  dynamic createdAt;
  dynamic updatesAt;

  LeaveApplication({
    this.leaveId,
    this.type,
    this.cause,
    this.fromDate,
    this.toDate,
    this.status,
    this.employeeId,
    this.createdAt,
    this.updatesAt,
  });

  factory LeaveApplication.fromJson(Map<String, dynamic> json) =>
      LeaveApplication(
        leaveId: json["LeaveID"],
        type: json["Type"],
        cause: json["Cause"],
        fromDate:
            json["FromDate"] == null ? null : DateTime.parse(json["FromDate"]),
        toDate: json["ToDate"] == null ? null : DateTime.parse(json["ToDate"]),
        status: json["Status"],
        employeeId: json["EmployeeID"],
        createdAt: json["created_at"],
        updatesAt: json["updates_at"],
      );

  Map<String, dynamic> toJson() => {
        "LeaveID": leaveId,
        "Type": type,
        "Cause": cause,
        "FromDate": fromDate?.toIso8601String(),
        "ToDate": toDate?.toIso8601String(),
        "Status": status,
        "EmployeeID": employeeId,
        "created_at": createdAt,
        "updates_at": updatesAt,
      };
}
