class Employee {
  int? employeeID;
  int? dutyTimeID;
  String? empName;
  String? fatherName;
  String? husbandName;
  String? cNICNumber;
  String? gender;
  String? bloodGroup;
  int? bankID;
  String? bankAddress;
  String? salaryAccountNo;
  String? designationOnJoining;
  int? joiningPayScale;
  int? currentPayScale;
  int? categoryID;
  int? designationID;
  int? empStatusID;
  String? joiningDate;
  dynamic leavingDate;
  String? birthDate;
  String? birthPlace;
  String? currentDistrict;
  String? currentAddress;
  int? currentPhone;
  String? emailAddress;
  String? permanentDistrict;
  String? permanentAddress;
  String? permanentPhone;
  int? religionID;
  dynamic maritalStatusID;
  String? empImage;
  dynamic fingerPrint;
  int? domicileID;
  int? empTypeID;
  dynamic totalSalary;
  dynamic allowance;
  dynamic allowanceDetail;
  dynamic dayWithOutPay;
  dynamic amountWithOutPay;
  dynamic security;
  dynamic advSalaryDetail;
  dynamic advSalaryAmount;
  String? qualification;
  String? professionalEducation;
  dynamic specialization;
  dynamic createdAt;
  dynamic insertedByUserID;
  dynamic updatedByUserID;
  dynamic updatedAt;
  String? religionName;
  String? empDesignation;
  String? empStatus;
  String? empTypeTitle;
  String? bankName;
  dynamic dutyShiftID;
  String? timeIN;
  String? timeINEND;
  String? timeOUTStart;
  String? timeOUT;
  int? isActive;
  dynamic dutyShift;
  int? districtID;
  String? districtName;
  int? provinceID;
  String? provinceName;
  String? shortName;
  int? country;
  int? id;
  String? iso;
  String? Name;
  String? nicename;
  String? iso3;
  int? numcode;
  int? phonecode;
  int? qualificationID;
  String? qualificationTitle;
  int? professionalEducationID;
  dynamic name;
  dynamic specializationID;

  Employee(
      {this.employeeID,
        this.dutyTimeID,
        this.empName,
        this.fatherName,
        this.husbandName,
        this.cNICNumber,
        this.gender,
        this.bloodGroup,
        this.bankID,
        this.bankAddress,
        this.salaryAccountNo,
        this.designationOnJoining,
        this.joiningPayScale,
        this.currentPayScale,
        this.categoryID,
        this.designationID,
        this.empStatusID,
        this.joiningDate,
        this.leavingDate,
        this.birthDate,
        this.birthPlace,
        this.currentDistrict,
        this.currentAddress,
        this.currentPhone,
        this.emailAddress,
        this.permanentDistrict,
        this.permanentAddress,
        this.permanentPhone,
        this.religionID,
        this.maritalStatusID,
        this.empImage,
        this.fingerPrint,
        this.domicileID,
        this.empTypeID,
        this.totalSalary,
        this.allowance,
        this.allowanceDetail,
        this.dayWithOutPay,
        this.amountWithOutPay,
        this.security,
        this.advSalaryDetail,
        this.advSalaryAmount,
        this.qualification,
        this.professionalEducation,
        this.specialization,
        this.createdAt,
        this.insertedByUserID,
        this.updatedByUserID,
        this.updatedAt,
        this.religionName,
        this.empDesignation,
        this.empStatus,
        this.empTypeTitle,
        this.bankName,
        this.dutyShiftID,
        this.timeIN,
        this.timeINEND,
        this.timeOUTStart,
        this.timeOUT,
        this.isActive,
        this.dutyShift,
        this.districtID,
        this.districtName,
        this.provinceID,
        this.provinceName,
        this.shortName,
        this.country,
        this.id,
        this.iso,
        this.Name,
        this.nicename,
        this.iso3,
        this.numcode,
        this.phonecode,
        this.qualificationID,
        this.qualificationTitle,
        this.professionalEducationID,
        this.name,
        this.specializationID});

