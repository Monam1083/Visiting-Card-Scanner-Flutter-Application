//import 'package:flutter/foundation.dart';

const String tableContact = "tbl_contact";
const String tblContactColId = "id";
const String tblContactColName = "name";
const String tblContactColMobile = "mobile";
const String tblContactColEmail = "email";
const String tblContactColAddress = "address";
const String tblContactColCompany = "company";
const String tblContactColDesignation = "designation";
const String tblContactColWebsite = "website";
const String tblContactColImage = "image";
const String tblContactColFavourite = "favourite";

class ContactModels {
  int id;
  String name;
  String mobile;
  String email;
  String company;
  String website;
  String designation;
  String address;
  String image;
  bool favourite;
  ContactModels({
    this.id = -1,
    required this.name,
    required this.mobile,
    this.email = "",
    this.company = "",
    this.designation = "",
    this.address = "",
    this.website = "",
    this.image = "",
    this.favourite = false,
  });
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblContactColName: name,
      tblContactColMobile: mobile,
      tblContactColEmail: email,
      tblContactColAddress: address,
      tblContactColCompany: company,
      tblContactColDesignation: designation,
      tblContactColWebsite: website,
      tblContactColFavourite: favourite ? 1 : 0,
    };
    if (id > 0) {
      map[tblContactColId] = id;
    }
    return map;
  }

  factory ContactModels.fromMap(Map<String, dynamic> map) => ContactModels(
    id: map[tblContactColId],
    name: map[tblContactColName],
    mobile: map[tblContactColMobile],
    email: map[tblContactColEmail],
    address: map[tblContactColAddress],
    company: map[tblContactColCompany],
    designation: map[tblContactColDesignation],
    website: map[tblContactColWebsite],
    image: map[tblContactColImage],
    favourite: map[tblContactColFavourite],
  );
  @override
  String toString() {
    return "ContactModel{id:$id,name:$name,mobile:$mobile,email:$email,address:$address,company:$company,designation:$designation,website:$website,image:$image,favourite:$favourite}";
  }
}
