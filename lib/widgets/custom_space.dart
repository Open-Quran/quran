import 'package:flutter/material.dart';

class CustomSpace extends StatelessWidget {
  static Widget normal() => const CustomSpace(10);

  static Widget big() => const CustomSpace(20);

  static Widget bigger() => const CustomSpace(30);

  const CustomSpace(this.value, {Key? key}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value, width: value);
  }
}
