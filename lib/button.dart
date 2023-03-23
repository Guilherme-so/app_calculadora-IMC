import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.statusColor,
    required this.onPressed,
    super.key,
  });

  final Color? statusColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                statusColor ?? Colors.deepOrange[400]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red),
              ),
            )),
        child: const Text('Calcular'),
      ),
    );
  }
}
