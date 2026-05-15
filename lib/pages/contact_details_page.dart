import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:visting_card_scanner_application/model/contact_models.dart';
import 'package:visting_card_scanner_application/provider/contact_provider.dart';

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
      appBar: AppBar(title: const Text("Details")),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => FutureBuilder<ContactModels>(
          future: provider.getContactById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Failed to load data"));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("No contact found"));
            }

            final contact = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                // ── Image ──────────────────────────────────────────────
                Image.file(
                  File(contact.image),
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 8),

                // ── Mobile ─────────────────────────────────────────────
                if (contact.mobile.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(contact.mobile),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: "Call",
                          onPressed: () => _callContact(contact.mobile),
                          icon: const Icon(Icons.call),
                        ),
                        IconButton(
                          tooltip: "SMS",
                          onPressed: () => _smsContact(contact.mobile),
                          icon: const Icon(Icons.sms),
                        ),
                      ],
                    ),
                  ),

                // ── Email ──────────────────────────────────────────────
                if (contact.email.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(contact.email),
                    trailing: IconButton(
                      tooltip: "Send email",
                      onPressed: () => _emailContact(contact.email),
                      icon: const Icon(Icons.send),
                    ),
                  ),

                // ── Address / Map ──────────────────────────────────────
                if (contact.address.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(contact.address),
                    trailing: IconButton(
                      tooltip: "Open in Maps",
                      onPressed: () => _openMap(contact.address),
                      icon: const Icon(Icons.map),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ── Launchers ────────────────────────────────────────────────────────

  Future<void> _callContact(String mobile) async {
    final url = "tel:$mobile";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      _showSnackBar("Could not launch phone app");
    }
  }

  Future<void> _smsContact(String mobile) async {
    final url = "sms:$mobile";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      _showSnackBar("Could not launch SMS app");
    }
  }

  Future<void> _emailContact(String email) async {
    final url = "mailto:$email";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      _showSnackBar("Could not launch mail app");
    }
  }

  Future<void> _openMap(String address) async {
    // Works on both Android (Google Maps) and iOS (Apple Maps)
    final encoded = Uri.encodeComponent(address);
    final url = "https://www.google.com/maps/search/?api=1&query=$encoded";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      _showSnackBar("Could not open Maps");
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
