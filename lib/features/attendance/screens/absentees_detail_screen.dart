import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
>>>>>>> d43253e82c12cd92d7f514db24da902ee11142d8
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';

class AbsenteesDetailScreen extends StatefulWidget {
  const AbsenteesDetailScreen({Key? key}) : super(key: key);

  @override
  State<AbsenteesDetailScreen> createState() => _AbsenteesDetailScreenState();
}

class _AbsenteesDetailScreenState extends State<AbsenteesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final Map<DateTime, String> data = args['data'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Attendance Details",
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Pallete.blueColor.withAlpha(20),
          ),
          child: ListTile(
            title: Text(
              "${data.keys.elementAt(index).day}-${data.keys.elementAt(index).month}-${data.keys.elementAt(index).year}",
            ),
            trailing: CircleAvatar(
              backgroundColor: data.values.elementAt(index) == "A"
                  ? Colors.red.withAlpha(80)
                  : Colors.amber.withAlpha(80),
              radius: 23,
              child: Text(
                data.values.elementAt(index) == "A" ? "A" : "L",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
