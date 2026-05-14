import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = "details";
  final int id;
  const ContactDetailsPage({super.key, required this.id});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
