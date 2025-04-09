import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final TextStyle? textStyle; // New parameter for text style

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.textStyle, // Accept the textStyle parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        title,
        style:
            textStyle ?? TextStyle(fontSize: 16), // Use textStyle if provided
      ),
    );
  }
}
