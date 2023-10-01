import 'package:flutter/material.dart';
import 'package:semis/constants/pallete.dart';

class FeatureBlock extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const FeatureBlock({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Pallete.secondaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Pallete.blueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
