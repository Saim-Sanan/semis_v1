class Transport {
  DateTime? fromDate;
  String? routeTitle;
  String? busNo;
  String? busDriver;
  String? driverContact;
  String? busIncharge;
  String? inchargeContact;

  Transport({
    this.fromDate,
    this.routeTitle,
    this.busNo,
    this.busDriver,
    this.driverContact,
    this.busIncharge,
    this.inchargeContact,
  });

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        fromDate:
            json["FromDate"] == null ? null : DateTime.parse(json["FromDate"]),
        routeTitle: json["routeTitle"],
        busNo: json["busNo"],
        busDriver: json["busDriver"],
        driverContact: json["DriverContact"],
        busIncharge: json["busIncharge"],
        inchargeContact: json["InchargeContact"],
      );

  Map<String, dynamic> toJson() => {
        "FromDate":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "routeTitle": routeTitle,
        "busNo": busNo,
        "busDriver": busDriver,
        "DriverContact": driverContact,
        "busIncharge": busIncharge,
        "InchargeContact": inchargeContact,
      };
}
