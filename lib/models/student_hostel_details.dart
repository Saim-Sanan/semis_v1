class StudentHostelDetails {
  String? jDate;
  String? dDate;
  int? currentState;
  int? roomNumber;

  StudentHostelDetails(
      {this.jDate, this.dDate, this.currentState, this.roomNumber});

  StudentHostelDetails.fromJson(Map<String, dynamic> json) {
    jDate = json['JDate'];
    dDate = json['DDate'];
    currentState = json['CurrentState'];
    roomNumber = json['RoomNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JDate'] = this.jDate;
    data['DDate'] = this.dDate;
    data['CurrentState'] = this.currentState;
    data['RoomNumber'] = this.roomNumber;
    return data;
  }
}