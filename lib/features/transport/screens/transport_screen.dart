import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/transport/controllers/transport_controller.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({Key? key}) : super(key: key);

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  final TransportController _transportController =
      Get.put(TransportController());

  @override
  void initState() {
    super.initState();
    _transportController.fetchTransportRecord();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Transport",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
          if (_transportController.isLoading.value) {
            return const AnimatedLoader2();
          } else if (_transportController.transportData.value != null) {
            final transportData = _transportController.transportData.value!;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Transport details",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Pallete.blueColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Divider(
                        thickness: 2,
                        color: Pallete.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Grid for Transport Details
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.count(
                          crossAxisCount: 3, // Two items per row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildDetailBubble(
                              icon: Icons.emoji_transportation_rounded,
                              title: 'Bus',
                              title1: 'Bus Number: ',
                              title2: 'Route: ',
                              data1: '${transportData.busNo}',
                              data2: '${transportData.routeTitle}',
                            ),
                            _buildDetailBubble(
                              icon: Icons.person_outline,
                              title: 'Driver',
                              title1: 'Name: ',
                              title2: 'Contact: ',
                              data1: '${transportData.busDriver}',
                              data2: '${transportData.driverContact}',
                            ),
                            _buildDetailBubble(
                              icon: Icons.admin_panel_settings,
                              title: 'Incharge',
                              title1: 'Name: ',
                              title2: 'Contact: ',
                              data1: '${transportData.busIncharge}',
                              data2: '${transportData.inchargeContact}',
                            ),
                            _buildDetailBubble(
                              icon: Icons.date_range_outlined,
                              title1: 'From Date: ',
                              title2: 'To Date: ',
                              title: 'Date',
                              data1: '${transportData.fromDate}',
                              data2: '',
                            ),
                            _buildDetailBubble(
                              icon: Icons.attach_money,
                              title1: 'Status: ',
                              title2: '',
                              title: 'Fee',
                              data1: 'paid',
                              data2: '',
                            ),
                            _buildDetailBubble(
                              icon: Icons.checklist_rtl_sharp,
                              title1: '',
                              title2: '',
                              title: 'Rules',
                              data1:
                                  'Remain seated\nNo eating (gums, drinks, etc)',
                              data2:
                                  'No fighting\nKeep bus clean\nNo screaming\nNo throwing objects',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Bus Attendance",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Pallete.blueColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Divider(
                        thickness: 2,
                        color: Pallete.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: CalendarDatePicker2(
                          displayedMonthDate: today,
                          config: CalendarDatePicker2Config(
                            firstDayOfWeek: DateTime.monday,
                            currentDate: today,
                            calendarType: CalendarDatePicker2Type.multi,
                            selectableDayPredicate: (DateTime date) => false,
                            selectedDayHighlightColor: Pallete.blueColor,
                          ),
                          value: [today],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text("No data available");
          }
        },
      ),
    );
  }

  void _showDetailDialog(String title, String? title1, String? title2,
      String data1, String? data2) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Pallete.blueColor),
              ),
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title1!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Pallete.blueColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    data1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Pallete.blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    title2!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Pallete.blueColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    data2!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Pallete.blueColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailBubble({
    required IconData icon,
    required String title,
    String? title1,
    String? title2,
    required String data1,
    String? data2,
  }) {
    return GestureDetector(
      onTap: () {
        _showDetailDialog(title, title1!, title2!, data1, data2!);
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Pallete.secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Pallete.blueColor,
              size: 45,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Pallete.blueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
