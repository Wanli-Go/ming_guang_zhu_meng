import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color fontColor;
  final void Function()? onTap;

  const MyButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.fontColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: fontColor),
            ),
            const SizedBox(
              width: 10,
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class SsdButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SsdButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200, // 指定宽度
        height: 50, // 指定高度
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 163, 187).withOpacity(0.8),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(10), // 根据需要调整padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
              height: 8,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
