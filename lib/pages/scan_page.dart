import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visting_card_scanner_application/model/contact_models.dart';
import 'package:visting_card_scanner_application/pages/form_page.dart';
import 'package:visting_card_scanner_application/utils/contacts.dart';

class ScanPage extends StatefulWidget {
  static const String routername = "scan";
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isScanOver = false;
  List<String> lines = [];
  String name = "",
      mobile = "",
      email = "",
      address = "",
      company = "",
      designation = "",
      image = "",
      website = '';

  void createContact() {
    final contact = ContactModels(
      name: name,
      mobile: mobile,
      email: email,
      company: company,
      website: website,
      designation: designation,
      address: address,
      image: image,
    );
    context.goNamed(FormPage.routername, extra: contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scan Page"),
        actions: [
          IconButton(
            onPressed: image.isEmpty ? null : createContact,
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text("Capture"),
              ),
              TextButton.icon(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo_album),
                label: const Text("Gallery"),
              ),
            ],
          ),
          if (isScanOver)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    DragTargetIteam(
                      property: ContactProperties.name,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.mobile,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.email,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.company,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.desigination,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.address,
                      onDrop: getPropertyValue,
                    ),
                    DragTargetIteam(
                      property: ContactProperties.website,
                      onDrop: getPropertyValue,
                    ),
                  ],
                ),
              ),
            ),
          if (isScanOver)
            const Padding(padding: EdgeInsets.all(8), child: Text(Hint)),
          Wrap(children: lines.map((lines) => LineIteam(line: lines)).toList()),
        ],
      ),
    );
  }

  void getImage(ImageSource camera) async {
    final xFile = await ImagePicker().pickImage(source: camera);
    if (xFile != null) {
      setState(() {
        image = xFile.path;
      });
      EasyLoading.show(status: "Please wait");
      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );
      final recognizedText = await textRecognizer.processImage(
        InputImage.fromFile(File(xFile.path)),
      );
      EasyLoading.dismiss();
      final templist = <String>[];
      for (var block in recognizedText.blocks) {
        for (var lines in block.lines) {
          templist.add(lines.text);
        }
      }
      setState(() {
        lines = templist;
        isScanOver = true;
      });
    }
  }

  getPropertyValue(String property, String value) {
    switch (property) {
      case ContactProperties.name:
        name = value;
        break;
      case ContactProperties.mobile:
        mobile = value;
        break;
      case ContactProperties.email:
        email = value;
        break;
      case ContactProperties.company:
        company = value;
        break;
      case ContactProperties.address:
        address = value;
        break;
      case ContactProperties.website:
        website = value;
        break;
      case ContactProperties.desigination:
        designation = value;
        break;
    }
  }
}

class LineIteam extends StatelessWidget {
  final String line;
  const LineIteam({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: line,
      dragAnchorStrategy: childDragAnchorStrategy,
      feedback: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.black45),
        child: Text(
          line,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      child: Chip(label: Text(line)),
    );
  }
}

class DragTargetIteam extends StatefulWidget {
  final String property;
  final Function(String, String) onDrop;
  const DragTargetIteam({
    super.key,
    required this.property,
    required this.onDrop,
  });

  @override
  State<DragTargetIteam> createState() => _DragTargetIteamState();
}

class _DragTargetIteamState extends State<DragTargetIteam> {
  String dragiteam = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(widget.property)),
        Expanded(
          flex: 2,
          child: DragTarget<String>(
            builder: (context, candiateData, rejectedData) => Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: candiateData.isNotEmpty
                    ? Border.all(color: Colors.red, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(dragiteam.isEmpty ? "Drop Here" : dragiteam),
                  ),
                  if (dragiteam.isNotEmpty)
                    InkWell(
                      onTap: () {
                        setState(() {
                          dragiteam = "";
                        });
                      },
                      child: Icon(Icons.clear, size: 15),
                    ),
                ],
              ),
            ),
            onAccept: (value) {
              setState(() {
                if (dragiteam.isEmpty) {
                  dragiteam = value;
                } else {
                  dragiteam += "$value";
                }
              });
              widget.onDrop(widget.property, dragiteam);
            },
          ),
        ),
      ],
    );
  }
}
