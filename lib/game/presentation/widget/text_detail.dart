import 'package:flutter/material.dart';

class BuildTextDetail extends StatelessWidget {
  const BuildTextDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 250,
          child: Text(
            detail,
          ),
        ),
      ],
    );
  }
}
