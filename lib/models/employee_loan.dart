class EmployeeLoan {
  int? employeeId;
  String? empName;
  String? empDesignation;
  DateTime? date;
  String? amount;
  String? installment;
  String? status;

  EmployeeLoan({
    this.employeeId,
    this.empName,
    this.empDesignation,
    this.date,
    this.amount,
    this.installment,
    this.status,
  });

  factory EmployeeLoan.fromJson(Map<String, dynamic> json) => EmployeeLoan(
    employeeId: json["EmployeeID"],
    empName: json["EmpName"],
    empDesignation: json["EmpDesignation"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    amount: json["Amount"],
    installment: json["Installment"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "EmployeeID": employeeId,
    "EmpName": empName,
    "EmpDesignation": empDesignation,
    "Date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "Amount": amount,
    "Installment": installment,
    "Status": status,
  };
}
