import 'package:flutter/material.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/child_model.dart';

class ChildProfile extends StatelessWidget {
  final Child child;
  const ChildProfile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                "Personal Details",
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
              DetailTile(
                icon: Icons.numbers,
                subtitle: child.stdId,
                title: 'Roll Number',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.person_outline,
                subtitle: child.fullName,
                title: 'Full Name',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.person,
                subtitle: child.fname,
                title: 'Father Name',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.credit_card,
                subtitle: child.fcnic,
                title: 'Father CNIC',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.create_outlined,
                subtitle: child.className,
                title: 'Class',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.book,
                subtitle: child.sectionName,
                title: 'Section',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.date_range_outlined,
                subtitle: child.dob,
                title: 'Date of Birth',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.phone,
                subtitle: '${child.smobile}',
                title: 'Contact',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.location_on_sharp,
                subtitle: '${child.preAddress}',
                title: 'Current Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
