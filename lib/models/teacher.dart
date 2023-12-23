class Teacher {
  int employeeId;
  int? dutyTimeId;
  String empName;
  String? fatherName;
  dynamic husbandName;
  String cnicNumber;
  String? gender;
  dynamic bloodGroup;
  dynamic bankId;
  dynamic bankAddress;
  dynamic salaryAccountNo;
  String? designationOnJoining;
  int? joiningPayScale;
  int? currentPayScale;
  int? categoryId;
  int? designationId;
  int? empStatusId;
  DateTime? joiningDate;
  dynamic leavingDate;
  DateTime? birthDate;
  String? birthPlace;
  String? currentDistrict;
  String? currentAddress;
  int? currentPhone;
  dynamic emailAddress;
  String? permanentDistrict;
  String? permanentAddress;
  String? permanentPhone;
  int? religionId;
  dynamic maritalStatusId;
  String? empImage;
  dynamic fingerPrint;
  int? domicileId;
  int? empTypeId;
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
  String? specialization;
  dynamic createdAt;
  dynamic insertedByUserId;
  dynamic updatedByUserId;
  dynamic updatedAt;
  String? religionName;
  String? empDesignation;
  String? empStatus;
  String? empTypeTitle;
  dynamic bankName;
  dynamic dutyShiftId;
  String? timeIn;
  String? timeInend;
  String? timeOutStart;
  String? timeOut;
  int? isActive;
  dynamic dutyShift;
  int? districtId;
  String? districtName;
  int? provinceId;
  String? provinceName;
  String? shortName;
  int? country;
  int? id;
  String? iso;
  String? teacherName;
  String? nicename;
  String? iso3;
  int? numcode;
  int? phonecode;
  int? qualificationId;
  String? qualificationTitle;
  int? professionalEducationId;
  String? name;
  int? specializationId;

  Teacher({
    required this.employeeId,
    this.dutyTimeId,
    required this.empName,
    this.fatherName,
    this.husbandName,
    required this.cnicNumber,
    this.gender,
    this.bloodGroup,
    this.bankId,
    this.bankAddress,
    this.salaryAccountNo,
    this.designationOnJoining,
    this.joiningPayScale,
    this.currentPayScale,
    this.categoryId,
    this.designationId,
    this.empStatusId,
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
    this.religionId,
    this.maritalStatusId,
    this.empImage,
    this.fingerPrint,
    this.domicileId,
    this.empTypeId,
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
    this.insertedByUserId,
    this.updatedByUserId,
    this.updatedAt,
    this.religionName,
    this.empDesignation,
    this.empStatus,
    this.empTypeTitle,
    this.bankName,
    this.dutyShiftId,
    this.timeIn,
    this.timeInend,
    this.timeOutStart,
    this.timeOut,
    this.isActive,
    this.dutyShift,
    this.districtId,
    this.districtName,
    this.provinceId,
    this.provinceName,
    this.shortName,
    this.country,
    this.id,
    this.iso,
    this.teacherName,
    this.nicename,
    this.iso3,
    this.numcode,
    this.phonecode,
    this.qualificationId,
    this.qualificationTitle,
    this.professionalEducationId,
    this.name,
    this.specializationId,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        employeeId: json["EmployeeID"],
        dutyTimeId: json["DutyTimeID"],
        empName: json["EmpName"],
        fatherName: json["FatherName"],
        husbandName: json["HusbandName"],
        cnicNumber: json["CNICNumber"],
        gender: json["Gender"],
        bloodGroup: json["BloodGroup"],
        bankId: json["BankID"],
        bankAddress: json["BankAddress"],
        salaryAccountNo: json["SalaryAccountNo"],
        designationOnJoining: json["DesignationOnJoining"],
        joiningPayScale: json["JoiningPayScale"],
        currentPayScale: json["CurrentPayScale"],
        categoryId: json["CategoryID"],
        designationId: json["DesignationID"],
        empStatusId: json["EmpStatusID"],
        joiningDate: json["JoiningDate"] == null
            ? null
            : DateTime.parse(json["JoiningDate"]),
        leavingDate: json["LeavingDate"],
        birthDate: json["BirthDate"] == null
            ? null
            : DateTime.parse(json["BirthDate"]),
        birthPlace: json["BirthPlace"],
        currentDistrict: json["CurrentDistrict"],
        currentAddress: json["CurrentAddress"],
        currentPhone: json["CurrentPhone"],
        emailAddress: json["EmailAddress"],
        permanentDistrict: json["PermanentDistrict"],
        permanentAddress: json["PermanentAddress"],
        permanentPhone: json["PermanentPhone"],
        religionId: json["ReligionID"],
        maritalStatusId: json["MaritalStatusID"],
        empImage: json["EmpImage"],
        fingerPrint: json["fingerPrint"],
        domicileId: json["DomicileID"],
        empTypeId: json["empTypeID"],
        totalSalary: json["TotalSalary"],
        allowance: json["Allowance"],
        allowanceDetail: json["AllowanceDetail"],
        dayWithOutPay: json["DayWithOutPay"],
        amountWithOutPay: json["AmountWithOutPay"],
        security: json["Security"],
        advSalaryDetail: json["AdvSalaryDetail"],
        advSalaryAmount: json["AdvSalaryAmount"],
        qualification: json["Qualification"],
        professionalEducation: json["ProfessionalEducation"],
        specialization: json["Specialization"],
        createdAt: json["created_at"],
        insertedByUserId: json["InsertedByUserID"],
        updatedByUserId: json["UpdatedByUserID"],
        updatedAt: json["updated_at"],
        religionName: json["ReligionName"],
        empDesignation: json["EmpDesignation"],
        empStatus: json["EmpStatus"],
        empTypeTitle: json["empTypeTitle"],
        bankName: json["BankName"],
        dutyShiftId: json["DutyShiftID"],
        timeIn: json["timeIN"],
        timeInend: json["timeINEND"],
        timeOutStart: json["timeOUTStart"],
        timeOut: json["timeOUT"],
        isActive: json["isActive"],
        dutyShift: json["DutyShift"],
        districtId: json["DistrictID"],
        districtName: json["DistrictName"],
        provinceId: json["ProvinceID"],
        provinceName: json["ProvinceName"],
        shortName: json["ShortName"],
        country: json["Country"],
        id: json["id"],
        iso: json["iso"],
        teacherName: json["name"],
        nicename: json["nicename"],
        iso3: json["iso3"],
        numcode: json["numcode"],
        phonecode: json["phonecode"],
        qualificationId: json["QualificationID"],
        qualificationTitle: json["QualificationTitle"],
        professionalEducationId: json["ProfessionalEducationID"],
        name: json["Name"],
        specializationId: json["SpecializationID"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeID": employeeId,
        "DutyTimeID": dutyTimeId,
        "EmpName": empName,
        "FatherName": fatherName,
        "HusbandName": husbandName,
        "CNICNumber": cnicNumber,
        "Gender": gender,
        "BloodGroup": bloodGroup,
        "BankID": bankId,
        "BankAddress": bankAddress,
        "SalaryAccountNo": salaryAccountNo,
        "DesignationOnJoining": designationOnJoining,
        "JoiningPayScale": joiningPayScale,
        "CurrentPayScale": currentPayScale,
        "CategoryID": categoryId,
        "DesignationID": designationId,
        "EmpStatusID": empStatusId,
        "JoiningDate":
            "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "LeavingDate": leavingDate,
        "BirthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "BirthPlace": birthPlace,
        "CurrentDistrict": currentDistrict,
        "CurrentAddress": currentAddress,
        "CurrentPhone": currentPhone,
        "EmailAddress": emailAddress,
        "PermanentDistrict": permanentDistrict,
        "PermanentAddress": permanentAddress,
        "PermanentPhone": permanentPhone,
        "ReligionID": religionId,
        "MaritalStatusID": maritalStatusId,
        "EmpImage": empImage,
        "fingerPrint": fingerPrint,
        "DomicileID": domicileId,
        "empTypeID": empTypeId,
        "TotalSalary": totalSalary,
        "Allowance": allowance,
        "AllowanceDetail": allowanceDetail,
        "DayWithOutPay": dayWithOutPay,
        "AmountWithOutPay": amountWithOutPay,
        "Security": security,
        "AdvSalaryDetail": advSalaryDetail,
        "AdvSalaryAmount": advSalaryAmount,
        "Qualification": qualification,
        "ProfessionalEducation": professionalEducation,
        "Specialization": specialization,
        "created_at": createdAt,
        "InsertedByUserID": insertedByUserId,
        "UpdatedByUserID": updatedByUserId,
        "updated_at": updatedAt,
        "ReligionName": religionName,
        "EmpDesignation": empDesignation,
        "EmpStatus": empStatus,
        "empTypeTitle": empTypeTitle,
        "BankName": bankName,
        "DutyShiftID": dutyShiftId,
        "timeIN": timeIn,
        "timeINEND": timeInend,
        "timeOUTStart": timeOutStart,
        "timeOUT": timeOut,
        "isActive": isActive,
        "DutyShift": dutyShift,
        "DistrictID": districtId,
        "DistrictName": districtName,
        "ProvinceID": provinceId,
        "ProvinceName": provinceName,
        "ShortName": shortName,
        "Country": country,
        "id": id,
        "iso": iso,
        "name": teacherName,
        "nicename": nicename,
        "iso3": iso3,
        "numcode": numcode,
        "phonecode": phonecode,
        "QualificationID": qualificationId,
        "QualificationTitle": qualificationTitle,
        "ProfessionalEducationID": professionalEducationId,
        "Name": name,
        "SpecializationID": specializationId,
      };
}
