import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:visting_card_scanner_application/model/contact_models.dart';
import 'package:visting_card_scanner_application/pages/home_page.dart';
import 'package:visting_card_scanner_application/provider/contact_provider.dart';
import 'package:visting_card_scanner_application/utils/helper_function.dart';

class FormPage extends StatefulWidget {
  static const String routername = "form";
  final ContactModels contactModel;
  const FormPage({super.key, required this.contactModel});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final webController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
        actions: [
          IconButton(onPressed: saveContact, icon: const Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Contact Name",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "this field must not empty";
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: mobileController,
              decoration: InputDecoration(
                labelText: "Mobile Number",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "this field must not empty";
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Street Address",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "this field must not empty";
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: companyController,
              decoration: InputDecoration(
                labelText: "Company Name",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: designationController,
              decoration: InputDecoration(
                labelText: "Designtion",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: webController,
              decoration: InputDecoration(
                labelText: "website",
                icon: Icon(Icons.contact_phone),
              ),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    nameController.text = widget.contactModel.name;
    mobileController.text = widget.contactModel.mobile;
    emailController.text = widget.contactModel.email;
    addressController.text = widget.contactModel.address;
    companyController.text = widget.contactModel.company;
    designationController.text = widget.contactModel.designation;
    webController.text = widget.contactModel.website;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    companyController.dispose();
    designationController.dispose();
    webController.dispose();
    super.dispose();
  }

  void saveContact() async {
    if (_formkey.currentState!.validate()) {
      widget.contactModel.name = nameController.text;
      widget.contactModel.mobile = mobileController.text;
      widget.contactModel.email = emailController.text;
      widget.contactModel.address = addressController.text;
      widget.contactModel.company = companyController.text;
      widget.contactModel.designation = designationController.text;
      widget.contactModel.website = webController.text;

      Provider.of<ContactProvider>(context, listen: false)
          .insertContact(widget.contactModel)
          .then((value) {
            if (value > 0) {
              showMsg(context, "saved");
              context.goNamed(HomePage.routername);
            }
          })
          .catchError((error) {
            showMsg(context, "Failed to save");
          });
    }
  }
}
