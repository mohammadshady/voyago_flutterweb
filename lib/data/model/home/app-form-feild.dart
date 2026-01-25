import 'package:flutter/material.dart';

class AppFormField {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  AppFormField({
    required this.label,
    required this.controller,
    required this.hint,
    required this.validator,
  });
}
