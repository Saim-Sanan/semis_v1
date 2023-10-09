import 'package:flutter/material.dart';
import 'package:semis/constants/pallete.dart';

class DetailTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;
  const DetailTile({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Pallete.blueColor.withAlpha(0),
          radius: 30,
          child: Icon(
            icon,
            color: Pallete.blueColor,
            size: 40,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: Pallete.blueColor,
                  fontSize: 13,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  letterSpacing: 5,
                  fontWeight: FontWeight.w700,
                  color: Pallete.blueColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
