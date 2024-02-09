class EmployeeSalarySlip {
  int? salarySlipId;
  int? employeeId;
  String? empName;
  String? empDesignation;
  DateTime? issueDate;
  DateTime? forMonth;
  List<IncomeHead>? incomeHeads;
  List<dynamic>? deductionHeads;
  dynamic totalIncome;
  int? totalDeduction;
  int? netAmount;

  EmployeeSalarySlip({
    this.salarySlipId,
    this.employeeId,
    this.empName,
    this.empDesignation,
    this.issueDate,
    this.forMonth,
    this.incomeHeads,
    this.deductionHeads,
    this.totalIncome,
    this.totalDeduction,
    this.netAmount,
  });

  factory EmployeeSalarySlip.fromJson(Map<String, dynamic> json) => EmployeeSalarySlip(
    salarySlipId: json["SalarySlipID"],
    employeeId: json["EmployeeID"],
    empName: json["EmpName"],
    empDesignation: json["EmpDesignation"],
    issueDate: json["IssueDate"] == null ? null : DateTime.parse(json["IssueDate"]),
    forMonth: json["ForMonth"] == null ? null : DateTime.parse(json["ForMonth"]),
    incomeHeads: json["IncomeHeads"] == null ? [] : List<IncomeHead>.from(json["IncomeHeads"]!.map((x) => IncomeHead.fromJson(x))),
    deductionHeads: json["DeductionHeads"] == null ? [] : List<dynamic>.from(json["DeductionHeads"]!.map((x) => x)),
    totalIncome: json["TotalIncome"],
    totalDeduction: json["TotalDeduction"],
    netAmount: json["NetAmount"],
  );

  Map<String, dynamic> toJson() => {
    "SalarySlipID": salarySlipId,
    "EmployeeID": employeeId,
    "EmpName": empName,
    "EmpDesignation": empDesignation,
    "IssueDate": "${issueDate!.year.toString().padLeft(4, '0')}-${issueDate!.month.toString().padLeft(2, '0')}-${issueDate!.day.toString().padLeft(2, '0')}",
    "ForMonth": "${forMonth!.year.toString().padLeft(4, '0')}-${forMonth!.month.toString().padLeft(2, '0')}-${forMonth!.day.toString().padLeft(2, '0')}",
    "IncomeHeads": incomeHeads == null ? [] : List<dynamic>.from(incomeHeads!.map((x) => x.toJson())),
    "DeductionHeads": deductionHeads == null ? [] : List<dynamic>.from(deductionHeads!.map((x) => x)),
    "TotalIncome": totalIncome,
    "TotalDeduction": totalDeduction,
    "NetAmount": netAmount,
  };
}

class IncomeHead {
  String? accountName;
  int? rate;

  IncomeHead({
    this.accountName,
    this.rate,
  });

  factory IncomeHead.fromJson(Map<String, dynamic> json) => IncomeHead(
    accountName: json["Account_Name"],
    rate: json["Rate"],
  );

  Map<String, dynamic> toJson() => {
    "Account_Name": accountName,
    "Rate": rate,
  };
}