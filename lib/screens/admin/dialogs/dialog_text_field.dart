import 'package:flutter/material.dart';

class DialogTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const DialogTextField({
    required this.label,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
