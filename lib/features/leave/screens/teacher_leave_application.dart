import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/leave/controllers/leave_controller.dart';
import 'package:intl/intl.dart';
import 'package:semis/models/leave_application.dart';

class TeacherLeaveApplication extends StatefulWidget {
  const TeacherLeaveApplication({Key? key}) : super(key: key);

  @override
  State<TeacherLeaveApplication> createState() =>
      _TeacherLeaveApplicationState();
}

class _TeacherLeaveApplicationState extends State<TeacherLeaveApplication> {
  final LeaveController _leaveController = Get.put(LeaveController());

  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedLeaveType = 'Sick Leave';
  DateTime? _toDate;
  DateTime? _fromDate;
  String status = "pending";

  @override
  void initState() {
    super.initState();
    _leaveController.fetchLeaveApplications();
  }

  Future<List<LeaveApplication>> _fetchLeaveApplications() async {
    await _leaveController.fetchLeaveApplications();
    return _leaveController.leaveApplications.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Leaves",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showLeaveFormDialog(context),
            icon: const Icon(Icons.add),
            color: Pallete.whiteColor,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Pallete.blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Get.size * 0.03,
          child: FutureBuilder<List<LeaveApplication>>(
            future: _fetchLeaveApplications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              } else {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Applications: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Pallete.whiteColor,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          "${snapshot.data!.length}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Pallete.whiteColor,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Text('No data');
                }
              }
            },
          ),
        ),
      ),
      body: Obx(
        () {
          return _leaveController.isLoading.value
              ? const AnimatedLoader2()
              : Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _leaveController.leaveApplications.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              isThreeLine: true,
                              tileColor: Pallete.blueColor.withAlpha(20),
                              title: Text(_leaveController
                                      .leaveApplications[index].type ??
                                  'no type'),
                              subtitle: Text(
                                  "${_leaveController.leaveApplications[index].fromDate != null ? DateFormat('dd-MM-yyyy').format(_leaveController.leaveApplications[index].fromDate!) : 'no date'} - ${_leaveController.leaveApplications[index].toDate != null ? DateFormat('dd-MM-yyyy').format(_leaveController.leaveApplications[index].toDate!) : 'no date'}"),
                              trailing: Text(
                                _leaveController
                                            .leaveApplications[index].status !=
                                        null
                                    ? _leaveController.leaveApplications[index]
                                                .status! ==
                                            'pending'
                                        ? 'pending'
                                        : _leaveController
                                                    .leaveApplications[index]
                                                    .status! ==
                                                'approved'
                                            ? 'approved'
                                            : 'rejected'
                                    : 'pending',
                                style: TextStyle(
                                  color: _leaveController
                                              .leaveApplications[index]
                                              .status !=
                                          null
                                      ? _leaveController
                                                  .leaveApplications[index]
                                                  .status! ==
                                              'pending'
                                          ? Colors.blue
                                          : _leaveController
                                                      .leaveApplications[index]
                                                      .status! ==
                                                  'approved'
                                              ? Colors.green
                                              : Colors.red
                                      : Colors
                                          .blue, // Default color for a null status
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  void _showLeaveFormDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // This prevents dismissing by clicking outside
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("New Leave Application"),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red[300],
                ),
                child: IconButton(
                  iconSize: 15,
                  icon: const Icon(
                    Icons.close,
                    color: Pallete.whiteColor,
                  ), // Close button
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedLeaveType,
                  onChanged: (value) {
                    setState(() {
                      _selectedLeaveType = value!;
                    });
                  },
                  items: ["Sick Leave", "Casual Leave"].map((leaveType) {
                    return DropdownMenuItem(
                      value: leaveType,
                      child: Text(leaveType),
                    );
                  }).toList(),
                  decoration: const InputDecoration(labelText: "Leave Type"),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a leave type';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _causeController,
                  decoration: const InputDecoration(
                    hintText: "Cause",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a cause';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onTap: () {
                    _selectDateRange(context);
                  },
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Select Date",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDateRange(context);
                      },
                    ),
                  ),
                  validator: (value) {
                    if (_fromDate == null || _toDate == null) {
                      return 'Please select a date range';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitLeaveApplication();
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: Size(Get.width, 50),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // setState(() {
      _toDate = picked.end;
      _fromDate = picked.start;
      _dateController.text =
          '${DateFormat('dd-MM-yyyy').format(picked.start)} - ${DateFormat('dd-MM-yyyy').format(picked.end)}';
      // });
    }
  }

  void _submitLeaveApplication() async {
    _leaveController.isLoading.value = true;
    await _leaveController.submitLeaveApplication(
      leaveType: _selectedLeaveType,
      cause: _causeController.text,
      toDate: _toDate!,
      fromDate: _fromDate!,
      status: status,
      employeeId: 280, // Replace with the actual employee ID
    );
    _leaveController.isLoading.value = false;
    _causeController.clear();
    _dateController.clear();
  }
}
