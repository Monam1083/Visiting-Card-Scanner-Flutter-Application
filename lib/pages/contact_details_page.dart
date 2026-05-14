import 'dart:io';

import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = "details";
  final int id;
  const ContactDetailsPage({super.key, required this.id});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late int id;
  @override
  void initState() {
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          // Image.file(File())
        ],
      ),
    );
  }
}
