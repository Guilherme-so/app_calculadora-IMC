import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo(
      {required this.statusColor,
      required this.statusWeight,
      required this.imc,
      super.key});

  final Color? statusColor;
  final String? statusWeight;
  final double? imc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        border: Border.all(width: 10, color: statusColor!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${imc?.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: statusColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$statusWeight',
              style: TextStyle(
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
