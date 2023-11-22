import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/transport/controllers/transport_controller.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

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
            color: Pallete.blueColor, // Set the background color
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
                margin: const EdgeInsets.only(
                    bottom: 100.0, left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    Container(
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
                    DetailTile(
                      icon: Icons.bus_alert,
                      subtitle: '${transportData.busNo}',
                      title: 'Bus Number',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.person_outline,
                      subtitle: '${transportData.busDriver}',
                      title: 'Bus Driver',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.phone,
                      subtitle: '${transportData.driverContact}',
                      title: 'Driver Contact',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.admin_panel_settings,
                      subtitle: '${transportData.busIncharge}',
                      title: 'Bus Incharge',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.phone,
                      subtitle: '${transportData.inchargeContact}',
                      title: 'Incharge Contact',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.add_road,
                      subtitle: '${transportData.routeTitle}',
                      title: 'Route',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailTile(
                      icon: Icons.date_range_outlined,
                      subtitle: '${transportData.fromDate}',
                      title: 'From Date',
                    ),
                    const SizedBox(
                      height: 20,
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
}
