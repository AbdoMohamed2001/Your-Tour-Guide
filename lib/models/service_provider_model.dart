import 'package:flutter/material.dart';

class ServicesProviderModel {
  final String name;
  final String fileName;
  final Color containerColor;
  final Widget pushedPage;
  final IconData icon;

  ServicesProviderModel({
    required this.name,
    required this.containerColor,
    required this.pushedPage,
    required this.icon,
    required this.fileName,
  });
}
