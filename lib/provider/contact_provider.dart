import 'package:flutter/foundation.dart';
import 'package:visting_card_scanner_application/db/db_helper.dart';
import 'package:visting_card_scanner_application/model/contact_models.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModels> contactList = [];
  final db = DbHelper();
  Future<int> insertContact(ContactModels contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }

  Future<int> deleteContact(int id) {
    return db.deleteContact(id);
  }
}
