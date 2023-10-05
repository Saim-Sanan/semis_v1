import 'dart:convert';

List<Child> childFromJson(String str) =>
    List<Child>.from(json.decode(str).map((x) => Child.fromJson(x)));

String childToJson(List<Child> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Child {
  String stdId;
  String fullName;
  String dob;
  String fname;
  String fcnic;
  dynamic preAddress;
  dynamic smobile;
  DateTime admDate;
  String classCode;
  String className;
  String sectionName;
  dynamic picPath;
  String status;

  Child({
    required this.stdId,
    required this.fullName,
    required this.dob,
    required this.fname,
    required this.fcnic,
    required this.preAddress,
    required this.smobile,
    required this.admDate,
    required this.classCode,
    required this.className,
    required this.sectionName,
    required this.picPath,
    required this.status,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        stdId: json["stdID"],
        fullName: json["FullName"],
        dob: json["Dob"],
        fname: json["Fname"],
        fcnic: json["Fcnic"],
        preAddress: json["PreAddress"],
        smobile: json["Smobile"],
        admDate: DateTime.parse(json["AdmDate"]),
        classCode: json["ClassCode"],
        className: json["ClassName"],
        sectionName: json["SectionName"],
        picPath: json["PicPath"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "stdID": stdId,
        "FullName": fullName,
        "Dob": dob,
        "Fname": fname,
        "Fcnic": fcnic,
        "PreAddress": preAddress,
        "Smobile": smobile,
        "AdmDate":
            "${admDate.year.toString().padLeft(4, '0')}-${admDate.month.toString().padLeft(2, '0')}-${admDate.day.toString().padLeft(2, '0')}",
        "ClassCode": classCode,
        "ClassName": className,
        "SectionName": sectionName,
        "PicPath": picPath,
        "Status": status,
      };
}
