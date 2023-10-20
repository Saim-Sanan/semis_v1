import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/leave/controllers/leave_controller.dart';
import 'package:semis/models/leave_application.dart';
import 'package:intl/intl.dart';

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

  RxList<LeaveApplication> leaveApplications = RxList();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedLeaveType;
  DateTime? _selectedDate;

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
      ),
      body: Obx(
        () {
          return _leaveController.isLoading.value
              ? const AnimatedLoader2()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: leaveApplications.length,
                        itemBuilder: (context, index) {
                          final application = leaveApplications[index];
                          return ListTile(
                            title: Text(application.type),
                            subtitle: Text(application.date),
                            trailing: Text(application.status),
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
      builder: (context) {
        return AlertDialog(
            title: const Text("New Leave Application"),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedLeaveType,
                    onChanged: (value) {
                      setState(() {
                        _selectedLeaveType = value;
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
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "From Date",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDateRange(context);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (_selectedDate == null) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitLeaveApplication();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ));
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
      setState(() {
        _selectedDate = picked.start;
        _dateController.text =
            '${DateFormat('yyyy-MM-dd').format(picked.start)} - ${DateFormat('yyyy-MM-dd').format(picked.end)}';
      });
    }
  }

  void _submitLeaveApplication() {
    final newApplication = LeaveApplication(
      type: _selectedLeaveType ?? "", // Use the selected leave type
      cause: _causeController.text,
      date: _dateController.text,
      status: "Pending",
    );
    leaveApplications.add(newApplication);

    // Clear form fields.
    _causeController.clear();
    _dateController.clear();
    _selectedLeaveType = null;

    // You can send the data to your backend or controller here for further processing.
  }
}
