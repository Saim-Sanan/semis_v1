class EmployeeSalary {
  int? employeeId;
  String? empName;
  String? empDesignation;
  List<IncomeHead>? incomeHeads;
  List<dynamic>? deductionHeads;
  String? totalIncome;
  int? totalDeduction;
  int? netAmount;

  EmployeeSalary({
    this.employeeId,
    this.empName,
    this.empDesignation,
    this.incomeHeads,
    this.deductionHeads,
    this.totalIncome,
    this.totalDeduction,
    this.netAmount,
  });

  factory EmployeeSalary.fromJson(Map<String, dynamic> json) => EmployeeSalary(
    employeeId: json["EmployeeID"],
    empName: json["EmpName"],
    empDesignation: json["EmpDesignation"],
    incomeHeads: json["IncomeHeads"] == null ? [] : List<IncomeHead>.from(json["IncomeHeads"]!.map((x) => IncomeHead.fromJson(x))),
    deductionHeads: json["DeductionHeads"] == null ? [] : List<dynamic>.from(json["DeductionHeads"]!.map((x) => x)),
    totalIncome: json["TotalIncome"],
    totalDeduction: json["TotalDeduction"],
    netAmount: json["NetAmount"],
  );

  Map<String, dynamic> toJson() => {
    "EmployeeID": employeeId,
    "EmpName": empName,
    "EmpDesignation": empDesignation,
    "IncomeHeads": incomeHeads == null ? [] : List<dynamic>.from(incomeHeads!.map((x) => x.toJson())),
    "DeductionHeads": deductionHeads == null ? [] : List<dynamic>.from(deductionHeads!.map((x) => x)),
    "TotalIncome": totalIncome,
    "TotalDeduction": totalDeduction,
    "NetAmount": netAmount,
  };
}

class IncomeHead {
  String? accountCode;
  String? accountName;
  String? rate;
  String? status;

  IncomeHead({
    this.accountCode,
    this.accountName,
    this.rate,
    this.status,
  });

  factory IncomeHead.fromJson(Map<String, dynamic> json) => IncomeHead(
    accountCode: json["Account_Code"],
    accountName: json["Account_Name"],
    rate: json["Rate"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Account_Code": accountCode,
    "Account_Name": accountName,
    "Rate": rate,
    "Status": status,
  };
}