  Employee.fromJson(Map<String, dynamic> json) {
    employeeID = json['EmployeeID'];
    dutyTimeID = json['DutyTimeID'];
    empName = json['EmpName'];
    fatherName = json['FatherName'];
    husbandName = json['HusbandName'];
    cNICNumber = json['CNICNumber'];
    gender = json['Gender'];
    bloodGroup = json['BloodGroup'];
    bankID = json['BankID'];
    bankAddress = json['BankAddress'];
    salaryAccountNo = json['SalaryAccountNo'];
    designationOnJoining = json['DesignationOnJoining'];
    joiningPayScale = json['JoiningPayScale'];
    currentPayScale = json['CurrentPayScale'];
    categoryID = json['CategoryID'];
    designationID = json['DesignationID'];
    empStatusID = json['EmpStatusID'];
    joiningDate = json['JoiningDate'];
    leavingDate = json['LeavingDate'];
    birthDate = json['BirthDate'];
    birthPlace = json['BirthPlace'];
    currentDistrict = json['CurrentDistrict'];
    currentAddress = json['CurrentAddress'];
    currentPhone = json['CurrentPhone'];
    emailAddress = json['EmailAddress'];
    permanentDistrict = json['PermanentDistrict'];
    permanentAddress = json['PermanentAddress'];
    permanentPhone = json['PermanentPhone'];
    religionID = json['ReligionID'];
    maritalStatusID = json['MaritalStatusID'];
    empImage = json['EmpImage'];
    fingerPrint = json['fingerPrint'];
    domicileID = json['DomicileID'];
    empTypeID = json['empTypeID'];
    totalSalary = json['TotalSalary'];
    allowance = json['Allowance'];
    allowanceDetail = json['AllowanceDetail'];
    dayWithOutPay = json['DayWithOutPay'];
    amountWithOutPay = json['AmountWithOutPay'];
    security = json['Security'];
    advSalaryDetail = json['AdvSalaryDetail'];
    advSalaryAmount = json['AdvSalaryAmount'];
    qualification = json['Qualification'];
    professionalEducation = json['ProfessionalEducation'];
    specialization = json['Specialization'];
    createdAt = json['created_at'];
    insertedByUserID = json['InsertedByUserID'];
    updatedByUserID = json['UpdatedByUserID'];
    updatedAt = json['updated_at'];
    religionName = json['ReligionName'];
    empDesignation = json['EmpDesignation'];
    empStatus = json['EmpStatus'];
    empTypeTitle = json['empTypeTitle'];
    bankName = json['BankName'];
    dutyShiftID = json['DutyShiftID'];
    timeIN = json['timeIN'];
    timeINEND = json['timeINEND'];
    timeOUTStart = json['timeOUTStart'];
    timeOUT = json['timeOUT'];
    isActive = json['isActive'];
    dutyShift = json['DutyShift'];
    districtID = json['DistrictID'];
    districtName = json['DistrictName'];
    provinceID = json['ProvinceID'];
    provinceName = json['ProvinceName'];
    shortName = json['ShortName'];
    country = json['Country'];
    id = json['id'];
    iso = json['iso'];
    name = json['name'];
    nicename = json['nicename'];
    iso3 = json['iso3'];
    numcode = json['numcode'];
    phonecode = json['phonecode'];
    qualificationID = json['QualificationID'];
    qualificationTitle = json['QualificationTitle'];
    professionalEducationID = json['ProfessionalEducationID'];
    name = json['Name'];
    specializationID = json['SpecializationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeID'] = this.employeeID;
    data['DutyTimeID'] = this.dutyTimeID;
    data['EmpName'] = this.empName;
    data['FatherName'] = this.fatherName;
    data['HusbandName'] = this.husbandName;
    data['CNICNumber'] = this.cNICNumber;
    data['Gender'] = this.gender;
    data['BloodGroup'] = this.bloodGroup;
    data['BankID'] = this.bankID;
    data['BankAddress'] = this.bankAddress;
    data['SalaryAccountNo'] = this.salaryAccountNo;
    data['DesignationOnJoining'] = this.designationOnJoining;
    data['JoiningPayScale'] = this.joiningPayScale;
    data['CurrentPayScale'] = this.currentPayScale;
    data['CategoryID'] = this.categoryID;
    data['DesignationID'] = this.designationID;
    data['EmpStatusID'] = this.empStatusID;
    data['JoiningDate'] = this.joiningDate;
    data['LeavingDate'] = this.leavingDate;
    data['BirthDate'] = this.birthDate;
    data['BirthPlace'] = this.birthPlace;
    data['CurrentDistrict'] = this.currentDistrict;
    data['CurrentAddress'] = this.currentAddress;
    data['CurrentPhone'] = this.currentPhone;
    data['EmailAddress'] = this.emailAddress;
    data['PermanentDistrict'] = this.permanentDistrict;
    data['PermanentAddress'] = this.permanentAddress;
    data['PermanentPhone'] = this.permanentPhone;
    data['ReligionID'] = this.religionID;
    data['MaritalStatusID'] = this.maritalStatusID;
    data['EmpImage'] = this.empImage;
    data['fingerPrint'] = this.fingerPrint;
    data['DomicileID'] = this.domicileID;
    data['empTypeID'] = this.empTypeID;
    data['TotalSalary'] = this.totalSalary;
    data['Allowance'] = this.allowance;
    data['AllowanceDetail'] = this.allowanceDetail;
    data['DayWithOutPay'] = this.dayWithOutPay;
    data['AmountWithOutPay'] = this.amountWithOutPay;
    data['Security'] = this.security;
    data['AdvSalaryDetail'] = this.advSalaryDetail;
    data['AdvSalaryAmount'] = this.advSalaryAmount;
    data['Qualification'] = this.qualification;
    data['ProfessionalEducation'] = this.professionalEducation;
    data['Specialization'] = this.specialization;
    data['created_at'] = this.createdAt;
    data['InsertedByUserID'] = this.insertedByUserID;
    data['UpdatedByUserID'] = this.updatedByUserID;
    data['updated_at'] = this.updatedAt;
    data['ReligionName'] = this.religionName;
    data['EmpDesignation'] = this.empDesignation;
    data['EmpStatus'] = this.empStatus;
    data['empTypeTitle'] = this.empTypeTitle;
    data['BankName'] = this.bankName;
    data['DutyShiftID'] = this.dutyShiftID;
    data['timeIN'] = this.timeIN;
    data['timeINEND'] = this.timeINEND;
    data['timeOUTStart'] = this.timeOUTStart;
    data['timeOUT'] = this.timeOUT;
    data['isActive'] = this.isActive;
    data['DutyShift'] = this.dutyShift;
    data['DistrictID'] = this.districtID;
    data['DistrictName'] = this.districtName;
    data['ProvinceID'] = this.provinceID;
    data['ProvinceName'] = this.provinceName;
    data['ShortName'] = this.shortName;
    data['Country'] = this.country;
    data['id'] = this.id;
    data['iso'] = this.iso;
    data['name'] = this.name;
    data['nicename'] = this.nicename;
    data['iso3'] = this.iso3;
    data['numcode'] = this.numcode;
    data['phonecode'] = this.phonecode;
    data['QualificationID'] = this.qualificationID;
    data['QualificationTitle'] = this.qualificationTitle;
    data['ProfessionalEducationID'] = this.professionalEducationID;
    data['Name'] = this.name;
    data['SpecializationID'] = this.specializationID;
    return data;
  }
}